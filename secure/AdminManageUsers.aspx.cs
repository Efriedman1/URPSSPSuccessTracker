using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using URPSSPSuccessTracker.Classes;

namespace URPSSPSuccessTracker
{
    public partial class AdminManageUsers : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                this.Master.SetNavBar((String)Session["UserType"]);


                //Update instruction label
                SqlProcedures sqlProcedures = new SqlProcedures();
                Instruction instruction = sqlProcedures.LoadInstructions(2);
                lblInstructions.Text = instruction.Body;

                getTerms();
            }

        }

        protected void btnCreateTerm_Click(object sender, EventArgs e)
        {
            string semester = ddlSemester.SelectedValue;
            int year = int.Parse(txtYear.Text);
            SqlProcedures sqlProcedures = new SqlProcedures();
            bool success = sqlProcedures.AddTerm(semester, year);
            if (success)
            {
                getTerms();
            }

        }

        protected void getTerms()
        {
            SqlProcedures sqlProcedures = new SqlProcedures();
            DataSet ds = new DataSet();
            ds = sqlProcedures.GetAllTerms();
            gvTerms.DataSource = ds;
            gvTerms.DataBind();
        }

        protected void gvTerms_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int termID = Convert.ToInt32(gvTerms.DataKeys[e.RowIndex].Value.ToString());
            SqlProcedures sqlProcedures = new SqlProcedures();
            bool success = sqlProcedures.DeleteTerm(termID);
            if (success)
            {
                getTerms();

            }
        }
    }
}