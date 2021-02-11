using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace URPSSPSuccessTracker
{
    public partial class PIViewResearch : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                this.Master.SetNavBar((String)Session["UserType"]);
            }
        }

        protected void btnEdit_Click(object sender, EventArgs e)
        {
            display(true);
        }

        public void display(Boolean tf)
        {
            txtName.Enabled = tf;
            txtDept.Enabled = tf;
            txtEmail.Enabled = tf;
            txtMethod.Enabled = tf;
            txtStatus.Enabled = tf;
            txtTitle.Enabled = tf;
            txtType.Enabled = tf;
            //txtLinks.Enabled = tf;
            //txtJournal.Enabled = tf;
            //txtInfo.Enabled = tf;
            //txtDescription.Enabled = tf;

        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            display(false);
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            display(false);
        }
    }
}