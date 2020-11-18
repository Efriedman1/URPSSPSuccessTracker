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

        public void SetNavBar(String userType)
        {

        }

        protected void btnUploadUsers_Click(object sender, EventArgs e)
        {

        }

        protected void btnManageUsers_Click(object sender, EventArgs e)
        {

        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {

        }
    }
}