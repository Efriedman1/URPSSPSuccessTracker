using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace URPSSPSuccessTracker.Classes
{
    public class Administrator
    {
        public int TUID { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public string Email { get; set; }
        public string Active { get; set; }


        public Administrator(int tuid, string firstname, string lastname, string email, string active)
        {

        }
    }
}