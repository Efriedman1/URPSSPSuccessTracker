﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;
using URPSSPSuccessTracker.Classes;
using System.Data;

namespace URPSSPSuccessTracker
{


    public partial class Master : System.Web.UI.MasterPage
    {
        private string SelectedTermID;

        SqlProcedures procedures = new SqlProcedures();
        protected void Page_Load(object sender, EventArgs e)
        {
            Secure_My_Session();

            if (Session["Full_Name"] != null)
            {
                lblUserName.Text = Session["Full_Name"].ToString();
            }
            else
            {
                lblUserName.Text = string.Empty;
            }

            if (!IsPostBack)
                //Session["SelectedTermID"] = null;

            InitializeTermDropdown();
        }

        protected void Secure_My_Session()
        {
            if (Response.Cookies.Count > 0)
            {
                foreach (string s in Response.Cookies.AllKeys)
                {
                    if (s == FormsAuthentication.FormsCookieName || s.ToLower() == "asp.net_sessionid")
                    {
                        Response.Cookies[s].Secure = true;
                    }
                }
            }
        }

        protected void btnLogout_Click(object sender, EventArgs e)
        {

            Session.Abandon();
            Session.Clear();
            if (HttpContext.Current.Request.IsLocal.Equals(false))
            {
                string domain = Request.Url.Host;
                Response.Redirect("https://" + domain + "/Shibboleth.sso/Logout?return=https://" + GetFimEnvironment(domain) + ".temple.edu/idp/profile/Logout");
            }
            //Response.Redirect("~/default.aspx");
        }

        public void logout()
        {
            Session.Abandon();
            Session.Clear();
            if (HttpContext.Current.Request.IsLocal.Equals(false))
            {
                string domain = Request.Url.Host;
                Response.Redirect("https://" + domain + "/Shibboleth.sso/Logout?return=https://" + GetFimEnvironment(domain) + ".temple.edu/idp/profile/Logout");
            }
        }

        private string GetFimEnvironment(string domain)
        {
            switch (domain)
            {
                case "np-stem.temple.edu":
                case "pre-stem.temple.edu":
                    return "np-fim";
                default:
                    return "fim";
            }
        }

        public void SetNavBar(String userType)
        {
            if (userType == "Admin")
            {
                btnLogout.Visible = true;
                btnManageUsers.Visible = true;
                btnSearch.Visible = true;
                btnUploadUsers.Visible = true;
                //lblUserName.Text = Session["Full_Name"].ToString();
            }

            if (userType == "Student")
            {
                btnLogout.Visible = true;
                btnManageUsers.Visible = false;
                btnSearch.Visible = false;
                btnUploadUsers.Visible = false;
                //lblUserName.Text = "John Doe";
            }

            if (userType == "PI")
            {
                btnLogout.Visible = true;
                btnManageUsers.Visible = false;
                btnSearch.Visible = false;
                btnUploadUsers.Visible = false;
                //lblUserName.Text = "Bill Perkins";
            }

            if (userType == "")
            {
                btnLogout.Visible = false;
                btnManageUsers.Visible = false;
                btnSearch.Visible = false;
                btnUploadUsers.Visible = false;
                //lblUserName.Text = "";
                //lblUserType.Text = "";
            }
        }

        public void InitializeTermDropdown()
        {
            if (HttpContext.Current.Request.Url.AbsolutePath.EndsWith("/secure/StudentHomeDatatable.aspx"))
            {
                //If located on Student Home page, load all terms with research
                string StudentTuid = Session["employeeNumber"].ToString();
                System.Diagnostics.Debug.Print(StudentTuid);
                DataSet data = procedures.GetTermByStudent(StudentTuid);
                for (int i = 0; i < data.Tables[0].Rows.Count; i++)
                {
                    if (data.Tables[0].Rows[i][3].ToString() == "Active" || data.Tables[0].Rows[i][3].ToString() == "Current")
                    {
                        ListItem newItem = new ListItem();
                        newItem.Text = data.Tables[0].Rows[i][1].ToString() + " " + data.Tables[0].Rows[i][2].ToString();
                        newItem.Value = data.Tables[0].Rows[i][0].ToString();
                        DropDownList2.Items.Add(newItem);
                    }
                }
            }
            else if (HttpContext.Current.Request.Url.AbsolutePath.EndsWith("/secure/PIHomeDatatable.aspx"))
            {
                //If located on PI Home page, load all terms with research
                DataSet data = procedures.GetTermByPI(Session["employeeNumber"].ToString());
                for (int i = 0; i < data.Tables[0].Rows.Count; i++)
                {
                    if (data.Tables[0].Rows[i][3].ToString() == "Active" || data.Tables[0].Rows[i][3].ToString() == "Current")
                    {
                        ListItem newItem = new ListItem();
                        newItem.Text = data.Tables[0].Rows[i][1].ToString() + " " + data.Tables[0].Rows[i][2].ToString();
                        newItem.Value = data.Tables[0].Rows[i][0].ToString();
                        DropDownList2.Items.Add(newItem);
                    }
                }
            }
            else if (HttpContext.Current.Request.Url.AbsolutePath.EndsWith("/secure/PIViewStudentResearch.aspx"))
            {
                //If located on Student Home page, load all terms with research
                string StudentTuid = Session["StudentTUID"].ToString();
                System.Diagnostics.Debug.Print(StudentTuid);
                DataSet data = procedures.GetTermByStudent(StudentTuid);
                for (int i = 0; i < data.Tables[0].Rows.Count; i++)
                {
                    if (data.Tables[0].Rows[i][3].ToString() == "Active" || data.Tables[0].Rows[i][3].ToString() == "Current")
                    {
                        ListItem newItem = new ListItem();
                        newItem.Text = data.Tables[0].Rows[i][1].ToString() + " " + data.Tables[0].Rows[i][2].ToString();
                        newItem.Value = data.Tables[0].Rows[i][0].ToString();
                        DropDownList2.Items.Add(newItem);
                    }
                }
                SetSelectedTerm(Session["SelectedTermID"].ToString());
            }
            else
            {
                //If located on any other page, load all terms
                DataSet data = procedures.GetAllTerms();
                for (int i = 0; i < data.Tables[0].Rows.Count; i++)
                {
                    if (data.Tables[0].Rows[i][3].ToString() == "Active" || data.Tables[0].Rows[i][3].ToString() == "Current")
                    {
                        ListItem newItem = new ListItem();
                        newItem.Text = data.Tables[0].Rows[i][1].ToString() + " " + data.Tables[0].Rows[i][2].ToString();
                        newItem.Value = data.Tables[0].Rows[i][0].ToString();
                        DropDownList2.Items.Add(newItem);
                    }
                }
                if (!IsPostBack)
                {
                    DataSet currentTerm = procedures.GetCurrentTerm();
                    Session["SelectedTermID"] = currentTerm.Tables[0].Rows[0][0].ToString();
                }
                SetSelectedTerm(Session["SelectedTermID"].ToString());
            }

            System.Diagnostics.Debug.Print(HttpContext.Current.Request.Url.AbsolutePath);
            if (HttpContext.Current.Request.Url.AbsolutePath.EndsWith("/secure/TempLogin.aspx") || HttpContext.Current.Request.Url.AbsolutePath.EndsWith("/secure/AdminManageUsers.aspx") || HttpContext.Current.Request.Url.AbsolutePath.EndsWith("/secure/AdminSendEmail.aspx"))
            {
                DropDownList2.Visible = false;
                lblTerm.Visible = false;
            }
            else
            {
                DropDownList2.Visible = true;
                lblTerm.Visible = true;
            }
        }

        public string GetTerm()
        {
            return DropDownList2.SelectedItem.Text;
        }

        public int GetTermID()
        {
            return Convert.ToInt32(DropDownList2.SelectedItem.Value);
        }

        public void SetSelectedTerm(string termID)
        {
            DropDownList2.SelectedValue = termID;
        }

        protected void btnUploadUsers_Click(object sender, EventArgs e)
        {
            Response.Redirect("UploadUsers.aspx");
        }

        protected void btnManageUsers_Click(object sender, EventArgs e)
        {
            Response.Redirect("AdminManageUsers.aspx");
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            Response.Redirect("AdminHomeDatatable.aspx");
        }

        protected void DropDownList2_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (contentCallEvent != null)
                contentCallEvent(this, EventArgs.Empty);
        }

        public event EventHandler contentCallEvent;
    }
}