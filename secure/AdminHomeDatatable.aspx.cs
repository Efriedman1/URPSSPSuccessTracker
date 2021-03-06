﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Data;
using URPSSPSuccessTracker.Classes;
using System.Web.Services;

namespace URPSSPSuccessTracker
{
    public partial class AdminHomeDatatable : System.Web.UI.Page
    {
        SqlProcedures procedures = new SqlProcedures();
        List<string> selectedTuids;


        protected override void OnPreInit(EventArgs e)
        {
            base.OnPreInit(e);
            this.ViewStateUserKey = Session.SessionID;
        }


        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                this.Master.SetNavBar((String)Session["UserType"]);

                procedures = new SqlProcedures();
                //             if (!IsPostBack)
                //             {
                //                 this.Master.SetNavBar((String)Session["UserType"]);
                //                 DataSet studentData = procedures.LoadStudents();
                //                 if (studentData.Tables.Count > 0)
                //                 {
                //                     example.DataSource = studentData;
                //                     example.DataBind();
                //                 }

            }
            pnlPI.Visible = false;
            pnlStudents.Visible = true;
            populateDataTable();
        }

        protected void Page_PreInit(object sender, EventArgs e)
        {
            this.Master.contentCallEvent += new EventHandler(Master_DdlChangeIndex);
        }

        protected void populateDataTable()
        {
            DataSet studentData = new DataSet();
            DataSet piData = new DataSet();
            if (!IsPostBack)
            {
                DataRow currentTermRow = procedures.GetCurrentTerm().Tables[0].Rows[0];
                studentData = procedures.LoadStudents(currentTermRow[1].ToString(), currentTermRow[2].ToString());
                piData = procedures.LoadPrincipalInvestigator(currentTermRow[1].ToString(), currentTermRow[2].ToString());
            }
            else
            {
                string[] term = this.Master.GetTerm().Split(' ');
                studentData = procedures.LoadStudents(term[0], term[1]);
                piData = procedures.LoadPrincipalInvestigator(term[0], term[1]);
            }
            if (studentData.Tables.Count > 0)
            {
                gvStudents.DataSource = studentData;

                //add the research ID to the datakeys collection so that the correct
                //research will be loaded on the view research page
                string[] names = new string[1];
                names[0] = "ResearchID";
                gvStudents.DataKeyNames = names;
                gvStudents.DataBind();
            }
            if (piData.Tables.Count > 0)
            {
                gvPI.DataSource = piData;

                //add the research ID to the datakeys collection so that the correct
                //research will be loaded on the view research page
                //string[] names = new string[1];
                //names[0] = "ResearchID";
                //gvPI.DataKeyNames = names;

                gvPI.DataBind();
            }
        }


        protected void SetSelectedTuids(List<string> selected)
        {
            selectedTuids = selected;
        }

        public void validateAdmin()
        {
            //get TUID from header after login
            int employeeNumber;
            bool number = false;

            // check if running locally
            if (HttpContext.Current.Request.IsLocal.Equals(true))
            {
                number = int.TryParse(Session["employeeNumber"].ToString(), out employeeNumber);

                if ((String)Session["UserType"] == "Admin" && number)
                {
                    //    lblEmail.Text = Session["mail"].ToString();
                    //    lblTUID.Text = employeeNumber.ToString();
                }
                else
                {
                    Response.Redirect("~/default.aspx");
                }
            }
            else
            {
                number = int.TryParse(Session["SSO_Attribute_employeeNumber"].ToString(), out employeeNumber);
                Response.Write("<script>console.log(\"" + employeeNumber + "\");</script>");

                if ((String)Session["UserType"] == "Admin" && number)
                {
                    // Search for employeeNumber in student table to see if user is a valid student
                    SqlProcedures sqlProcedures = new SqlProcedures();
                    DataSet ds = sqlProcedures.SearchAdministrator(employeeNumber);

                    if (ds.Tables[0].Rows.Count > 0)
                    {
                        Response.Write("<script>console.log(\"" + employeeNumber + " is admin\");</script>");
                        Console.WriteLine(employeeNumber + " is a admin");
                        // do something with the page

                    }
                    else
                    {/*
                        Console.WriteLine(employeeNumber + " is NOT a admin! REDIRECT BACK");
                        Response.Write("<script>console.log(\"" + employeeNumber + " is NOT a admin! REDIRECT BACK" + "\");</script>");

                        Session["Authenticated"] = "";
                        Session["UserType"] = "";
                        Session.Abandon();
                        Session.Clear();

                        var master = Master as Master;
                        master.logout();
                        Response.Redirect("~/default.aspx");*/
                    }
                }
                else
                {
                    Response.Write("<script>console.log(\"" + employeeNumber + "\");</script>");

                    Session["Authenticated"] = "";
                    Session["UserType"] = "";
                    Session.Abandon();
                    Session.Clear();

                    var master = Master as Master;
                    master.logout();
                    Response.Redirect("~/default.aspx");
                }
            }
        }

        //Event Handler that deals with changing the Master Page's term dropdown list
        private void Master_DdlChangeIndex(object sender, EventArgs e)
        {
            System.Diagnostics.Debug.Print("Reached DdlChangedIndex in AdminHome");
            Session["SelectedTermID"] = this.Master.GetTermID();

        }

        protected void btnPI_Click(object sender, EventArgs e)
        {
            pnlPI.Visible = true;
            pnlStudents.Visible = false;
        }

        protected void btnStudent_Click(object sender, EventArgs e)
        {
            pnlPI.Visible = false;
            pnlStudents.Visible = true;
        }

        protected void populateArrayFile()
        {
            //using (StreamWriter file = File.CreateText())
        }

        protected void btnEmail_Click(object sender, EventArgs e)
        {
            Response.Redirect("AdminSendEmail.aspx");
        }

        protected void btnEmailChecked_Click(object sender, EventArgs e)
        {
            List<string> tuidList = new List<string>();
            for (int i = 0; i < gvStudents.Rows.Count; i++)
            {
                if (gvStudents.Rows[i].CssClass.Contains("selected"))
                {
                    tuidList.Add(gvStudents.Rows[i].Cells[0].ToString());
                }
            }
            System.Diagnostics.Debug.Print(tuidList.Count.ToString());

            //Response.Redirect("AdminSendEmail.aspx");
        }

        protected void example_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.Header)
            {
                e.Row.TableSection = TableRowSection.TableHeader;
            }
        }

        protected void gv_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.Header)
            {
                e.Row.TableSection = TableRowSection.TableHeader;
            }
        }
        protected void gvStudents_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            int rowIndex = Convert.ToInt32(e.CommandArgument.ToString());

            if (e.CommandName == "View")
            {
                int researchID = int.Parse(gvStudents.DataKeys[rowIndex].Value.ToString());
                Session.Add("researchID", researchID);
                Session.Add("StudentTUID", gvStudents.Rows[rowIndex].Cells[1].Text);
                Session.Add("TermID", this.Master.GetTermID());
                System.Diagnostics.Debug.Print(this.Master.GetTermID().ToString());
                Response.Redirect("PIViewStudentResearch.aspx");
            }
        }

        protected void gvPI_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            int rowIndex = Convert.ToInt32(e.CommandArgument.ToString());

            if (e.CommandName == "View")
            {
                int researchID = int.Parse(gvStudents.DataKeys[rowIndex].Value.ToString());
                Session.Add("PITUID", gvPI.Rows[rowIndex].Cells[1].Text);
                Session.Add("PIEmail", gvPI.Rows[rowIndex].Cells[4].Text);
                Response.Redirect("AdminViewPI.aspx");
            }
        }

        protected void btnExport_Click(object sender, EventArgs e)
        {
            //Create an excel sheet using the cureently viewed term
            //First get the selected term
            //string[] term = this.Master.GetTerm().Split(' ');
            //check which term is currently visible in order to use the correct information\
            //if the student panel is visible then, that means you are exporting the student info
            if (pnlStudents.Visible == true)
            {
                //Next pull all the research projects for the selected term
                //DataSet projectInfo = procedures.LoadProjectsByTerm(term[0], term[1]);
                Response.Redirect("ExportSample.aspx");

            }
            //if the sudent panel isn't visible then the PI panel must be. So get theinformation for PIs
            else
            {

            }
            //create a spread sheet and fill in all the research from the dataset

            //

        }
    }

}
