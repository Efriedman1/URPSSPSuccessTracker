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

        public PrincipalInvestigator(WebService.StudentObj studentObj, string department)
        {
            TUID = studentObj.tuid;
            FirstName = studentObj.firstName;
            LastName = studentObj.lastName;
            Email = studentObj.email;
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