using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace URPSSPSuccessTracker.Classes
{
    public class PrincipalInvestigator
    {
        public int TUID { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public string School { get; set; }
        public string Department { get; set; }
        public string Campus { get; set; }
        public string PhoneNumber { get; set; }
        public string Email { get; set; }
        public DateTime LastUpdate { get; set; }

        public PrincipalInvestigator(int tuid, string firstname, string lastname, string school, string department, string campus, string phonenumber, string email, DateTime lastupdate)
        {
            TUID = tuid;
            FirstName = firstname;
            LastName = lastname;
            Email = email;
            School = school;
            Department = department;
            Campus = campus;
            PhoneNumber = phonenumber;
            Email = email;
            LastUpdate = lastupdate;
        }
    }
}