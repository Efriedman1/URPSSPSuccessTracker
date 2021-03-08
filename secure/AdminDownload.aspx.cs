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
        List<Student> failedUploads;
        SqlProcedures sql = new SqlProcedures();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                this.Master.SetNavBar((String)Session["UserType"]);
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
                    failedUploads = new List<Student>();
                    Classes.Student student;

                    //the file uploaded is valid and begin reading file
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


                    foreach (DataRow dr in dt.Rows)
                    {
                        //if the student checkbox is selected, only get the tuid and student type
                        if (optStudent.Checked == true)
                        {
                            string entry = dr[0].ToString() + "," + dr[1].ToString();
                            entryList.Add(entry);

                        }


                        //else, that means the PI checkbox is selected, get the tuid and department
                        else if (optPI.Checked == true)
                        {
                            string entry = dr[0].ToString() + "," + dr[2].ToString();
                            entryList.Add(entry);
                        }


                    }

                    if (optStudent.Checked == true)
                    {
                        for (int i = 1; i < entryList.Count; i++)
                        {
                            string[] entryArray = entryList[i].Split(',');
                            WebService.StudentObj studentObj = WebService.Webservice.getStudentInfo(entryArray[0]);
                            string program = entryArray[1];

                            //create a student object and add the object from web services and the program
                            student = new Student(studentObj, program);

                            //add this new student object to a list of all students uploaded from the template
                            studentList.Add(student);

                            //upload to the database
                            //foreach (Student s in studentList)
                            //{

                            //    string tuid = s.StudentObj.tuid;
                            //    string firstName = s.StudentObj.firstName;
                            //    string lastName = s.StudentObj.lastName;
                            //    string email = s.StudentObj.email;
                            //    string program = s.Program;
                            //    string

                            //    bool addStudent = sql.AddStudent();

                            //    if (addStudent == false)
                            //    {
                            //        failedUploads.Add(s);
                            //    }
                            //}

                        }
                    }

                    else if (optPI.Checked == true)
                    {

                    }






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
    }
}