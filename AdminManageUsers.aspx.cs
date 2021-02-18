using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using URPSSPSuccessTracker.Classes;

namespace URPSSPSuccessTracker
{
    public partial class AdminManageUsers : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                this.Master.SetNavBar((String)Session["UserType"]);

                //Update instruction label
                SqlProcedures sqlProcedures = new SqlProcedures();
                Instruction instruction = sqlProcedures.LoadInstructions(2);
                lblInstructions.Text = instruction.Body;
            }
        }
    }
}