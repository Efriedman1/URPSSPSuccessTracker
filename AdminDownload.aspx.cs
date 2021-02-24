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
using Newtonsoft.Json;


namespace URPSSPSuccessTracker
{
    public partial class AdminDownload : System.Web.UI.Page
    {
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

                    string[] entryArray = entryList[1].Split(',');

                    object student = WebService.Webservice.getStudentInfo(entryArray[0]);


                    lblError.Text = JsonConvert.SerializeObject(student, Formatting.Indented).ToString();
                    lblError.Visible = true;

                    //Now that all the entries have been added to the list
                    //seperate the tuid and the other parameter that are joined with ','
                    //foreach (string entry in entryList)
                    //{
                    //   string[] entryArray =  entry.Split(',');

                    //    WebService.StudentObj student = WebService.Webservice.getStudentInfo(entryArray[0]);


                    //}

                    //



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