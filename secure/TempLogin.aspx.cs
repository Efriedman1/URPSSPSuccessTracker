﻿using System;
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
            if (!IsPostBack)
            {
                this.Master.SetNavBar((String)Session["UserType"]);
            }
        }

        protected void btnAdmin_Click(object sender, EventArgs e)
        {
            Session["UserType"] = "Admin";
            this.Master.SetNavBar((String)Session["UserType"]);
            Response.Redirect("AdminHomeDatatable.aspx");

        }

        protected void btnPI_Click(object sender, EventArgs e)
        {
            Session["UserType"] = "PI";
            this.Master.SetNavBar((String)Session["UserType"]);
            Response.Redirect("PiHomeDatatable.aspx");
        }

        protected void btnStudent_Click(object sender, EventArgs e)
        {
            Session["UserType"] = "Student";
            this.Master.SetNavBar((String)Session["UserType"]);
            Response.Redirect("StudentHomeDatatable.aspx");
        }
    }
}