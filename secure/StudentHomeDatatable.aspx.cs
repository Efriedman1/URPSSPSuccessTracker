using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using URPSSPSuccessTracker.Classes;

namespace URPSSPSuccessTracker
{
    public partial class StudentHomeDatatable : System.Web.UI.Page
    {
        int employeeNumber = 741258963;

        SqlProcedures procedures = new SqlProcedures();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {                
               // bool local = Session["Local"].ToString() == "true";


            }
            if (Session["SSO_Attribute_employeeNumber"] != null)
            {
                employeeNumber = Convert.ToInt32(Session["SSO_Attribute_employeeNumber"]);
            }
            
            DataSet projectData = procedures.LoadResearchProjects(employeeNumber.ToString());
            gvStudent.DataSource = projectData;
            //add the research ID to the datakeys collection so that the correct
            //research will be loaded on the view research page
            string[] names = new string[1];
            names[0] = "ResearchID";
            gvStudent.DataKeyNames = names;
            Label9.Text = Session["SSO_Attribute_employeeNumber"].ToString();
            Label4.Text = Session["SSO_Attribute_mail"].ToString();
            gvStudent.DataBind();
            gvStudent.Columns[4].Visible = false;
        }

        public void validateStudent()
        {
            //get TUID from header after login
            bool number = false;

            // check if running locally
            if (HttpContext.Current.Request.IsLocal.Equals(true))
            {
                number = int.TryParse(Session["employeeNumber"].ToString(), out employeeNumber);

                if ((String)Session["UserType"] == "Student" && number)
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

                if ((String)Session["UserType"] == "Student" && number)
                {
                    // Search for employeeNumber in student table to see if user is a valid student
                    SqlProcedures sqlProcedures = new SqlProcedures();
                    DataSet ds = sqlProcedures.SearchStudent(employeeNumber, "", "", "", "", "");

                    if (ds.Tables[0].Rows.Count > 0)
                    {
                        Response.Write("<script>console.log(\"" + employeeNumber + " is Student\");</script>");
                        Console.WriteLine(employeeNumber + " is a PI");
                        // do something with the page

                    }
                    else
                    {
                        Console.WriteLine(employeeNumber + " is NOT a Student! REDIRECT BACK");
                        Response.Write("<script>console.log(\"" + employeeNumber + " is NOT a Student! REDIRECT BACK" + "\");</script>");

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

        protected void gvStudents_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            string[] headers = { "PI", "Project Title", "Term", "Last Update", "", ""};
            if (e.Row.RowType == DataControlRowType.Header)
            {
                for (int i = 0; i < e.Row.Cells.Count; i++)
                {
                    e.Row.Cells[i].Text = headers[i];
                }
                e.Row.TableSection = TableRowSection.TableHeader;
            }
            else
            {

            }
        }

        protected void gvStudent_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            int rowIndex = Convert.ToInt32(e.CommandArgument.ToString());

            if (e.CommandName == "View")
            {
                int researchID = int.Parse(gvStudent.DataKeys[rowIndex].Value.ToString());
                Session.Add("researchID", researchID);
                Session.Add("StudentTUID",Session["employeeNumber"].ToString());
                Response.Redirect("PIViewStudentResearch.aspx");
            }
        }
    }
}