using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net.Mail;

namespace URPSSPSuccessTracker
{
    public partial class AdminSendEmail : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {          
            if (!IsPostBack)
            {
                this.Master.SetNavBar((String)Session["UserType"]);

            }
        }

        protected void btnSend_Click(object sender, EventArgs e)
        {
            string subject = txtEmailSubject.Text;
            string body = txtEmailBody.Text;
            List<string> emailList = new List<string>();
            //create 
            foreach (var row in tblStudentEmail.Rows)
            {
                if (row.GetType() == typeof(TableRow))
                {
                    emailList.Add((row as TableRow).Cells[1].Text.Trim());
                }
            }

            sendEmail(subject, body, emailList);
            txtEmailSubject.Text = "";
            txtEmailBody.Text = "";
            lblEmailSent.Visible = true;
        }

        protected void btnAddStudent_Click(object sender, EventArgs e)
        {
            Response.Redirect("AdminSearchStudent.aspx");
        }

        protected void sendEmail(string subject, string body, List<string> emailList)
        {
            MailMessage mailMessage = new MailMessage();
            MailAddress mailAddress = new MailAddress(Session["mail"].ToString(), "URPSSP");
            SmtpClient smtpClient = new SmtpClient("smtp.temple.edu", 25);

            mailMessage.From = mailAddress;
            foreach (var item in emailList)
            {
                mailMessage.To.Add(item);
            }
            mailMessage.Subject = subject;
            mailMessage.Body = body;
            mailMessage.IsBodyHtml = true;

            //uncomment to send
            //smtpClient.Send(mailMessage);
        }
    }
}