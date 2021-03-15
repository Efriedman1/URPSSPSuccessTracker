using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using URPSSPSuccessTracker.Classes;

namespace URPSSPSuccessTracker
{
    public partial class AdminHome : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (Session["Authenticated"] == null || Session["Authenticated"].ToString() == "false")
                {
                    //Response.Redirect("~/default.aspx");
                }

            }
            catch (Exception ex)
            {

               // Response.Redirect("~/default.aspx");
            }


            if (!IsPostBack)
            {
                bool local = Session["Local"].ToString() == "true";
                //get TUID from header after login
                int employeeNumber;
                bool number = false;

                // check if running locally
                if (local)
                {
                    number = int.TryParse(Session["employeeNumber"].ToString(), out employeeNumber);

                    if ((String)Session["UserType"] == "Admin" && number)
                    {

                    }
                    else
                    {
                        //Response.Redirect("~/default.aspx");
                    }
                }
                else
                {
                    number = int.TryParse(Session["SSO_Attribute_employeeNumber"].ToString(), out employeeNumber);
                    Console.WriteLine(number);
                    /*
                    if ((String)Session["UserType"] == "Admin" && number)
                    {
                        // Search for employeeNumber in student table to see if user is a valid student
                        SqlProcedures sqlProcedures = new SqlProcedures();
                        DataSet ds = sqlProcedures.SearchStudent(employeeNumber, "", "", "", "", "");
                        if (ds.Tables[0].Rows.Count > 0)
                        {
                            Console.WriteLine(employeeNumber + " is an admin");
                            // do something with the page

                        }
                        else
                        {
                            //Response.Redirect("~/default.aspx");
                        }
                    }
                    else
                    {
                        //Response.Redirect("~/default.aspx");
                    }*/
                }

                this.Master.SetNavBar((String)Session["UserType"]);
                pnlPI.Visible = false;
                btnStudent.Enabled = false;
                lblUser.Text = "Students";

                pnlStudentSearch.Visible = true;
                pnlPISearch.Visible = false;
            }

        }

        protected void Button4_Click(object sender, EventArgs e)
        {
            //Response.Redirect("AdminSearchStudent.aspx");
            lblUser.Text = "Students";
            btnStudent.Enabled = false;
            btnPI.Enabled = true;
            pnlStudent.Visible = true;
            pnlPI.Visible = false;
            pnlPISearch.Visible = false;
            pnlStudentSearch.Visible = true;
            
        }

        protected void Button5_Click(object sender, EventArgs e)
        {
            lblUser.Text = "Principal Investigators";
            btnPI.Enabled = false;
            btnStudent.Enabled = true;
            pnlStudent.Visible = false;
            pnlPI.Visible = true;
            pnlStudentSearch.Visible = false;
            pnlPISearch.Visible = true;
        }

        protected void btnEmail_Click(object sender, EventArgs e)
        {
            Response.Redirect("AdminSendEmail.aspx");
        }

        protected void btnSelected_Click(object sender, EventArgs e)
        {
            Response.Redirect("PIHome.aspx");
        }

        protected void btnSelected2_Click(object sender, EventArgs e)
        {
            Response.Redirect("PIViewStudentResearch.aspx");
        }

        protected void btnEmailChecked_Click(object sender, EventArgs e)
        {

            Response.Redirect("AdminSendEmail.aspx");
        }

    }
}
