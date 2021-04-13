using System;
using System.Collections.Generic;
using System.Data;
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
        
        int researchID;
        

        string fullName = "Rose McGinnis";

        protected void Page_Load(object sender, EventArgs e)
        {

            populateCommentSection(true);

            
            researchID = (int)Session["researchID"];
            if (Session["Full_Name"] != null)
            {
                fullName = (string)Session["Full_Name"];
            }


            if (!IsPostBack)
            {
                

                this.Master.SetNavBar((String)Session["UserType"]);
                //Initial population of the comment section, newComment set to false because there is not a newly added comment to highlight
                populateCommentSection(true);
                populateResearch();

                

                txtEditJournal.Visible = false;
                txtEditConference.Visible = false;
                txtEditPaper.Visible = false;
                txtEditLink.Visible = false;

                btnSaveJournal.Visible = false;
                btnSaveConference.Visible = false;
                btnSavePaper.Visible = false;
                btnSaveLink.Visible = false;



            }
        }

        protected void btnEdit_Click(object sender, EventArgs e)
        {
            display(true);
        }

        



        public void display(Boolean tf)
        {
            //txtName.Enabled = tf;
            //txtDept.Enabled = tf;
            //txtEmail.Enabled = tf;
            //txtMethod.Enabled = tf;
           // txtStatus.Enabled = tf;
            txtTitle.Enabled = tf;
            TxtDesc.Enabled = tf;
            txtType.Enabled = tf;

            populateCommentSection(true);
            





        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            SqlProcedures urpSqlProcedures = new SqlProcedures();

            string title = txtTitle.Text;
            string description = TxtDesc.Text;
            string researchMethod = ddlResearchMethod.SelectedValue;
            string status = ddlStatus.SelectedValue;
            string typeOfResearch = txtType.Text;
            DateTime date = DateTime.Now;


            urpSqlProcedures.UpdateResearchProject(researchID, title, description, researchMethod, status, typeOfResearch, date);

            display(false);
           this.populateResearch();
        }

        protected void btnComment_Click(object sender, EventArgs e)
        {
            SqlProcedures urpSqlProcedures = new SqlProcedures();
            Validation validation = new Validation();
            if (validation.ValidateChaMinMax(tbComment.Text, 1, 500) && tbComment.Text != "")
            {

                if (urpSqlProcedures.AddComments(researchID, fullName, tbComment.Text, DateTime.Now))
                {                 
                    tbComment.Text = " ";
                    //Populate the comment section and highlight the newly added comment
                    populateCommentSection(true);

                    Response.Redirect("PIViewStudentResearch.aspx");
                }
                else
                {
                    lblCommentError.Text = "Invalid Comment Length";
                    
                }
            }
            else
            {
                display(false);
               
            }
        }



        protected void populateCommentSection(bool newComment)
        {
            SqlProcedures urpSqlProcedures = new SqlProcedures();
            List<Comment> commentList = urpSqlProcedures.LoadComments(researchID);

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


        protected void populateResearch()
        {

            SqlProcedures urpSqlProcedures = new SqlProcedures();
            List<ResearchDocument> researchList = urpSqlProcedures.GetProjectInfo(researchID);

            //load the student info
            DataSet studentData = urpSqlProcedures.LoadStudentInfo(researchID);
            DataRow dr = studentData.Tables[0].Rows[0];
            lblStudentTUID.Text = dr["StudentTUID"].ToString();
            lblStudentName.Text = dr["StudentName"].ToString();
            lblStudentEmail.Text = dr["Email"].ToString();

            //add the correct PI information
            DataSet piData = urpSqlProcedures.LoadPiInfo(researchID);
            dr = piData.Tables[0].Rows[0];
            txtName.Text = dr["PIName"].ToString();
            txtEmail.Text = dr["Email"].ToString();
            txtDept.Text = dr["Department"].ToString();

            //add the correct research project details
            DataSet researchData = urpSqlProcedures.LoadResearchInfo(researchID);
            dr = researchData.Tables[0].Rows[0];
            txtTitle.Text = dr["Title"].ToString();
            TxtDesc.Text = dr["Description"].ToString();
            txtType.Text = dr["TypeOfResearch"].ToString();

            string researchMethod = dr["ResearchMethod"].ToString();
            if (researchMethod.Contains("Remote"))
            {
                ddlResearchMethod.SelectedIndex = 1;
            }
            else if (researchMethod.Contains("In")) { ddlResearchMethod.SelectedIndex = 2; }
            else { ddlResearchMethod.SelectedIndex = 2; }

            string status = dr["Status"].ToString();
            if (status.Contains("Complete"))
            {
                ddlStatus.SelectedIndex = 2;
            }
            else if (researchMethod.Contains("In")) { ddlStatus.SelectedIndex = 1; }
            else { ddlStatus.SelectedIndex = 0; }

            RepeaterTabJournal.DataSource = urpSqlProcedures.GetProjectInfo(researchID);
            RepeaterTabJournal.DataBind();        
            

            RepeaterTabConference.DataSource = urpSqlProcedures.GetProjectInfo(researchID);
            RepeaterTabConference.DataBind();


            RepeaterTabPaper.DataSource = urpSqlProcedures.GetProjectInfo(researchID);
            RepeaterTabPaper.DataBind();


            RepeaterTabLink.DataSource = urpSqlProcedures.GetProjectInfo(researchID);
            RepeaterTabLink.DataBind();

        }
        

        protected void btnEditJournal_Click(object sender, EventArgs e)
        {                    
            RepeaterTabJournal.Visible = false;
            txtEditJournal.Visible = true;
            btnEditJournal.Visible = false;
            btnSaveJournal.Visible = true;
            btnEditLink.Visible = true;
            btnSaveLink.Visible = false;

            SqlProcedures urpSqlProcedures = new SqlProcedures();
                       
            DataSet ds = new DataSet();

            string Journal = urpSqlProcedures.LoadResearchDocuments(researchID).Tables[0].Rows[0][0].ToString();

            txtEditJournal.Text = Journal;

            display(false);


        }
        protected void btnSaveJournal_Click(object sender, EventArgs e)
        {
            RepeaterTabJournal.Visible = true;
            txtEditJournal.Visible = false;
            btnEditJournal.Visible = true;
            btnSaveJournal.Visible = false;
            btnSaveLink.Visible = false;
            btnEditLink.Visible = true;

            SqlProcedures urpSqlProcedures = new SqlProcedures();

            string journalinfo = txtEditJournal.Text;

          

            urpSqlProcedures.UpdateJournal(researchID, journalinfo);

            this.populateResearch();



            display(false);

        }

        protected void btnEditConference_Click(object sender, EventArgs e)
        {
            RepeaterTabConference.Visible = false;
            txtEditConference.Visible = true;
            btnEditConference.Visible = false;
            btnSaveConference.Visible = true;
            btnSaveLink.Visible = false;
            btnEditLink.Visible = true;

            SqlProcedures urpSqlProcedures = new SqlProcedures();

            DataSet ds = new DataSet();

            string Conference = urpSqlProcedures.LoadResearchDocuments(researchID).Tables[0].Rows[0][1].ToString();

            txtEditConference.Text = Conference;

            display(false);

        }

        protected void btnSaveConference_Click(object sender, EventArgs e)
        {
            RepeaterTabConference.Visible = true;
            txtEditConference.Visible = false;
            btnEditConference.Visible = true;
            btnSaveConference.Visible = false;
            btnSaveLink.Visible = false;
            btnEditLink.Visible = true;

            SqlProcedures urpSqlProcedures = new SqlProcedures();


            string conferenceinfo = txtEditConference.Text;

            urpSqlProcedures.UpdateConference(researchID, conferenceinfo);
            this.populateResearch();

            display(false);

        }

        protected void btnEditPaper_Click(object sender, EventArgs e)
        {
            RepeaterTabPaper.Visible = false;
            txtEditPaper.Visible = true;
            btnEditPaper.Visible = false;
            btnSavePaper.Visible = true;
            btnSaveLink.Visible = false;
            btnEditLink.Visible = true;

            SqlProcedures urpSqlProcedures = new SqlProcedures();

            DataSet ds = new DataSet();

            string Paper = urpSqlProcedures.LoadResearchDocuments(researchID).Tables[0].Rows[0][2].ToString();

            txtEditPaper.Text = Paper;

            display(false);

        }

        protected void btnSavePaper_Click(object sender, EventArgs e)
        {
            RepeaterTabPaper.Visible = true;
            txtEditPaper.Visible = false;
            btnEditPaper.Visible = true;
            btnSavePaper.Visible = false;
            btnSaveLink.Visible = false;
            btnEditLink.Visible = true;

            SqlProcedures urpSqlProcedures = new SqlProcedures();

            string paperinfo = txtEditPaper.Text;

            urpSqlProcedures.UpdatePaper(researchID, paperinfo);
            this.populateResearch();

            display(false);

        }

        protected void btnEditLink_Click(object sender, EventArgs e)
        {
            RepeaterTabLink.Visible = false;
            txtEditPaper.Visible = false;
            btnEditPaper.Visible = true;
            btnSavePaper.Visible = false;
            btnSaveLink.Visible = true;
            btnEditLink.Visible = false;
            txtEditLink.Visible = true;
           

            SqlProcedures urpSqlProcedures = new SqlProcedures();

            DataSet ds = new DataSet();

            string Link = urpSqlProcedures.LoadResearchDocuments(researchID).Tables[0].Rows[0][3].ToString();

            txtEditLink.Text = Link;

            display(false);

        }

        protected void btnSaveLink_Click(object sender, EventArgs e)
        {
            RepeaterTabLink.Visible = true;
            txtEditPaper.Visible = false;
            btnEditPaper.Visible = true;
            btnSavePaper.Visible = false;
            btnSaveLink.Visible = false;
            btnEditLink.Visible = true;
            txtEditLink.Visible = false;


            SqlProcedures urpSqlProcedures = new SqlProcedures();

            string Linkinfo = txtEditLink.Text;

            urpSqlProcedures.UpdateLink(researchID, Linkinfo);
            this.populateResearch();

            display(false);

        }






        class click
        {
            public static int buttonclick = 0;
        }



        protected void btnAdd_Click(object sender, EventArgs e)
        {
            display(false);
        }

    }

}

