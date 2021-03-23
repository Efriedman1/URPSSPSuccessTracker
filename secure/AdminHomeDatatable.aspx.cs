using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Data;
using URPSSPSuccessTracker.Classes;

namespace URPSSPSuccessTracker
{
    public partial class AdminHomeDatatable : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
               // validateAdmin();
            }

            SqlProcedures procedures = new SqlProcedures();
            if (!IsPostBack)
            {
                this.Master.SetNavBar((String)Session["UserType"]);
                DataSet studentData = procedures.LoadStudents();
                if (studentData.Tables.Count > 0)
                {
                    example.DataSource = studentData;
                    example.DataBind();
                }

            }
            pnlPI.Visible = false;
            pnlStudents.Visible = true;
        }

        public void validateAdmin()
        {

            //get TUID from header after login
            int employeeNumber;
            bool number = false;

            // check if running locally
            if (HttpContext.Current.Request.IsLocal.Equals(true))
            {
                number = int.TryParse(Session["employeeNumber"].ToString(), out employeeNumber);

                if ((String)Session["UserType"] == "Admin" && number)
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
                Response.Write("<script>console.log(\"" + employeeNumber + "\");</script>");

                if ((String)Session["UserType"] == "Admin" && number)
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

        protected void btnPI_Click(object sender, EventArgs e)
        {
            pnlPI.Visible = true;
            pnlStudents.Visible = false;
        }

        protected void btnStudent_Click(object sender, EventArgs e)
        {
            pnlPI.Visible = false;
            pnlStudents.Visible = true;
        }

        protected void populateArrayFile()
        {
            //using (StreamWriter file = File.CreateText())
        }

        protected void btnEmail_Click(object sender, EventArgs e)
        {
            Response.Redirect("AdminSendEmail.aspx");
        }

        protected void btnEmailChecked_Click(object sender, EventArgs e)
        {
            Response.Redirect("AdminSendEmail.aspx");
        }
    }

}
