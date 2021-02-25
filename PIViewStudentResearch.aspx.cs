using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using URPSSPSuccessTracker.Classes;

namespace URPSSPSuccessTracker
{
    public partial class PIViewResearch : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                this.Master.SetNavBar((String)Session["UserType"]);
                populateCommentSection();
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
                        
        }

        protected void btnComment_Click(object sender, EventArgs e)
        {
            SqlProcedures urpSqlProcedures = new SqlProcedures();
            if (urpSqlProcedures.AddComments(6, "Rose McGinnis", tbComment.Text, DateTime.Now))
            {
                populateCommentSection();
                tbComment.Text = "";
            }
            else
            {
                //If comment post fails
            }
        }

        protected void populateCommentSection()
        {
            SqlProcedures urpSqlProcedures = new SqlProcedures();
            List<Comment> commentList = urpSqlProcedures.LoadComments(6);
            
            for (int i = 0; i < commentList.Count; i++)
            {
                HtmlGenericControl li = new HtmlGenericControl("li");     
                Panel commentPanel = new Panel();

                Label name = new Label();
                name.Text = commentList[i].Name;
                name.CssClass = "row h4";

                Label body = new Label();
                body.Text = commentList[i].Body;
                body.CssClass = "row lead mb-2";

                Label dateTime = new Label();
                dateTime.Text = commentList[i].Date.ToString();
                dateTime.CssClass = "row date sub-text";

                commentPanel.Controls.Add(name);
                commentPanel.Controls.Add(body);
                commentPanel.Controls.Add(dateTime);
                commentPanel.CssClass = "col commentText";
                li.Controls.Add(commentPanel);
                pnlComments.Controls.Add(li);
            }
        }

        protected void populateResearch()
        {
            SqlProcedures urpSqlProcedures = new SqlProcedures();
            
        }

        //protected void btnAdd_Click(object sender, EventArgs e)
        //{
        //    display(false);
        //}
    }
}