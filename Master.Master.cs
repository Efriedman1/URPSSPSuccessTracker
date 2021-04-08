using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;

namespace URPSSPSuccessTracker
{
    public partial class Master : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Secure_My_Session();

            if (Session["Full_Name"] != null)
            {
                lblUserName.Text = Session["Full_Name"].ToString();
            }
            else
            {
                lblUserName.Text = string.Empty;
            }
            CheckPageRemoveTermDropdown();            
        }

        protected void Secure_My_Session()
        {
            if (Response.Cookies.Count > 0)
            {
                foreach (string s in Response.Cookies.AllKeys)
                {
                    if (s == FormsAuthentication.FormsCookieName || s.ToLower() == "asp.net_sessionid")
                    {
                        Response.Cookies[s].Secure = true;
                    }
                }
            }
        }

        protected void btnLogout_Click(object sender, EventArgs e)
        {
            
            Session.Abandon();
            Session.Clear();
            if (HttpContext.Current.Request.IsLocal.Equals(false))
            {
                string domain = Request.Url.Host;
                Response.Redirect("https://" + domain + "/Shibboleth.sso/Logout?return=https://" + GetFimEnvironment(domain) + ".temple.edu/idp/profile/Logout");
            }
            //Response.Redirect("~/default.aspx");
        }

        public void logout()
        {
            Session.Abandon();
            Session.Clear();
            if (HttpContext.Current.Request.IsLocal.Equals(false))
            {
                string domain = Request.Url.Host;
                Response.Redirect("https://" + domain + "/Shibboleth.sso/Logout?return=https://" + GetFimEnvironment(domain) + ".temple.edu/idp/profile/Logout");
            }
        }

        private string GetFimEnvironment(string domain)
        {
            switch (domain)
            {
                case "np-stem.temple.edu":
                case "pre-stem.temple.edu":
                    return "np-fim";
                default:
                    return "fim";
            }
        }


        public void SetNavBar(String userType)
        {
            if (userType == "Admin")
            {
                btnLogout.Visible = true;
                btnManageUsers.Visible = true;
                btnSearch.Visible = true;
                btnUploadUsers.Visible = true;
                //lblUserName.Text = Session["Full_Name"].ToString();
            }

            if (userType == "Student")
            {
                btnLogout.Visible = true;
                btnManageUsers.Visible = false;
                btnSearch.Visible = false;
                btnUploadUsers.Visible = false;
                //lblUserName.Text = "John Doe";
            }

            if (userType == "PI")
            {
                btnLogout.Visible = true;
                btnManageUsers.Visible = false;
                btnSearch.Visible = false;
                btnUploadUsers.Visible = false;
                //lblUserName.Text = "Bill Perkins";
            }

            if (userType == "")
            {
                btnLogout.Visible = false;
                btnManageUsers.Visible = false;
                btnSearch.Visible = false;
                btnUploadUsers.Visible = false;
                //lblUserName.Text = "";
                //lblUserType.Text = "";
            }
        }

        public void CheckPageRemoveTermDropdown()
        {
            System.Diagnostics.Debug.Print(HttpContext.Current.Request.Url.AbsolutePath);
            if (HttpContext.Current.Request.Url.AbsolutePath.EndsWith("/secure/TempLogin.aspx") || HttpContext.Current.Request.Url.AbsolutePath.EndsWith("/secure/AdminManageUsers.aspx")
                || HttpContext.Current.Request.Url.AbsolutePath.EndsWith("/secure/AdminDownload.aspx") || HttpContext.Current.Request.Url.AbsolutePath.EndsWith("/secure/AdminSendEmail.aspx"))
            {
                DropDownList2.Visible = false;
                lblTerm.Visible = false;
            }
            else
            {
                DropDownList2.Visible = true;
                lblTerm.Visible = true;
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
            Response.Redirect("AdminHomeDatatable.aspx");
        }
    }
}