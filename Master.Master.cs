using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace URPSSPSuccessTracker
{
    public partial class Master : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnLogout_Click(object sender, EventArgs e)
        {
            Session["UserType"] = "";
            Response.Redirect("../TempLogin.aspx");
        }

        public void SetNavBar(String userType)
        {
            if (userType == "Admin")
            {
                btnLogout.Visible = true;
                btnManageUsers.Visible = true;
                btnSearch.Visible = true;
                btnUploadUsers.Visible = true;
                lblUserName.Text = "Rose McGinnis";
            }

            if (userType == "Student")
            {
                btnLogout.Visible = true;
                btnManageUsers.Visible = false;
                btnSearch.Visible = false;
                btnUploadUsers.Visible = false;
                lblUserName.Text = "John Doe";
            }

            if (userType == "PI")
            {
                btnLogout.Visible = true;
                btnManageUsers.Visible = false;
                btnSearch.Visible = false;
                btnUploadUsers.Visible = false;
                lblUserName.Text = "Bill Perkins";
            }

            if (userType == "")
            {
                btnLogout.Visible = false;
                btnManageUsers.Visible = false;
                btnSearch.Visible = false;
                btnUploadUsers.Visible = false;
                lblUserName.Text = "";
                lblUserType.Text = "";
            }
        }

        protected void btnUploadUsers_Click(object sender, EventArgs e)
        {
            Response.Redirect("AdminDownload.aspx");
        }

        protected void btnManageUsers_Click(object sender, EventArgs e)
        {
            Response.Redirect("AdminManageUsers.aspx");
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            Response.Redirect("AdminHome.aspx");
        }
    }
}