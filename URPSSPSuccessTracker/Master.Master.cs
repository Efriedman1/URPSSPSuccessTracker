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
            Response.Redirect("TempLogin.aspx");
        }

        protected void lbUploadUsers_Click(object sender, EventArgs e)
        {

        }

        public void SetNavBar(String userType)
        {
            System.Diagnostics.Debug.Print(userType);
            if (userType == "Admin")
            {
                btnLogout.Visible = true;
                lbManageUsers.Visible = true;
                lbSearch.Visible = true;
                lbUploadUsers.Visible = true;
                lblUserName.Text = "Sample User";
                lblUserType.Text = "Admin";
            }

            if (userType == "Student")
            {
                btnLogout.Visible = true;
                lbManageUsers.Visible = false;
                lbSearch.Visible = false;
                lbUploadUsers.Visible = false;
                lblUserName.Text = "Sample User";
                lblUserType.Text = "Student";
            }
            if (userType == "PI")
            {
                btnLogout.Visible = true;
                lbManageUsers.Visible = false;
                lbSearch.Visible = false;
                lbUploadUsers.Visible = false;
                lblUserName.Text = "Sample User";
                lblUserType.Text = "Principal Investigator";
            }
            if (userType == "")
            {
                btnLogout.Visible = false;
                lbManageUsers.Visible = false;
                lbSearch.Visible = false;
                lbUploadUsers.Visible = false;
                lblUserName.Text = "Sample User";
                lblUserType.Text = "";
            }
        }

        public String UserName
        {
            get
            {
                return lblUserName.Text;
            }
            set
            {
                lblUserName.Text = value;
            }
        }

        public String UserType
        {
            get
            {
                return lblUserType.Text;
            }
            set
            {
                lblUserType.Text = value;
            }
        }

        public Boolean SearchVisibility
        {
            get
            {
                return lbSearch.Visible;
            }
            set
            {
                lbSearch.Visible = value;
            }
        }
        public Boolean ManageUsersVisibility
        {
            get
            {
                return lbManageUsers.Visible;
            }
            set
            {
                lbManageUsers.Visible = value;
            }
        }

        public Boolean UploadUsersVisibility
        {
            get
            {
                return lbUploadUsers.Visible;
            }
            set
            {
                lbUploadUsers.Visible = value;
            }
        }

        public Boolean LogoutVisibility
        {
            get
            {
                return btnLogout.Visible;
            }
            set
            {
                btnLogout.Visible = true;
            }
        }
        
    }
}