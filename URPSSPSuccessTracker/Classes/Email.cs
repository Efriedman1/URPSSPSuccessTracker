using System;
using System.Collections.Specialized;
using System.Data;
using System.Data.SqlClient;
using System.Net.Mail;
using System.Web.UI.WebControls;
using Template;

namespace Capstone_Template_SSO.Classes
{
    public class Email
    {
        //Connection conn = new Connection();
        private MailMessage objMail = new MailMessage();
        private MailAddress toAddress;
        private MailAddress fromAddress;
        private String subject;
        private String messageBody;
        private Boolean isHTMLBody = true;
        private MailPriority priority = MailPriority.Normal;
        private String mailHost = "smtp.temple.edu";
        private int port = 25;

        /*Default Email Method*/
        public void SendMail(String recipient, String sender, String body, String subject)
        {
            try
            {
                this.Recipient = recipient;
                this.Sender = sender;
                this.Subject = subject;
                this.Message = body;

                
                objMail.To.Add(this.toAddress);
                objMail.From = this.fromAddress;
                objMail.Subject = this.subject;
                objMail.Body = this.messageBody;

                
                objMail.IsBodyHtml = this.isHTMLBody;
                objMail.Priority = this.priority;

                SmtpClient smtpMailClient = new SmtpClient(this.mailHost, this.port);
                smtpMailClient.Send(objMail);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        /*My customizable HTML email methods*/
        //public void Send_Invoice(String TU_ID, String Unique_ID)
        //{
        //    /*Getting Database Information*/
        //    SqlCommand objCommand = new SqlCommand();
        //    objCommand.CommandType = CommandType.StoredProcedure;
        //    objCommand.CommandText = "Email_Select_ByID";
        //    SqlParameter Email_ID = new SqlParameter("@Email_ID", 1);
        //    objCommand.Parameters.Add(Email_ID);
        //    DataSet ds = conn.GetDataSetUsingCmdObj(objCommand);

        //    /*Getting User Information*/
        //    WebService.LDAPuser result = WebService.Webservice.getLDAPEntryByTUID(TU_ID);

        //    /*Sending Email with customized content*/
        //    try
        //    {
        //        String First_Name = result.cn;
        //        String Recipient = result.mail;

        //        MailDefinition md = new MailDefinition();
        //        md.IsBodyHtml = true;
        //        md.From = "tylercs@temple.edu";
        //        md.Subject = ds.Tables[0].Rows[0]["Email_Subject"].ToString();
        //        string body = ds.Tables[0].Rows[0]["Email_Content"].ToString();

        //        ListDictionary replacements = new ListDictionary();
        //        replacements.Add("{Full_Name}", First_Name);
        //        replacements.Add("{Query_ID}", Unique_ID);

        //        using (MailMessage msg = md.CreateMailMessage(Recipient, replacements, body, new System.Web.UI.Control()))
        //        {
        //            SmtpClient client = new SmtpClient(this.mailHost);
        //            client.Send(msg);
        //        }
        //    }
        //    catch (Exception ex)
        //    {
        //        throw ex;
        //    }
        //}
        //public void Send_Receipt(String TU_ID, String Item_Name, String Total_Cost, String Unique_ID)
        //{
        //    /*Getting Database Information*/
        //    SqlCommand objCommand = new SqlCommand();
        //    objCommand.CommandType = CommandType.StoredProcedure;
        //    objCommand.CommandText = "Email_Select_ByID";
        //    SqlParameter Email_ID = new SqlParameter("@Email_ID", 2);
        //    objCommand.Parameters.Add(Email_ID);
        //    DataSet ds = conn.GetDataSetUsingCmdObj(objCommand);

        //    /*Getting User Information*/
        //    WebService.LDAPuser result = WebService.Webservice.getLDAPEntryByTUID(TU_ID);

        //    /*Sending Email with customized content*/
        //    try
        //    {
        //        String First_Name = result.cn;
        //        String Recipient = result.mail;

        //        MailDefinition md = new MailDefinition();
        //        md.IsBodyHtml = true;
        //        md.From = "tylercs@temple.edu";
        //        md.Subject = ds.Tables[0].Rows[0]["Email_Subject"].ToString(); ;
        //        string body = ds.Tables[0].Rows[0]["Email_Content"].ToString();

        //        ListDictionary replacements = new ListDictionary();
        //        replacements.Add("{Full_Name}", First_Name);
        //        replacements.Add("{Item_Name}", Item_Name);
        //        replacements.Add("{Total_Cost}", Total_Cost);
        //        replacements.Add("{Query_ID}", Unique_ID);

        //        using (MailMessage msg = md.CreateMailMessage(Recipient, replacements, body, new System.Web.UI.Control()))
        //        {
        //            SmtpClient client = new SmtpClient(this.mailHost);
        //            client.Send(msg);
        //        }
        //    }
        //    catch (Exception ex)
        //    {
        //        throw ex;
        //    }
        //}
        //public void Send_Refund_Accepted(String TU_ID, String Item_Name, String Total_Cost, String Notes)
        //{
        //    /*Getting Database Information*/
        //    SqlCommand objCommand = new SqlCommand();
        //    objCommand.CommandType = CommandType.StoredProcedure;
        //    objCommand.CommandText = "Email_Select_ByID";
        //    SqlParameter Email_ID = new SqlParameter("@Email_ID", 3);
        //    objCommand.Parameters.Add(Email_ID);
        //    DataSet ds = conn.GetDataSetUsingCmdObj(objCommand);

        //    /*Getting User Information*/
        //    WebService.LDAPuser result = WebService.Webservice.getLDAPEntryByTUID(TU_ID);

        //    /*Sending Email with customized content*/
        //    try
        //    {
        //        String First_Name = result.cn;
        //        String Recipient = result.mail;

        //        MailDefinition md = new MailDefinition();
        //        md.IsBodyHtml = true;
        //        md.From = "tylercs@temple.edu";
        //        md.Subject = ds.Tables[0].Rows[0]["Email_Subject"].ToString(); ;
        //        string body = ds.Tables[0].Rows[0]["Email_Content"].ToString();

        //        ListDictionary replacements = new ListDictionary();
        //        replacements.Add("{Full_Name}", First_Name);
        //        replacements.Add("{Item_Name}", Item_Name);
        //        replacements.Add("{Total_Cost}", Total_Cost);
        //        replacements.Add("{Notes}", Notes);

        //        using (MailMessage msg = md.CreateMailMessage(Recipient, replacements, body, new System.Web.UI.Control()))
        //        {
        //            SmtpClient client = new SmtpClient(this.mailHost);
        //            client.Send(msg);
        //        }
        //    }
        //    catch (Exception ex)
        //    {
        //        throw ex;
        //    }
        //}
        //public void Send_Refund_Rejected(String TU_ID, String Item_Name, String Notes)
        //{
        //    /*Getting Database Information*/
        //    SqlCommand objCommand = new SqlCommand();
        //    objCommand.CommandType = CommandType.StoredProcedure;
        //    objCommand.CommandText = "Email_Select_ByID";
        //    SqlParameter Email_ID = new SqlParameter("@Email_ID", 4);
        //    objCommand.Parameters.Add(Email_ID);
        //    DataSet ds = conn.GetDataSetUsingCmdObj(objCommand);

        //    /*Getting User Information*/
        //    WebService.LDAPuser result = WebService.Webservice.getLDAPEntryByTUID(TU_ID);

        //    /*Sending Email with customized content*/
        //    try
        //    {
        //        String First_Name = result.cn;
        //        String Recipient = result.mail;

        //        MailDefinition md = new MailDefinition();
        //        md.IsBodyHtml = true;
        //        md.From = "tylercs@temple.edu";
        //        md.Subject = ds.Tables[0].Rows[0]["Email_Subject"].ToString(); ;
        //        string body = ds.Tables[0].Rows[0]["Email_Content"].ToString();

        //        ListDictionary replacements = new ListDictionary();
        //        replacements.Add("{Full_Name}", First_Name);
        //        replacements.Add("{Item_Name}", Item_Name);
        //        replacements.Add("{Notes}", Notes);

        //        using (MailMessage msg = md.CreateMailMessage(Recipient, replacements, body, new System.Web.UI.Control()))
        //        {
        //            SmtpClient client = new SmtpClient(this.mailHost);
        //            client.Send(msg);
        //        }
        //    }
        //    catch (Exception ex)
        //    {
        //        throw ex;
        //    }
        //}

        /*Getters and Setters*/
        public String Recipient
        {
            get { return this.toAddress.ToString(); }
            set { this.toAddress = new MailAddress(value); }
        }
        public String Sender
        {
            get { return this.fromAddress.ToString(); }
            set { this.fromAddress = new MailAddress(value); }
        }
        public String Subject
        {
            get { return this.subject; }
            set { this.subject = value; }
        }
        public String Message
        {
            get { return this.messageBody; }
            set { this.messageBody = value; }
        }
        public Boolean HTMLBody
        {
            get { return this.isHTMLBody; }
            set { this.isHTMLBody = value; }
        }
        public MailPriority Priority
        {
            get { return this.priority; }
            set { this.priority = value; }
        }
        public String MailHost
        {
            get { return this.mailHost; }
            set { this.mailHost = value; }
        }
    }
}