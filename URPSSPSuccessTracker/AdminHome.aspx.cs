using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace URPSSPSuccessTracker
{
    public partial class AdminHome : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
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
            lblUser.Text = "Principal Investigator";
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

        protected void btnEmailChecked_Click(object sender, EventArgs e)
        {
            Response.Redirect("AdminSendEmail.aspx");
        }

    }
}
