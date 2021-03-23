using System;
using System.Collections.Generic;
using System.IO;
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
                //Initial population of the comment section, newComment set to false because there is not a newly added comment to highlight
                populateCommentSection(false);
                populateResearch();

                txtEditJournal.Visible = false;
                btnSaveJournal.Visible = false;
            }
        }

        protected void btnEdit_Click(object sender, EventArgs e)
        {
            display(true);
        }




        protected void btnSaveJournal_Click(object sender, EventArgs e)
        {
            RepeaterTabJournal.Visible = true;
            txtEditJournal.Visible = false;
            btnEditJournal.Visible = true;
            btnSaveJournal.Visible = false;
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
            Validation validation = new Validation();
            if (validation.ValidateChaMinMax(tbComment.Text, 1, 500))
            {
                if (urpSqlProcedures.AddComments(6, "Rose McGinnis", tbComment.Text, DateTime.Now))
                {
                    //Populate the comment section and highlight the newly added comment
                    populateCommentSection(true);
                    tbComment.Text = "";                    
                }
                else
                {
                    lblCommentError.Text = "Invalid Comment Length";
                }
            }
        }

        protected void updateCharLimit()
        {
            int charCount = 0;
        }

        protected void populateCommentSection(bool newComment)
        {
            SqlProcedures urpSqlProcedures = new SqlProcedures();
            List<Comment> commentList = urpSqlProcedures.LoadComments(6);

            for (int i = 0; i < commentList.Count; i++)
            {
                HtmlGenericControl li = new HtmlGenericControl("li");
                Panel commentPanel = new Panel();
                Panel headerPanel = new Panel();
                headerPanel.CssClass = "row mb-1";

                Label name = new Label();
                name.Text = commentList[i].Name;
                name.CssClass = "h5";
                                
                Label dateTime = new Label();
                dateTime.Text = commentList[i].Date.ToString();
                dateTime.CssClass = "date sub-text mt-1 ml-2";

                headerPanel.Controls.Add(name);
                headerPanel.Controls.Add(dateTime);

                Label body = new Label();
                body.Text = commentList[i].Body;
                body.CssClass = "row lead mb-2";
                

                commentPanel.Controls.Add(headerPanel);
                commentPanel.Controls.Add(body);

                commentPanel.CssClass = "col commentText";
                li.Controls.Add(commentPanel);
                li.Attributes.Add("class", "card p-1");
                li.Attributes.Add("style", "border-radius: 0");

                if (i == 0 && newComment)
                    li.Attributes.Add("class", "card p-1 bg-light");
                upnlComments.ContentTemplateContainer.Controls.Add(li);
            }
        }

        //protected void populateResearch()
        //{
        //    SqlProcedures urpSqlProcedures = new SqlProcedures();
        //    List<ResearchDocument> researchList = urpSqlProcedures.LoadResearchDocuments(6);
        //    for (int i = 0; i < researchList.Count; i++)
        //    {
        //        Panel pnlResearch = new Panel();
        //        Label lblResearchType = new Label();
        //        lblResearchType.Text = researchList[i].DocumentType + " - ";
        //        Label lblResearchTitle = new Label();
        //        lblResearchTitle.Text = researchList[i].DocumentTitle + " - ";
        //        Label lblResearchDescription = new Label();
        //        lblResearchDescription.Text = researchList[i].Description;

        //        pnlResearch.Controls.Add(lblResearchTitle);
        //        pnlResearch.Controls.Add(lblResearchType);
        //        pnlResearch.Controls.Add(lblResearchDescription);

        //        pnlResearchDocument.Controls.Add(pnlResearch);
        //    }

        //    Panel contentPanel = new Panel();
        //    contentPanel.CssClass = "row";
        //    Panel colPanel = new Panel();
        //    colPanel.CssClass = "col-md-6";
        //}

        protected void populateResearch()
        {
            
            SqlProcedures urpSqlProcedures = new SqlProcedures();
            List<ResearchDocument> researchList = urpSqlProcedures.LoadResearchDocuments(6); 

            RepeaterTabJournal.DataSource = urpSqlProcedures.LoadResearchDocuments(6);
            RepeaterTabJournal.DataBind();


            RepeaterTabConference.DataSource = urpSqlProcedures.LoadResearchDocuments(6);
            RepeaterTabConference.DataBind();


            RepeaterPaper.DataSource = urpSqlProcedures.LoadResearchDocuments(6);
            RepeaterPaper.DataBind();


        }

        protected void btnEditJournal_Click(object sender, EventArgs e)
        {
            RepeaterTabJournal.Visible = false;
            txtEditJournal.Visible = true;
            btnEditJournal.Visible = false;
            btnSaveJournal.Visible = true;

            SqlProcedures urpSqlProcedures = new SqlProcedures();
            List<ResearchDocument> researchList = urpSqlProcedures.GetJournal(6);

            txtEditJournal.Text = Convert.ToString(researchList);
            
        }
        //protected void btnAdd_Click(object sender, EventArgs e)
        //{
        //    display(false);
        //}
        class click
        {
            public static int buttonclick = 0;
        }

        protected void btnModAdd_Click(object sender, EventArgs e)
        {
            //SqlProcedures urpSqlProcedures = new SqlProcedures();
            //if (urpSqlProcedures.InsertResearchDocuments(6, ddlAddDoc.SelectedValue, txtModDocTitle.Text, TxtModDocDesc.Text))
            //{
            //    populateResearch();
            //}
            //else
            //{
            //    //update fail
            //}

            ////int i;
            ////for (i = 0; i < Total; i++)
            ////{
            //click.buttonclick++;
            //int count = click.buttonclick;
            //int Total = Convert.ToInt32(count.ToString());

            //    Label lblDocType = new Label();
            //    lblDocType.Text = "Document Type";
            //    lblDocType.ID = "Labeldoc" + Convert.ToString(count);
            //    TextBox txtDocType = new TextBox();
            //    txtDocType.ID = Convert.ToString(count);
            //    txtDocType.Width = Unit.Percentage(100);
            //    txtDocType.Enabled = false;
            //    txtDocType.ReadOnly = true;
            //    txtDocType.Text = ddlAddDoc.SelectedValue;


            //    Label lblDocTitle = new Label();
            //    lblDocTitle.Text = "Title";
            //    TextBox tbDocTitle = new TextBox();
            //    tbDocTitle.Width = Unit.Percentage(100);
            //    tbDocTitle.Enabled = false;
            //    tbDocTitle.Text = txtModDocTitle.Text;


            //    Label lblDocDesc = new Label();
            //    lblDocDesc.Text = "Description";
            //    TextBox tbDocDesc = new TextBox();
            //    tbDocDesc.Width = Unit.Percentage(100);
            //    tbDocDesc.Rows = 5;
            //    tbDocDesc.TextMode = TextBoxMode.MultiLine;
            //    tbDocDesc.Enabled = false;
            //    tbDocDesc.Text = TxtModDocDesc.Text;



            //    pnlResearchDocument.Controls.Add(lblDocType);
            //    pnlResearchDocument.Controls.Add(new LiteralControl("<br />"));
            //    pnlResearchDocument.Controls.Add(txtDocType);
            //    pnlResearchDocument.Controls.Add(new LiteralControl("<br />"));
            //    pnlResearchDocument.Controls.Add(lblDocTitle);
            //    pnlResearchDocument.Controls.Add(new LiteralControl("<br />"));
            //    pnlResearchDocument.Controls.Add(tbDocTitle);
            //    pnlResearchDocument.Controls.Add(new LiteralControl("<br />"));
            //    pnlResearchDocument.Controls.Add(lblDocDesc);
            //    pnlResearchDocument.Controls.Add(new LiteralControl("<br />"));
            //    pnlResearchDocument.Controls.Add(tbDocDesc);
            //    pnlResearchDocument.Controls.Add(new LiteralControl("<br />"));
            //    pnlResearchDocument.Controls.Add(new LiteralControl("<br />"));
            ////int i;
            ////for (i = 0; i < Total; i++)
            ////{


            //    Label lblDocType = new Label();
            //    lblDocType.Text = "Document Type";
            //    lblDocType.ID = "Labeldoc" + Convert.ToString(count);
            //    TextBox txtDocType = new TextBox();
            //    txtDocType.ID = Convert.ToString(count);
            //    txtDocType.Width = Unit.Percentage(100);
            //    txtDocType.Enabled = false;
            //    txtDocType.ReadOnly = true;
            //    txtDocType.Text = ddlAddDoc.SelectedValue;


            //    Label lblDocTitle = new Label();
            //    lblDocTitle.Text = "Title";
            //    TextBox tbDocTitle = new TextBox();
            //    tbDocTitle.Width = Unit.Percentage(100);
            //    tbDocTitle.Enabled = false;
            //    tbDocTitle.Text = txtModDocTitle.Text;


            //    Label lblDocDesc = new Label();
            //    lblDocDesc.Text = "Description";
            //    TextBox tbDocDesc = new TextBox();
            //    tbDocDesc.Width = Unit.Percentage(100);
            //    tbDocDesc.Rows = 5;
            //    tbDocDesc.TextMode = TextBoxMode.MultiLine;
            //    tbDocDesc.Enabled = false;
            //    tbDocDesc.Text = TxtModDocDesc.Text;
            // }

        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            display(false);
        }

        protected void tbComment_TextChanged(object sender, EventArgs e)
        {
            lblCharMax.Text = "Characters: " + tbComment.Text.Length.ToString() + "/500";
        }

        //protected void btnModAdd_Click(object sender, EventArgs e)
        //{
        //    SqlProcedures urpSqlProcedures = new SqlProcedures();
        //    urpSqlProcedures.InsertResearchDocuments(6, ddlAddDoc.SelectedValue, txtModDocTitle.Text, TxtModDocDesc.Text);


        //    //click.buttonclick++;
        //    //int count = click.buttonclick;
        //    //int Total = Convert.ToInt32(count.ToString());

        //    Panel pnlResearch = new Panel();
        //    Label lblResearchType = new Label();
        //    lblResearchType.Text = researchList[i].DocumentType + " - ";
        //    Label lblResearchTitle = new Label();
        //    lblResearchTitle.Text = researchList[i].DocumentTitle + " - ";
        //    Label lblResearchDescription = new Label();
        //    lblResearchDescription.Text = researchList[i].Description;

        //    pnlResearch.Controls.Add(lblResearchTitle);
        //    pnlResearch.Controls.Add(lblResearchType);
        //    pnlResearch.Controls.Add(lblResearchDescription);

        //    pnlResearchDocument.Controls.Add(pnlResearch);
        //}
    }

    //protected void btnAdd_Click(object sender, EventArgs e)
    //{
    //    display(false);
    //}



    //    pnlResearchDocument.Controls.Add(lblDocType);
    //    pnlResearchDocument.Controls.Add(new LiteralControl("<br />"));
    //    pnlResearchDocument.Controls.Add(txtDocType);
    //    pnlResearchDocument.Controls.Add(new LiteralControl("<br />"));
    //    pnlResearchDocument.Controls.Add(lblDocTitle);
    //    pnlResearchDocument.Controls.Add(new LiteralControl("<br />"));
    //    pnlResearchDocument.Controls.Add(tbDocTitle);
    //    pnlResearchDocument.Controls.Add(new LiteralControl("<br />"));
    //    pnlResearchDocument.Controls.Add(lblDocDesc);
    //    pnlResearchDocument.Controls.Add(new LiteralControl("<br />"));
    //    pnlResearchDocument.Controls.Add(tbDocDesc);
    //    pnlResearchDocument.Controls.Add(new LiteralControl("<br />"));
    //    pnlResearchDocument.Controls.Add(new LiteralControl("<br />"));


    // }
}

