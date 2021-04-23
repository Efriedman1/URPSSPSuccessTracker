using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using URPSSPSuccessTracker.Classes;
using URPSSPSuccessTracker.Library;
using System.Configuration;

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
                //Instruction instruction = sqlProcedures.LoadInstructions(2);
                //lblInstructions.Text = instruction.Body;

                getTerms();
                getAdmins();
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
                getAdmins();
                getTerms();
                //ClientScript.RegisterStartupScript(this.GetType(), "redraw", "redraw();", true);
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
        /*
        protected void gvTerms_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int termID = Convert.ToInt32(gvTerms.DataKeys[e.RowIndex].Value.ToString());
            SqlProcedures sqlProcedures = new SqlProcedures();
            bool success = sqlProcedures.DeleteTerm(termID);
            if (success)
            {
                getTerms();

            }
        }*/

        protected void AddAdminModal_Click(object sender, EventArgs e)
        {
            Administrator administrator = getProfileFromTUID(int.Parse(txtTUID.Text));
            if (administrator == null)
            {
                lblNoUser.Visible = true;
            }
            else
            {
                int tuID = administrator.TUID;
                string firstName = administrator.FirstName;
                string lastName = administrator.LastName;
                string email = administrator.Email;
                string active = administrator.Active;

                lblTUID.Text = tuID.ToString();
                lblFirstName.Text = firstName;
                lblLastName.Text = lastName;

                ClientScript.RegisterStartupScript(this.GetType(), "modal1", "ShowPopup();", true);
            }
        }

        protected Administrator getProfileFromTUID(int tuID)
        {
            WebService.LDAPuser Temple_Information = WebService.Webservice.getLDAPEntryByTUID(tuID.ToString());
            Administrator administrator = null;

            if (Temple_Information != null)
            {
                string firstName = Temple_Information.givenName;
                string lastName = Temple_Information.sn;
                string email = Temple_Information.mail;
                string active = "Active";

                administrator = new Administrator(tuID, firstName, lastName, email, active);
            }
            return administrator;
        }

        protected void btnModalAddAdmin_Click(object sender, EventArgs e)
        {
            Administrator administrator = getProfileFromTUID(int.Parse(txtTUID.Text));

            int tuID = administrator.TUID;
            string firstName = administrator.FirstName;
            string lastName = administrator.LastName;
            string email = administrator.Email;
            string active = administrator.Active;

            SqlProcedures sqlProcedures = new SqlProcedures();
            bool success = sqlProcedures.AddAdministrator(tuID, firstName, lastName, email, active);
            if (success)
            {
                sqlProcedures.GiveAdminRole(tuID.ToString());
                getAdmins();
                getTerms();
                //ClientScript.RegisterStartupScript(this.GetType(), "redraw", "redraw();", true);

            }
            lblNoUser.Visible = false;
            txtTUID.Text = "";
        }

        protected void getAdmins()
        {
            SqlProcedures sqlProcedures = new SqlProcedures();
            DataSet administrators = sqlProcedures.LoadAdministrator();
            gvAdministrators.DataSource = administrators;
            gvAdministrators.DataBind();
        }
       /*
        protected void gvAdministrators_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int tuID = Convert.ToInt32(gvAdministrators.DataKeys[e.RowIndex].Value.ToString());
            SqlProcedures sqlProcedures = new SqlProcedures();
            bool success = sqlProcedures.DeleteAdministrator(tuID);
            if (success)
            {
                getAdmins();
            }
        }
        */
        
        protected void gvAdministrators_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            GridViewRow row = (GridViewRow)((Button)e.CommandSource).NamingContainer;
            int tuID = Convert.ToInt32(gvAdministrators.DataKeys[row.RowIndex].Value.ToString());
            SqlProcedures sqlProcedures = new SqlProcedures();
            bool success = false;
            switch (e.CommandName)
            {
                case "DeleteAdmin":
                    success = sqlProcedures.DeleteAdministrator(tuID);
                    if (success)
                    {
                        getAdmins();
                        getTerms();
                    }
                    break;
                case "EditAdmin":
                    success = sqlProcedures.ChangeAdministratorActive(tuID);
                    if (success)
                    {
                        getAdmins();
                        getTerms();
                    }
                    break;
            }
        }

        protected void gvTerms_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            GridViewRow row = (GridViewRow)((Button)e.CommandSource).NamingContainer;
            int termID = Convert.ToInt32(gvTerms.DataKeys[row.RowIndex].Value.ToString());
            SqlProcedures sqlProcedures = new SqlProcedures();
            bool success = false;
            switch (e.CommandName)
            {
                case "EditStatus":
                    success = sqlProcedures.ChangeTermStatus(termID);
                    if (success)
                    {
                        getTerms();
                        getAdmins();
                    }
                    break;

                case "ChangeToCurrent":
                    success = sqlProcedures.ChangeCurrentTermTo(termID);
                    if (success)
                    {
                        getTerms();
                        getAdmins();
                    }
                    break;

                case "DeleteTerm":
                    success = sqlProcedures.DeleteTerm(termID);
                    if (success)
                    {
                        getTerms();
                    }
                    break;
            }
        }

        protected void gvAdministrators_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.Header)
            {
                //add the thead and tbody section programatically
                e.Row.TableSection = TableRowSection.TableHeader;
            }
        }

        protected void gvTerms_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.Header)
            {
                //add the thead and tbody section programatically
                e.Row.TableSection = TableRowSection.TableHeader;
            }
        }
    }
}