using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net.Mail;
using URPSSPSuccessTracker.Classes;
using System.Data;

namespace URPSSPSuccessTracker
{
    public partial class AdminSendEmail : System.Web.UI.Page
    {
        List<string> SelectedTUIDs;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                this.Master.SetNavBar((String)Session["UserType"]);
                loadTable();
                SelectedTUIDs = ParseQueryString();
                foreach (string tuid in SelectedTUIDs)
                {
                    System.Diagnostics.Debug.Print(tuid);
                }
            }
        }

        protected List<string> ParseQueryString()
        {
            List<string> values = new List<string>();
            foreach(string key in Request.QueryString.AllKeys)
            {
                values.Add(Request.QueryString[key]);
            }
            return values;
        }

        protected void btnSend_Click(object sender, EventArgs e)
        {
            string subject = txtEmailSubject.Text;
            string body = txtEmailBody.Text;
            List<string> emailList = new List<string>();
            //create 
            foreach (GridViewRow row in gvStudents.Rows)
            {
                emailList.Add(row.Cells[2].Text.Trim());
            }
            List<string> testemail = new List<string>();
            testemail.Add("tuf53874@temple.edu");


            MailMessage mailMessage = new MailMessage();
            MailAddress mailAddress = new MailAddress("noreply@temple.edu", "URPSSP");
            SmtpClient smtpClient = new SmtpClient("smtp.temple.edu", 25);

        
            mailMessage.To.Add("tuf53874@temple.edu");
            mailMessage.From = mailAddress;

            mailMessage.Subject = subject;
            mailMessage.Body = body;
            mailMessage.IsBodyHtml = true;
            Session["Students"] = null;

            smtpClient.Send(mailMessage);
            //return true;

            //testEmail();

            /*
            if (sendEmail(subject, body, testemail))
            {
                txtEmailSubject.Text = "";
                txtEmailBody.Text = "";
                lblEmailSent.Visible = true;
                lblEmailSent.Text = "Email sent.";
            }
            else
            {
                lblEmailSent.Visible = true;
            }*/
        }

        //public void testEmail()
        //{
        //    Email email = new Email();
        //    email.SendMail("tuf53874@temple.edu", "noreply@temple.edu", "hello", "Manchester City are 2021 UEFA Champion!!!");
        //}

        protected void btnAddStudent_Click(object sender, EventArgs e)
        {
            Response.Redirect("AdminHome.aspx");
        }

        protected bool sendEmail(string subject, string body, List<string> emailList)
        {
            try
            {
                MailMessage mailMessage = new MailMessage();
                string from = Session["mail"].ToString();
                MailAddress mailAddress = new MailAddress("noreply@temple.edu", "URPSSP");
                SmtpClient smtpClient = new SmtpClient("smtp.temple.edu", 25);

                /*mailMessage.From = mailAddress;                
                foreach (var item in emailList)
                {
                    mailMessage.Bcc.Add(item);
                }*/

                //for testing
                mailMessage.To.Add("tuf53874@temple.edu");
                mailMessage.From = new MailAddress("tuf53874@temple.edu");

                mailMessage.Subject = subject;
                mailMessage.Body = body;
                mailMessage.IsBodyHtml = true;
                Session["Students"] = null;

                smtpClient.Send(mailMessage);
                return true;
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex);
                lblEmailSent.Text = ex.ToString();
                return false;
            }
        }

        protected void loadTable()
        {
            SqlProcedures sqlProcedures = new SqlProcedures();
            List<Student> studentList = new List<Student>();

            if (Session["Students"] == null)
            {// email all
                DataSet ds = sqlProcedures.GetAllStudents();
                DataTable dt = ds.Tables[0];
                foreach (DataRow row in dt.Rows)
                {
                    Student student = new Student();
                    //student.TUID = Convert.ToInt32(row[0].ToString());
                    student.TUID = row[0].ToString();
                    student.FirstName = row[1].ToString();
                    student.LastName = row[2].ToString();
                    student.Email = row[3].ToString();
                    student.Program = row[4].ToString();
                    student.Major = row[5].ToString();
                    studentList.Add(student);
                }
                Session["Students"] = studentList;

            }
            else
            {// get emails from list of tuid
                studentList = Session["Students"] as List<Student>;
            }
            gvStudents.DataSource = studentList;
            gvStudents.DataBind();
        }

        protected void gvStudents_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int rowIndex = e.RowIndex;
            List<Student> studentList = Session["Students"] as List<Student>;
            studentList.RemoveAt(rowIndex);
            Session["Students"] = studentList;
            loadTable();
        }
    }
}