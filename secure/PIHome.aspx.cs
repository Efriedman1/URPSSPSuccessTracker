using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using URPSSPSuccessTracker.Classes;

namespace URPSSPSuccessTracker
{
    public partial class PIHome : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (Session["Authenticated"] == null || Session["Authenticated"].ToString() == "false")
                {
                    Response.Redirect("~/default.aspx");
                }

            }
            catch (Exception ex)
            {

                Response.Redirect("~/default.aspx");
            }


            if (!IsPostBack)
            {
                bool local = Session["Local"].ToString() == "true";
                //get TUID from header after login
                int employeeNumber;
                bool number = false;

                // check if running locally
                if (local)
                {
                    number = int.TryParse(Session["employeeNumber"].ToString(), out employeeNumber);

                    if ((String)Session["UserType"] == "PI" && number)
                    {

                    }
                    else
                    {
                        Response.Redirect("~/default.aspx");
                    }
                }
                else
                {
                    number = int.TryParse(Session["SSO_Attribute_employeeNumber"].ToString(), out employeeNumber);
                    
                    if ((String)Session["UserType"] == "PI" && number)
                    {
                        // Search for employeeNumber in student table to see if user is a valid student
                        SqlProcedures sqlProcedures = new SqlProcedures();
                        DataSet ds = sqlProcedures.SearchPrincipalInvestigator(employeeNumber,"","","");
                        if (ds.Tables[0].Rows.Count > 0)
                        {
                            Console.WriteLine(employeeNumber + " is a PI");
                            // do something with the page

                        }
                        else
                        {
                            //Response.Redirect("~/default.aspx");
                        }
                    }
                    else
                    {
                        Response.Redirect("~/default.aspx");
                    }
                }

                this.Master.SetNavBar((String)Session["UserType"]);
            }
        }
        protected void btnStudent1_Click(object sender, EventArgs e)
        {
            Response.Redirect("PIViewStudentResearch.aspx");
        }
        protected void btnStudent2_Click(object sender, EventArgs e)
        {
            Response.Redirect("PIViewStudentResearch.aspx");
        }
        protected void btnStudent3_Click(object sender, EventArgs e)
        {
            Response.Redirect("PIViewStudentResearch.aspx");
        }
        protected void btnStudent4_Click(object sender, EventArgs e)
        {
            Response.Redirect("PIViewStudentResearch.aspx");
        }
        protected void btnStudent5_Click(object sender, EventArgs e)
        {
            Response.Redirect("PIViewStudentResearch.aspx");
        }
    }
}