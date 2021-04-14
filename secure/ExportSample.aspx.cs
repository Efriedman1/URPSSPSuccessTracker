using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using URPSSPSuccessTracker.Classes;

namespace URPSSPSuccessTracker.secure
{
    public partial class ExportSample : System.Web.UI.Page
    {
        SqlProcedures procedures = new SqlProcedures();
        protected void Page_Load(object sender, EventArgs e)
        {
            gvExport.DataSource = procedures.LoadResearchProjectsByTermID(Convert.ToInt32(Session["SelectedTermID"]));
            gvExport.DataBind();
        }
    }
}