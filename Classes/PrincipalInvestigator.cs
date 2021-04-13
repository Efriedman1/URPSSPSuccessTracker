using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using URPSSPSuccessTracker.Library;


namespace URPSSPSuccessTracker.Classes
{
    public class PrincipalInvestigator
    {

        private string tuid;
        private string firstName;
        private string lastName;
        private string email;
        private string department;
        private DateTime lastUpdate;


        //null Constructor
        public PrincipalInvestigator()
        {

        }

        public PrincipalInvestigator(WebService.LDAPuser piObj, string department, string tuid)
        {

            TUID = tuid;
            FirstName = piObj.givenName;
            LastName = piObj.sn;
            Email = piObj.mail;
            Department = department;
            LastUpdate = DateTime.Now;
            
        }

        public string TUID
        {
            get { return tuid; }
            set { tuid = value; }
        }

        public string FirstName
        {
            get { return firstName; }
            set { firstName = value; }
        }

        public string LastName
        {
            get { return lastName; }
            set { lastName = value; }
        }

        public string Department
        {
            get { return department; }
            set { department = value; }
        }

        public string Email
        {
            get { return email; }
            set { email = value; }
        }

        public DateTime LastUpdate
        {
            get { return lastUpdate; }
            set { lastUpdate = value; }
        }

    }
}