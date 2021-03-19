using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Data;
using URPSSPSuccessTracker.Classes;
using System.Web.Services;

namespace URPSSPSuccessTracker
{
    public partial class AdminHomeDatatable : System.Web.UI.Page
    {
        SqlProcedures procedures = new SqlProcedures();
        List<string> selectedTuids;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                this.Master.SetNavBar((String)Session["UserType"]);

                
            }
            pnlPI.Visible = false;
            pnlStudents.Visible = true;
            populateDataTable();
        }

        protected void populateDataTable()
        {
            DataSet studentData = procedures.LoadStudents();
            if (studentData.Tables.Count > 0)
            {
                gvStudents.DataSource = studentData;
                gvStudents.DataBind();
            }
        }

        protected void SetSelectedTuids(List<string> selected)
        {
            selectedTuids = selected;
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
            List<string> tuidList = new List<string>();
            for (int i = 0; i < gvStudents.Rows.Count; i++)
            {
                if (gvStudents.Rows[i].CssClass.Contains("selected"))
                {
                    tuidList.Add(gvStudents.Rows[i].Cells[0].ToString());
                }
            }
            System.Diagnostics.Debug.Print(tuidList.Count.ToString());

            //Response.Redirect("AdminSendEmail.aspx");
        }

        protected void example_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.Header)
            {
                e.Row.TableSection = TableRowSection.TableHeader;
            }
        }
    }

}
