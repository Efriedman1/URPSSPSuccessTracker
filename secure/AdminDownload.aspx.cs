using System;
using System.Collections.Generic;
using System.Data;
using System.Net;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ExcelDataReader;
using URPSSPSuccessTracker.Library;
using URPSSPSuccessTracker.Classes;
using Newtonsoft.Json;


namespace URPSSPSuccessTracker
{
    public partial class AdminDownload : System.Web.UI.Page
    {
        //create a list of student objects created after calling web services
        List<Student> studentList;
        List<string> failedUploads;
        SqlProcedures sql = new SqlProcedures();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                this.Master.SetNavBar((String)Session["UserType"]);
               
            }



        }

        public void validAdmin()
        {
            //get TUID from header after login
            int employeeNumber;
            bool number = false;

            // check if running locally
            if (HttpContext.Current.Request.IsLocal.Equals(true))
            {
                number = int.TryParse(Session["employeeNumber"].ToString(), out employeeNumber);

                if ((String)Session["UserType"] == "PI" && number)
                {
                    //    lblEmail.Text = Session["mail"].ToString();
                    //    lblTUID.Text = employeeNumber.ToString();
                }
                else
                {
                    Response.Redirect("~/default.aspx");
                }
            }
            else
            {
                number = int.TryParse(Session["SSO_Attribute_employeeNumber"].ToString(), out employeeNumber);

                if ((String)Session["UserType"] == "PI" && number)
                {
                    // Search for employeeNumber in student table to see if user is a valid student
                    SqlProcedures sqlProcedures = new SqlProcedures();
                    DataSet ds = sqlProcedures.SearchAdministrator(employeeNumber);

                    if (ds.Tables[0].Rows.Count > 0)
                    {
                        Response.Write("<script>console.log(\"" + employeeNumber + " is admin\");</script>");
                        Console.WriteLine(employeeNumber + " is a admin");
                        // do something with the page

                    }
                    else
                    {
                        Console.WriteLine(employeeNumber + " is NOT a admin! REDIRECT BACK");
                        Response.Write("<script>console.log(\"" + employeeNumber + " is NOT a admin! REDIRECT BACK" + "\");</script>");

                        Session["Authenticated"] = "";
                        Session["UserType"] = "";
                        Session.Abandon();
                        Session.Clear();

                        var master = Master as Master;
                        master.logout();
                        Response.Redirect("~/default.aspx");
                    }
                }
                else
                {
                    Response.Write("<script>console.log(\"" + employeeNumber + "\");</script>");

                    Session["Authenticated"] = "";
                    Session["UserType"] = "";
                    Session.Abandon();
                    Session.Clear();

                    var master = Master as Master;
                    master.logout();
                    Response.Redirect("~/default.aspx");
                }
            }
        }
        protected void btnUpload_Click(object sender, EventArgs e)
        {
            //Check if the file is an xls file
            if (fileUploadTemplate.HasFile)
            {

                //if the file includes xls then use it
                if (validateTemplate.IsValid)
                {

                    //create a new instance of the studentList to hold every student that was uplaoded from the template
                    studentList = new List<Student>();
                    failedUploads = new List<string>();
                    Student student;
                    PrincipalInvestigator principalInvestigator;
                    ResearchProject researchProject;

                    //the file uploaded is valid and begin reading file

                    //read the uploaded excel file
                    IExcelDataReader excelReader = ExcelReaderFactory.CreateOpenXmlReader(fileUploadTemplate.PostedFile.InputStream);
                    DataSet ds = excelReader.AsDataSet();
                    excelReader.Close();

                    System.Data.DataTable dt = ds.Tables[0];

                    //Create a list of strings, each string is a row of data
                    List<String> entryList = new List<string>();

                    int rowCount = dt.Rows.Count;
                    int columnCount = dt.Columns.Count;


                    //Single upload, read through all the fields and create an entry
                    foreach (DataRow dr in dt.Rows)
                    {

                            string entry = dr[0].ToString() + "," + dr[1].ToString() + "," + dr[2].ToString() + "," + dr[3].ToString() + "," + dr[4].ToString() + "," + dr[5].ToString() + "," + dr[6].ToString();
                            entryList.Add(entry);
                        
                    }

                    //now that I have each entry, go through each one and create a student, a PI, and a research project
                    
                    for (int i = 1; i < entryList.Count; i++)
                    {
                        string[] entryArray = entryList[i].Split(',');
                        string studentTUID = entryArray[0];
                        string piTUID = entryArray[2];

                        //call webservices using the student tuid provided to get the student's information
                        WebService.StudentObj studentObj = WebService.Webservice.getStudentInfo(studentTUID);
                        //call webservices using the PI's tuid provided to get the PI's information
                        WebService.LDAPuser piObj = WebService.Webservice.getLDAPEntryByTUID(piTUID);

                        //get the other information needed from the tmplate
                        string program = entryArray[1];
                        string department = entryArray[3];
                        string gradDate = entryArray[4];
                        string researchTitle = entryArray[5];
                        string researchDescription = entryArray[6];

                        //create a student object and add the object from web services and the program
                        student = new Student(studentObj, program, gradDate);

                        //create a principal investigator object  from the web service object and department
                        principalInvestigator = new PrincipalInvestigator(piObj, department, piTUID);

                        //create a new research project
                        researchProject = new ResearchProject(researchTitle, program, researchDescription, piTUID, studentTUID);

                        //add the student, the PI, and the research project to the dtabase
                        //start with the student
                        SqlProcedures sqlProcedures = new SqlProcedures();
                        bool success = sqlProcedures.AddStudent(student);
                        //if the upload fails then add the attempted tuid to a list of failed uploads
                        if (success == false)
                        {
                            failedUploads.Add(student.TUID);
                        }

                        //next add the principal investigator
                        sqlProcedures = new SqlProcedures();
                        success = sqlProcedures.AddPrincipalInvestigator(principalInvestigator);


                        //add the Users to the user table in order to allow them to sign in to the application
                        sqlProcedures = new SqlProcedures();
                        success = sqlProcedures.GiveStudentRole(student.TUID);

                        //add the PI User
                        sqlProcedures = new SqlProcedures();
                        success = sqlProcedures.GivePIRole(principalInvestigator.TUID);

                        //Finally, add the the research project
                        //remember to come back and change the term id to the drop down value
                        sqlProcedures = new SqlProcedures();
                        success = sqlProcedures.InsertResearchProject(researchProject, 1, "FALL", "2020");

                    }

                    //finally add the upload successful label
                    lblError.ForeColor = System.Drawing.Color.Green;
                    lblError.Text = "Upload Successful";
                    lblError.Visible = true;

                 

                }

                else
                {
                    //the file is not valid/ show error message
                    lblError.Text = "Must upload a valid formatted '.xls' file";
                    lblError.Visible = true;
                }

            }

            //If no file was uploaded then put error message
            else
            {
                lblError.Text = "Must upload a valid formatted '.xls' file";
                lblError.Visible = true;
            }
        }

        protected void btnDownload_Click(object sender, EventArgs e)
        {
            string fileName = "URP_SSP_UploadTemplate.xlsx";
            string filePath = Server.MapPath("~/" + fileName);
            HttpContext.Current.Response.Clear();
            HttpContext.Current.Response.ClearHeaders();
            HttpContext.Current.Response.ClearContent();
            HttpContext.Current.Response.Buffer = true;
            HttpContext.Current.Response.AddHeader("Content-Disposition", "attachment; filename =" + fileName);
            HttpContext.Current.Response.ContentType = "application/x-msexcel";
            HttpContext.Current.Response.Flush();
            HttpContext.Current.Response.TransmitFile(filePath);
            HttpContext.Current.Response.End();
            HttpContext.Current.Response.Close();

        }
    }
}