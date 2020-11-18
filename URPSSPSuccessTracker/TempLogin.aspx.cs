using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace URPSSPSuccessTracker
{
    public partial class TempLogin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Session["UserType"] = "";
        }

        protected void btnAdmin_Click(object sender, EventArgs e)
        {
            Session["UserType"] = "Admin";
            Response.Redirect("AdminHome.aspx");

        }

        protected void btnPI_Click(object sender, EventArgs e)
        {
            Session["UserType"] = "PI";
            Response.Redirect("StudentHome.aspx");
        }

        protected void btnStudent_Click(object sender, EventArgs e)
        {
            Session["UserType"] = "Student";
            Response.Redirect("StudentHome.aspx");
        }
    }
}