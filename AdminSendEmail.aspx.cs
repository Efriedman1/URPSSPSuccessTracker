using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace URPSSPSuccessTracker
{
    public partial class AdminSendEmail : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {          
            if (!IsPostBack)
            {
                this.Master.SetNavBar((String)Session["UserType"]);

            }
        }

        protected void btnSend_Click(object sender, EventArgs e)
        {
            txtEmailSubject.Text = "";
            txtEmailBody.Text = "";
            lblEmailSent.Visible = true;
        }

        protected void btnAddStudent_Click(object sender, EventArgs e)
        {
            Response.Redirect("AdminSearchStudent.aspx");
        }
    }
}