using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Configuration;
using URPSSPSuccessTracker.WS_LDAP_Search;
using URPSSPSuccessTracker.WS_Programs_And_Degrees;
using URPSSPSuccessTracker.WS_Student_Search;

namespace URPSSPSuccessTracker
{
    public class WebService
    {
        /// <summary>
        /// Class to create an LDAP User.  Also, due to the lack of Faculty Web service calls, this will be the primary object for
        /// Faculty Login
        /// </summary>
        public class LDAPuser
        {
            public string templeEduID;
            public string uID;
            public string cn;
            public string givenName;
            public string sn;
            public string eduPersonAffiliation;
            public string eduPersonPrimaryAffiliation;
            public string mail;
            public string title;
        }

        /// <summary>
        /// Class for identifying Term
        /// </summary>
        public class Term
        {
            public string termCode;
            public string termName;
            public string startDate;
            public string endDate;
            public string registrationStartDate;
            public string registrationEndDate;
        }

        /// <summary>
        /// Student Object 
        /// </summary>
        public class StudentObj
        {
            public string firstName { get; set; }
            public string middleInit { get; set; }
            public string lastName { get; set; }
            public string tuid { get; set; }
            public string email { get; set; }
            public string school { get; set; }
            public string major1 { get; set; }
            public string major2 { get; set; }

            public StudentObj() { }

            //Big ol' constructor
            public StudentObj(string firstName, string middleInit, string lastName, string tuid, string email, string school, string major1, string major2)
            {
                this.firstName = firstName;
                this.middleInit = middleInit;
                this.lastName = lastName;
                this.tuid = tuid;
                this.email = email;
                this.school = school;
                this.major1 = major1;
                this.major2 = major2;
            }
        }

        /// <summary>
        /// Class to hold College Info
        /// </summary>
        public class College
        {
            public string collegeName;
            public string collegeCode;


            public string major { get; set; }
            public string majorCode { get; set; }
        }

        /// <summary>
        /// This is a helper class for Web Service requests
        /// </summary>

        public static class Webservice
        {
            private static readonly string webServiceUsername = ConfigurationManager.AppSettings["Connection_WS_Username"];
            private static readonly string webServicePassword = ConfigurationManager.AppSettings["Connection_WS_Password"];

            /// <summary>
            /// Creates a LDAPuser (Person Object) when passing a TUID
            /// </summary>
            /// <param name="tuID">TUID</param>
            /// <returns>LDAPuser</returns>
            public static LDAPuser getLDAPEntryByTUID(string tuID)
            {
                // Create the WebService proxy, send the search request and receive the TempleLDAPEntry object
                LDAP_Search ldapProxy = new LDAP_Search();

                TempleLDAPEntry[] results = new TempleLDAPEntry[1];
                results = ldapProxy.Search(webServiceUsername, webServicePassword, "templeEduTUID", tuID);
                TempleLDAPEntry resultEntry = results[0];

                // Check if request was successful
                if (resultEntry.error == null) // Success
                {
                    // Create our TempleLDAPEntry object to be returned
                    LDAPuser personLDAPEntry = new LDAPuser();
                    personLDAPEntry.templeEduID = resultEntry.templeEduTUID;
                    personLDAPEntry.uID = resultEntry.uid;
                    personLDAPEntry.cn = resultEntry.cn;
                    personLDAPEntry.givenName = resultEntry.givenName;
                    personLDAPEntry.sn = resultEntry.sn;
                    personLDAPEntry.eduPersonAffiliation = resultEntry.eduPersonAffiliation;
                    personLDAPEntry.eduPersonPrimaryAffiliation = resultEntry.eduPersonPrimaryAffiliation;
                    personLDAPEntry.mail = resultEntry.mail;
                    personLDAPEntry.title = resultEntry.title;

                    return personLDAPEntry;
                }
                else // Something went wrong..
                {
                    return null;
                }
            }

            /// <summary>
            /// Takes in an accessnet and returns an LDAPuser (Person Object) based on that AccessnetID
            /// </summary>
            /// <param name="accessnetID"></param>
            /// <returns>LDAPuser</returns>
            public static LDAPuser getLDAPEntryByAccessnet(string accessnetID)
            {
                // Create the WebService proxy, send the search request and receive the TempleLDAPEntry object
                LDAP_Search ldapProxy = new LDAP_Search();
                TempleLDAPEntry[] results = new TempleLDAPEntry[1];
                results = ldapProxy.Search(webServiceUsername, webServicePassword, "uid", accessnetID);
                TempleLDAPEntry resultEntry = results[0];

                // Check if request was successful
                if (resultEntry.error == null) // Success
                {
                    // Create our TempleLDAPEntry object to be returned
                    LDAPuser personLDAPEntry = new LDAPuser();
                    personLDAPEntry.templeEduID = resultEntry.templeEduTUID;
                    personLDAPEntry.uID = resultEntry.uid;
                    personLDAPEntry.cn = resultEntry.cn;
                    personLDAPEntry.givenName = resultEntry.givenName;
                    personLDAPEntry.sn = resultEntry.sn;
                    personLDAPEntry.eduPersonAffiliation = resultEntry.eduPersonAffiliation;
                    personLDAPEntry.eduPersonPrimaryAffiliation = resultEntry.eduPersonPrimaryAffiliation;
                    personLDAPEntry.mail = resultEntry.mail;
                    personLDAPEntry.title = resultEntry.title;
                    return personLDAPEntry;
                }
                else // Something went wrong..
                {
                    return null;
                }
            }

            /// <summary>
            /// Takes in an Email and returns a LDAP Object(Person Object) of that User
            /// </summary>
            /// <param name="emailAlias"></param>
            /// <returns>LDAPuser</returns>
            public static LDAPuser getLDAPEntryByEmailAlias(string emailAlias)
            {
                // Split the email address and get the contents before the @
                string[] splitEmailAlias = emailAlias.Split('@');
                string templeEduTUNA = splitEmailAlias[0];

                // Create the WebService proxy, send the search request and receive the TempleLDAPEntry object
                LDAP_Search ldapProxy = new LDAP_Search();
                TempleLDAPEntry[] results = new TempleLDAPEntry[1];
                results = ldapProxy.Search(webServiceUsername, webServicePassword, "templeEduTUNA", templeEduTUNA);
                TempleLDAPEntry resultEntry = results[0];

                // Check if request was successful
                if (resultEntry.error == null) // Success
                {
                    // Create our TempleLDAPEntry object to be returned
                    LDAPuser personLDAPEntry = new LDAPuser();
                    personLDAPEntry.templeEduID = resultEntry.templeEduTUID;
                    personLDAPEntry.uID = resultEntry.uid;
                    personLDAPEntry.cn = resultEntry.cn;
                    personLDAPEntry.givenName = resultEntry.givenName;
                    personLDAPEntry.sn = resultEntry.sn;
                    personLDAPEntry.eduPersonAffiliation = resultEntry.eduPersonAffiliation;
                    personLDAPEntry.eduPersonPrimaryAffiliation = resultEntry.eduPersonPrimaryAffiliation;
                    personLDAPEntry.mail = resultEntry.mail;
                    personLDAPEntry.title = resultEntry.title;



                    return personLDAPEntry;
                }
                else // Something went wrong..
                {
                    return null;
                }
            }

            /// <summary>
            /// Gets the Current Term of the Current Date
            /// </summary>
            /// <returns>Term Object</returns>
            public static Term getCurrentTerm()
            {
                WS_Student studentProxy = new WS_Student();
                Result results = new Result();
                results = studentProxy.GetCurrentTerm(webServiceUsername, webServicePassword);

                // Check if request was successful
                if (results.Status == "OK") // Success
                {
                    Term returnTerm = new Term();
                    WS_Student_Search.Term[] t = results.Terms;
                    returnTerm.termCode = t[0].code;
                    returnTerm.termName = t[0].name;
                    returnTerm.startDate = t[0].startDate;
                    returnTerm.endDate = t[0].endDate;

                    return returnTerm;
                }
                else // Something went wrong...
                {
                    return null;
                }
            }

            /// <summary>
            /// Takes in a Terms Code and returns the Term Object associated with it
            /// </summary>
            /// <param name="termCode"></param>
            /// <returns>Term Object</returns>
            public static Term getTermByTermCode(string termCode)
            {
                WS_Student studentProxy = new WS_Student();
                Result results = new Result();
                results = studentProxy.GetTermByTermCode(webServiceUsername, webServicePassword, termCode);

                // Check if request was successful
                if (results.Status == "OK") // Success
                {
                    Term returnTerm = new Term();
                    WS_Student_Search.Term[] t = results.Terms;
                    returnTerm.termCode = t[0].code;
                    returnTerm.termName = t[0].name;
                    returnTerm.startDate = DateTime.Parse(t[0].startDate).ToShortDateString().ToString();
                    returnTerm.endDate = DateTime.Parse(t[0].endDate).ToShortDateString().ToString();
                    return returnTerm;
                }
                else // Something went wrong...
                {
                    return null;
                }
            }


            /// <summary>
            /// Takes in a Date and returns the Term it is in
            /// </summary>
            /// <param name="date"></param>
            /// <returns></returns>
            public static Term GetTermByDate(string date)
            {
                WS_Student studentProxy = new WS_Student();
                Result results = new Result();
                results = studentProxy.GetTermByDate(webServiceUsername, webServicePassword, date);

                // Check if request was successful
                if (results.Status == "OK") // Success
                {
                    Term returnTerm = new Term();
                    WS_Student_Search.Term[] t = results.Terms;
                    returnTerm.termCode = t[0].code;
                    returnTerm.termName = t[0].name;
                    returnTerm.startDate = t[0].startDate;
                    returnTerm.endDate = t[0].endDate;

                    return returnTerm;
                }
                else // Something went wrong...
                {
                    return null;
                }
            }

            /// <summary>
            /// Returns an array of all colleges
            /// </summary>
            /// <returns></returns>
            public static College[] getAllColleges()
            {
                try
                {
                    ProgramsAndDegrees programsProxy = new ProgramsAndDegrees();
                    ProgramsAndDegreesEntry[] results = new ProgramsAndDegreesEntry[30];
                    results = programsProxy.GetAllColleges(webServiceUsername, webServicePassword);

                    College[] colleges = new College[results.Length];

                    for (int i = 0; i < results.Length; i++)
                    {
                        College c = new College();
                        c.collegeName = results[i].college.ToString();
                        c.collegeCode = results[i].collegeCode.ToString();
                        colleges[i] = c;
                    }

                    return colleges;
                }
                catch (Exception ex)
                {
                    return null;
                }
            }


            /// <summary>
            /// Returns an array of all programs
            /// </summary>
            /// <returns></returns>
            public static List<College> getAllPrograms()
            {
                try
                {
                    List<College> programList = new List<College>();

                    ProgramsAndDegrees programsProxy = new ProgramsAndDegrees();
                    ProgramsAndDegreesEntry[] results = new ProgramsAndDegreesEntry[30];
                    results = programsProxy.GetAllPrograms(webServiceUsername, webServicePassword);

                    College[] colleges = new College[results.Length];

                    for (int i = 0; i < results.Length; i++)
                    {
                        College c = new College();
                        c.collegeName = results[i].college.ToString();
                        c.collegeCode = results[i].collegeCode.ToString();
                        c.major = results[i].major.ToString();
                        c.majorCode = results[i].majorCode.ToString();
                        programList.Add(c);
                    }

                    return programList;
                }
                catch (Exception ex)
                {
                    return null;
                }
            }

            /// <summary>
            /// Takes in a College Code and returns a Name Identified by that Code
            /// </summary>
            /// <param name="collegeCode"></param>
            /// <returns></returns>
            public static string getCollegeNameByCollegeCode(string collegeCode)
            {
                try
                {
                    ProgramsAndDegrees programsProxy = new ProgramsAndDegrees();
                    ProgramsAndDegreesEntry[] results = new ProgramsAndDegreesEntry[30];
                    results = programsProxy.GetAllColleges(webServiceUsername, webServicePassword);

                    foreach (ProgramsAndDegreesEntry entry in results)
                    {
                        if (entry.collegeCode.Equals(collegeCode))
                        {
                            return entry.college;
                        }
                    }
                }
                catch (Exception)
                {
                    return null;
                }

                return null;
            }

            /// <summary>
            /// takes in a TUID and creates a StudentObj with Full name, Email, TUID, Major, and College Code
            /// </summary>
            /// <param name="TUID"></param>
            /// <returns></returns>
            public static StudentObj getStudentInfo(string TUID)
            {
                //////// Get LDAP Info
                StudentObj student = new StudentObj();
                LDAPuser entry = getLDAPEntryByTUID(TUID);

                if (entry != null)
                {
                    //Split users name into first, middle, and last
                    student = GetStudentPersonInfoByAccessNet(entry.uID);

                    if (student != null)
                    {
                        student.email = entry.mail;
                        student.tuid = entry.templeEduID;
                    }
                    else
                    {
                        student = new StudentObj()
                        {
                            firstName = "Error retrieving first name",
                            middleInit = "Error retrieving middle initial",
                            lastName = "Error retrieving last name",
                            email = entry.mail,
                            tuid = entry.templeEduID
                        };
                    }

                    //////// Get Academic Info
                    WS_Student studentProxy = new WS_Student();
                    Result results = new Result();
                    results = studentProxy.GetAcademicInfoByTUID(webServiceUsername, webServicePassword, TUID);

                    // Check if request was successful
                    if (results.Status == "OK") // Success
                    {
                        Student[] s = results.Students;
                        student.major1 = s[0].major1;
                        student.major2 = s[0].major2;
                        student.school = s[0].degree;
                    }
                    else // Something went wrong...
                    {
                        return null;
                    }
                }

                return student;
            }

            /// <summary>
            /// takes in a faculty TUID and returns a string of the title(ie. Employee, Faculty) they hold
            /// </summary>
            /// <param name="TUID"></param>
            /// <returns>String</returns>
            public static String getFacultyTitleByTUID(string TUID)
            {
                // Create the WebService proxy, send the search request and receive the TempleLDAPEntry object
                LDAP_Search ldapProxy = new LDAP_Search();
                TempleLDAPEntry[] results = new TempleLDAPEntry[1];
                results = ldapProxy.Search(webServiceUsername, webServicePassword, "templeEduTUID", TUID);
                TempleLDAPEntry resultEntry = results[0];

                // Check if request was successful
                if (resultEntry.error == null) // Success
                {
                    string[] affiliations = resultEntry.eduPersonAffiliation.Split(',');
                    foreach (string s in affiliations)
                    {
                        if (s.Equals("faculty"))
                        {
                            return resultEntry.title;
                        }
                    }

                    return null;
                }
                else // Something went wrong..
                {
                    return null;
                }
            }

            /// <summary>
            /// Takes in a AccessNet username and creates a StudentObj with the user's first, last, and middle name
            /// already split
            /// </summary>
            /// <param name="accessNet">AccessNet username</param>
            /// <returns>StudentObj</returns>
            public static StudentObj GetStudentPersonInfoByAccessNet(string accessNet)
            {
                try
                {
                    WS_Student proxy = new WS_Student();
                    Result results = new Result();
                    results = proxy.GetPersonalInfoByAccessNet(webServiceUsername, webServicePassword, accessNet);

                    StudentObj student = new StudentObj();

                    if (results.Status == "OK")
                    {
                        Student[] s = results.Students;
                        student.firstName = IsNull(s[0].firstName);
                        student.middleInit = IsNull(s[0].middleInitial);
                        student.lastName = IsNull(s[0].lastName);
                    }

                    return student;
                }
                catch (Exception ex)
                {
                    return null;
                }
            }

            /// <summary>
            /// Checks if string is null or empty and if so returns empty string.
            /// </summary>
            /// <param name="str"></param>
            /// <returns>String</returns>
            private static string IsNull(string str)
            {
                if (string.IsNullOrEmpty(str))
                {
                    return "";
                }
                else
                    return str;
            }


        }
    }
}