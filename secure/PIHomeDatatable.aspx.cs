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
        SqlProcedures procedures = new SqlProcedures();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                DataSet researchData = procedures.LoadResearchProjectsByPI("741258963");
                gvPI.DataSource = researchData;
                gvPI.DataBind();
                gvPI.Columns[6].Visible = false;
            }
        }

        public void validatePI()
        {

            //get TUID from header after login
            int employeeNumber;
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

        protected void btnView_Click(object sender, EventArgs e)
        {
            Button btn = (Button)sender;
            GridViewRow row = (GridViewRow)btn.NamingContainer;
            int researchID = Convert.ToInt32(row.Cells[6].Text);
            Session["researchID"] = researchID;
            Response.Redirect("PIViewStudentResearch.aspx");
        }
    }
}