using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace URPSSPSuccessTracker
{
    public partial class StudentHome : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void btnSelectTerm1_Click(object sender, EventArgs e)
        {
            Response.Redirect("StudentEnterResearch.aspx");
        }
        protected void btnSelectTerm2_Click(object sender, EventArgs e)
        {
            Response.Redirect("StudentEnterResearch.aspx");
        }
        protected void btnSelectTerm3_Click(object sender, EventArgs e)
        {
            Response.Redirect("StudentEnterResearch.aspx");
        }
        protected void btnSelectTerm4_Click(object sender, EventArgs e)
        {
            Response.Redirect("StudentEnterResearch.aspx");
        }
        protected void btnSelectTerm5_Click(object sender, EventArgs e)
        {
            Response.Redirect("StudentEnterResearch.aspx");
        }

    }
}