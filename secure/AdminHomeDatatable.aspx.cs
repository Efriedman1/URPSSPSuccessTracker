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
