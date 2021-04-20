using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using URPSSPSuccessTracker.Classes;

namespace URPSSPSuccessTracker.secure
{
    public partial class PIHomeDatatable : System.Web.UI.Page
    {
        int employeeNumber = 741258963;

        SqlProcedures procedures = new SqlProcedures();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
  
            }
            if (Session["SSO_Attribute_employeeNumber"] != null)
            {
                employeeNumber = Convert.ToInt32(Session["SSO_Attribute_employeeNumber"]);
            }
            DataSet researchData = procedures.LoadResearchProjectsByPI(employeeNumber.ToString());
            gvPI.DataSource = researchData;

            //add the research ID to the datakeys collection so that the correct
            //research will be loaded on the view research page
            string[] names = new string[1];
            names[0] = "ResearchID";
            gvPI.DataKeyNames = names;
            Label9.Text = Session["SSO_Attribute_employeeNumber"].ToString();
            Label4.Text = Session["SSO_Attribute_mail"].ToString();
            gvPI.DataBind();
            gvPI.Columns[6].Visible = false;
        }

        private void PopulateDataTable()
        {
            DataSet researchData = procedures.LoadResearchProjectsByPI("741258963");
            gvPI.DataSource = researchData;
            gvPI.DataBind();
            gvPI.Columns[6].Visible = false;
        }

        public void validatePI()
        {

            //get TUID from header after login
            bool number = false;

            // check if running locally
            if (HttpContext.Current.Request.IsLocal.Equals(true))
            {
                number = int.TryParse(Session["employeeNumber"].ToString(), out employeeNumber);

                if ((String)Session["UserType"] == "PI" && number)
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

                if ((String)Session["UserType"] == "PI" && number)
                {
                    // Search for employeeNumber in student table to see if user is a valid student
                    SqlProcedures sqlProcedures = new SqlProcedures();
                    DataSet ds = sqlProcedures.SearchPrincipalInvestigator(employeeNumber, "", "", "");

                    if (ds.Tables[0].Rows.Count > 0)
                    {
                        Response.Write("<script>console.log(\"" + employeeNumber + " is PI\");</script>");
                        Console.WriteLine(employeeNumber + " is a PI");
                        // do something with the page

                    }
                    else
                    {
                        Console.WriteLine(employeeNumber + " is NOT a PI! REDIRECT BACK");
                        Response.Write("<script>console.log(\"" + employeeNumber + " is NOT a PI! REDIRECT BACK" + "\");</script>");

                        Session["Authenticated"] = "";
                        Session["UserType"] = "";
                        Session.Abandon();
                        Session.Clear();

                        var master = Master as Master;
                        master.logout();
                        Response.Redirect("~/default.aspx");
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

        protected void gvPI_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            string[] headers = { "First Name", "Last Name", "Title", "Term", "Program", "Major", "", "", "", ""};
            if (e.Row.RowType == DataControlRowType.Header)
            {
                for (int i = 0; i < e.Row.Cells.Count; i++)
                {
                    e.Row.Cells[i].Text = headers[i];
                }
                e.Row.TableSection = TableRowSection.TableHeader;
            }
            else
            {
                //If any other rows need to be modified at runtime
            }
        }

        protected void gvPI_RowCommand(object sender, GridViewCommandEventArgs e)
        {

            int rowIndex = Convert.ToInt32(e.CommandArgument.ToString());

            if (e.CommandName == "View")
            {
                int researchID = int.Parse(gvPI.DataKeys[rowIndex].Value.ToString());
                DataSet researchData = procedures.LoadStudentInfo(researchID);

                Session.Add("StudentTUID", researchData.Tables[0].Rows[0][1].ToString());
                Session.Add("researchID", researchID);
                Response.Redirect("PIViewStudentResearch.aspx");
            }

        }
    }
}