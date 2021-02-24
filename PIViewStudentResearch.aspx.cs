using System;
using System.Collections.Generic;
using System.IO;
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
                        
        }

        class click
        {
            public static int buttonclick = 0;
        }


        protected void btnModAdd_Click(object sender, EventArgs e)
        {


            click.buttonclick++;
            int count = click.buttonclick;
            int Total = Convert.ToInt32(count.ToString());


           
            //int i;
            //for (i = 0; i < Total; i++)
            //{


                Label lblDocType = new Label();
                lblDocType.Text = "Document Type";
                lblDocType.ID = "Labeldoc" + Convert.ToString(count);
                TextBox txtDocType = new TextBox();
                txtDocType.ID = Convert.ToString(count);
                txtDocType.Width = Unit.Percentage(100);
                txtDocType.Enabled = false;
                txtDocType.ReadOnly = true;
                txtDocType.Text = ddlAddDoc.SelectedValue;


                Label lblDocTitle = new Label();
                lblDocTitle.Text = "Title";
                TextBox tbDocTitle = new TextBox();
                tbDocTitle.Width = Unit.Percentage(100);
                tbDocTitle.Enabled = false;
                tbDocTitle.Text = txtModDocTitle.Text;


                Label lblDocDesc = new Label();
                lblDocDesc.Text = "Description";
                TextBox tbDocDesc = new TextBox();
                tbDocDesc.Width = Unit.Percentage(100);
                tbDocDesc.Rows = 5;
                tbDocDesc.TextMode = TextBoxMode.MultiLine;
                tbDocDesc.Enabled = false;
                tbDocDesc.Text = TxtModDocDesc.Text;



                pnlResearchDocument.Controls.Add(lblDocType);
                pnlResearchDocument.Controls.Add(new LiteralControl("<br />"));
                pnlResearchDocument.Controls.Add(txtDocType);
                pnlResearchDocument.Controls.Add(new LiteralControl("<br />"));
                pnlResearchDocument.Controls.Add(lblDocTitle);
                pnlResearchDocument.Controls.Add(new LiteralControl("<br />"));
                pnlResearchDocument.Controls.Add(tbDocTitle);
                pnlResearchDocument.Controls.Add(new LiteralControl("<br />"));
                pnlResearchDocument.Controls.Add(lblDocDesc);
                pnlResearchDocument.Controls.Add(new LiteralControl("<br />"));
                pnlResearchDocument.Controls.Add(tbDocDesc);
                pnlResearchDocument.Controls.Add(new LiteralControl("<br />"));
                pnlResearchDocument.Controls.Add(new LiteralControl("<br />"));


           // }
        }





        protected void btnAdd_Click(object sender, EventArgs e)
        {
            display(false);
        }
    }
}