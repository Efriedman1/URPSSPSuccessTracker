using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace URPSSPSuccessTracker.Classes
{
    public class Student
    {
        public int TUID { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public string Email { get; set; }
        public string Program { get; set; }
        public string Status { get; set; }
        public string Major { get; set; }
        public DateTime LastUpdate { get; set; }

        public Student(int tuid, string firstname, string lastname, string email, string program, string status, string major, DateTime lastupdate)
        {
            TUID = tuid;
            FirstName = firstname;
            LastName = lastname;
            Email = email;
            Program = program;
            Status = status;
            Major = major;
            LastUpdate = lastupdate;
        }
    }
}