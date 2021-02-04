using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace URPSSPSuccessTracker
{
    public partial class AdminDownload : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                this.Master.SetNavBar((String)Session["UserType"]);
            }
        }

        protected void btnUpload_Click(object sender, EventArgs e)
        {
            //Check if the file is an xls file
            if (fileUploadTemplate.HasFile)
            {
                //if the file includes xls then use it
                if (validateTemplate.IsValid)
                {
                    //the file uploaded is valid and begin reading file

                }
               
                else
                {
                    //the file is not valid/ show error message
                    lblError.Text = "Must upload a valid formatted '.xls' file";
                    lblError.Visible = true;
                }
                
            }

            //If no file was uploaded then put error message
            else
            {
                lblError.Text = "Must upload a valid formatted '.xls' file";
                lblError.Visible = true;
            }

           

        }//end of btnUpload Click
    }
}