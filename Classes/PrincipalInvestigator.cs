using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using URPSSPSuccessTracker.Library;

namespace URPSSPSuccessTracker.Classes
{
    public class PrincipalInvestigator
    {
        private WebService.LDAPuser ldap;
        private string department;


        //null Constructor
        public PrincipalInvestigator()
        {

        }

        public PrincipalInvestigator(WebService.LDAPuser ldap, string department)
        {
            this.ldap = ldap;
            this.department = department;

        }


        public WebService.LDAPuser LDAP
        {
            get { return ldap; }
            set { ldap = value; }
        }

        public string Department
        {
            get { return department; }
            set { department = value; }
        }
    }
}