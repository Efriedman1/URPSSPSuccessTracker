using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace URPSSPSuccessTracker
{
    public partial class AdminHome : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                tblPI.Style.Add("display","none");
                btnStudent.Enabled = false;
            }

        }

        protected void Button4_Click(object sender, EventArgs e)
        {
            //Response.Redirect("AdminSearchStudent.aspx");
            lblUser.Text = "Students";
            btnStudent.Enabled = false;
            btnPI.Enabled = true;
            tblStudent.Style.Add("display", "block");
            tblPI.Style.Add("display", "none");
        }

        protected void Button5_Click(object sender, EventArgs e)
        {
            lblUser.Text = "Principal Investigator";
            btnPI.Enabled = false;
            btnStudent.Enabled = true;
            tblStudent.Style.Add("display", "none");
            tblPI.Style.Add("display", "block");
        }

    }
}