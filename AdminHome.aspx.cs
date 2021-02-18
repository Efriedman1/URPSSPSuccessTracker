using System;
using System.Collections.Generic;
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
            if (!IsPostBack)
            {
                this.Master.SetNavBar((String)Session["UserType"]);
                pnlPI.Visible = false;
                btnStudent.Enabled = false;
                lblUser.Text = "Students";

                pnlStudentSearch.Visible = true;
                pnlPISearch.Visible = false;

                //Update instruction label
                SqlProcedures sqlProcedures = new SqlProcedures();
                Instruction instruction = sqlProcedures.LoadInstructions(1);
                lblInstructions.Text = instruction.Body;
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
