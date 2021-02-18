using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using URPSSPSuccessTracker.Classes;
using System.Data;
using System.Text;

namespace URPSSPSuccessTracker
{
    public partial class DBTest : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnTest_Click(object sender, EventArgs e)
        {
            SqlProcedures UrpSqlProcedures = new SqlProcedures();
            if (UrpSqlProcedures.TestConnection())
            {
                lblTest.Text = "urpDB connection established";
                DataSet testData = new DataSet();
                testData = UrpSqlProcedures.LoadAdministrator();
                StringBuilder sbTest = new StringBuilder();
                for (int i = 0; i < testData.Tables[0].Rows.Count; i++)
                {
                    sbTest.Append(testData.Tables[0].Rows[i][1] + "\n");
                }
                lblTest.Text = sbTest.ToString();
            }
            else
            {
                lblTest.Text = "Connection Failed to Open";
            }
        }

        protected void btnTest2_Click(object sender, EventArgs e)
        {
            SqlProcedures UrpSqlProcedures = new SqlProcedures();
            Instruction instruction = UrpSqlProcedures.LoadInstructions(1);
            lblTest2.Text = instruction.Body;
        }
    }
}