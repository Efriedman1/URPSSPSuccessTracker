using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using URPSSPSuccessTracker.Classes;
using System.Data;
using System.Data.SqlClient;

namespace URPSSPSuccessTracker
{
    public partial class StudentHome : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
               // validateStudent();
                bool local = Session["Local"].ToString() == "true";

                this.Master.SetNavBar((String)Session["UserType"]);
            }
        }
        public void validateStudent()
        {

            //get TUID from header after login
            int employeeNumber;
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

        protected void btnSelectTerm1_Click(object sender, EventArgs e)
        {
            Response.Redirect("PIViewStudentResearch.aspx");
        }
        protected void btnSelectTerm2_Click(object sender, EventArgs e)
        {
            Response.Redirect("PIViewStudentResearch.aspx");
        }
        protected void btnSelectTerm3_Click(object sender, EventArgs e)
        {
            Response.Redirect("PIViewStudentResearch.aspx");
        }
        protected void btnSelectTerm4_Click(object sender, EventArgs e)
        {
            Response.Redirect("PIViewStudentResearch.aspx");
        }
        protected void btnSelectTerm5_Click(object sender, EventArgs e)
        {
            Response.Redirect("PIViewStudentResearch.aspx");
        }

    }
}