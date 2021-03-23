using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using URPSSPSuccessTracker.Classes;
using URPSSPSuccessTracker.Library;

namespace URPSSPSuccessTracker.secure
{
    public partial class _default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //Variables
            string employeeNumber = string.Empty, eduPersonPrincipalName = string.Empty, mail = string.Empty, affiliation = string.Empty;

            /* Check if the application is running demo mode */
            //if (ConfigurationManager.AppSettings["demo_mode"].ToLower().Equals("false"))
            //{
            /* Check if the application is running locally for development
             * Retrieve request header information
             */
            if (HttpContext.Current.Request.IsLocal.Equals(true))
            {
                /*The SSO Sign-on page will not appear while running locally. This is only used for development.*/

                //dummy data for local 
                Session["Local"] = "true";
                employeeNumber = "123456789";
                Session["mail"] = "John.Doe@temple.edu";
                Session["affiliation"] = "affiliation";
                Session["eduPersonPrincipalName"] = "eduPersonPrincipalName";
                Session["employeeNumber"] = employeeNumber;
                Session["unscopedaffiliation"] = "unscopedaffiliation";

            }
            else
            {
                /*Application is running on server and the user has active Shibboleth session.*/
                Session["Local"] = "false";
                employeeNumber = GetShibbolethHeaderAttributes();
            }

            /*Use employee number to get user information from web services and then redirect*/
            GetUserInformation(employeeNumber);

            //}
        }

        /// <summary>
        /// Retrieve user information from Shibboleth headers
        /// </summary>
        /// <returns>User's TUid</returns>
        protected string GetShibbolethHeaderAttributes()
        {
            string employeeNumber = Request.Headers["employeeNumber"]; //Use this to retrieve the user's information via the web services  
            Session["SSO_Attribute_mail"] = Request.Headers["mail"];
            Session["SSO_Attribute_affiliation"] = Request.Headers["affiliation"];
            Session["SSO_Attribute_eduPersonPrincipalName"] = Request.Headers["eduPersonPrincipalName"];
            Session["SSO_Attribute_Unscoped_Affiliation"] = Request.Headers["unscopedaffiliation"];
            Session["SSO_Attribute_employeeNumber"] = employeeNumber;
            Session["HTTP_Request_Headers"] = RetrieveHTTPHeaders();

            return employeeNumber;
        }

        private string RetrieveHTTPHeaders()
        {
            StringBuilder headers = new StringBuilder();
            foreach (var key in Request.Headers.AllKeys)
                headers.Append(key + "=" + Request.Headers[key] + "\n");

            return headers.ToString();
        }

        /// <summary>
        /// Use employeeNumber (TUid) to retrieve information about the user
        /// from the web services.
        /// </summary>
        /// <param name="employeeNumber">TUid</param>
        protected void GetUserInformation(string employeeNumber)
        {
            if (!string.IsNullOrWhiteSpace(employeeNumber))
            {
                /*Security Session Variable*/
                Session["Authenticated"] = true;

                /* Requesting user's LDAP information via Web Service */
                WebService.LDAPuser Temple_Information = WebService.Webservice.getLDAPEntryByTUID(employeeNumber);


                WebService.LDAPuser lDAPuser = WebService.Webservice.getLDAPEntryByEmailAlias("fabrizio@temple.edu");


                /* Checking we received something from Web Services*/
                if (Temple_Information != null && employeeNumber != "123456789")
                {
                    /*Populating the Session Object with the user's information*/
                    Session["TU_ID"] = Temple_Information.templeEduID;
                    Session["First_Name"] = Temple_Information.givenName;
                    Session["Last_Name"] = Temple_Information.sn;
                    Session["Email"] = Temple_Information.mail;
                    Session["Title"] = Temple_Information.title;
                    Session["Affiliation_Primary"] = Temple_Information.eduPersonPrimaryAffiliation;
                    Session["Affiliation_Secondary"] = Temple_Information.eduPersonAffiliation;
                    Session["Full_Name"] = Temple_Information.cn;

                    /* If the user is a student, we can request academic information via the Web Service */
                    WebService.StudentObj Student_Information = WebService.Webservice.getStudentInfo(Temple_Information.templeEduID);

                    /* Checking we received something from Web Service and then adding information to the Session Object*/
                    if (Student_Information != null)
                    {
                        Session["School"] = Student_Information.school;
                        Session["Major_1"] = Student_Information.major1;
                        Session["Major_2"] = Student_Information.major2;
                    }
                }

                /*Successful Login */
                if (HttpContext.Current.Request.IsLocal.Equals(true))
                {
                    Response.Redirect("TempLogin.aspx");
                }
                else
                {

                    SqlProcedures sqlProcedures = new SqlProcedures();
                    string ut = sqlProcedures.GetUserRole(employeeNumber);
                    Response.Write("<script>console.log(\"" + employeeNumber + " \");</script>");
                    Response.Write("<script>console.log(\"" + ut + " \");</script>");

                    Session["UserType"] = ut;
                    switch (ut)
                    {
                        case "Admin":
                            Console.WriteLine("admin");

                            Response.Redirect("AdminHomeDatatable.aspx");
                            break;

                        case "PI":
                            Response.Redirect("PIHome.aspx");
                            break;

                        case "Student":
                            Console.WriteLine("student");
                            Response.Redirect("StudentHome.aspx");
                            break;
                        case "":
                            Response.Redirect("~/default.aspx");
                            break;
                    }
                }

            }
            else
            {
                //Error: Couldn't retrieve employeeNumber from request header
                Server.Transfer("500http.aspx");
            }
        }
    }
}