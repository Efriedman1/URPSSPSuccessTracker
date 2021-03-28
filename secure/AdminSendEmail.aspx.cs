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
                SelectedTUIDs = ParseQueryString();
                foreach (string tuid in SelectedTUIDs)
                {
                    System.Diagnostics.Debug.Print(tuid);

                }
                //
                if (SelectedTUIDs.Count > 0)
                {
                    SqlProcedures sqlProcedures = new SqlProcedures();

                    List<Student> studentList = new List<Student>();
                    foreach (var item in SelectedTUIDs)
                    {
                        DataSet ds = sqlProcedures.SearchStudent(Convert.ToInt32(item),"","","","","");

                        DataTable dt = ds.Tables[0];
                        DataRow row = dt.Rows[0];
                        Student student = new Student();

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

                loadTable();

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
            ScriptManager.RegisterStartupScript(this, GetType(), "Script", "emailPopup();", true);

        }

        public void testEmail()
        {
            Email email = new Email();
            email.SendMail("tuf53874@temple.edu", "tuf53874@temple.edu", "test", "test");
        }

        protected void btnAddStudent_Click(object sender, EventArgs e)
        {
            Response.Redirect("AdminHomeDatatable.aspx");
        }

        //moved to email class
        protected bool sendEmail(string subject, string body, List<string> emailList)
        {
            try
            {
                MailMessage mailMessage = new MailMessage();
                string from = Session["mail"].ToString();
                MailAddress mailAddress = new MailAddress("noreply@temple.edu", "URPSSP");
                SmtpClient smtpClient = new SmtpClient("smtp.temple.edu", 25);
                
                mailMessage.From = mailAddress;      
                /*
                foreach (var item in emailList)
                {
                    mailMessage.Bcc.Add(item);
                }
                */

                //for testing
                mailMessage.Bcc.Add("tuf53874@temple.edu");

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

        protected void btnYes_Click(object sender, EventArgs e)
        {
            
            string subject = txtEmailSubject.Text;
            string body = txtEmailBody.Text;
            List<string> emailList = new List<string>();
            //create 
            foreach (GridViewRow row in gvStudents.Rows)
            {
                emailList.Add(row.Cells[2].Text.Trim());
            }

            Email email = new Email();
            if (email.SendNewMail(subject, body, emailList))
            {
                txtEmailSubject.Text = "";
                txtEmailBody.Text = "";
                lblEmailSent.Visible = true;
                lblEmailSent.Text = "Email sent!!";
                ScriptManager.RegisterStartupScript(this, GetType(), "Script", "emailSent();", true);
            }
        }
    }
}