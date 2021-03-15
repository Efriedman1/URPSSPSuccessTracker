using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using URPSSPSuccessTracker.Library;

namespace URPSSPSuccessTracker.Classes
{
    public class Student
    {

        private string tuid;
        private string firstName;
        private string lastName;
        private string email;
        private string program;
        private string major;
        private string gradDate;
        private DateTime lastUpdate;
   

        //public Student(int tuid, string firstname, string lastname, string email, string program, string status, string major, DateTime lastupdate)
        //{
        //    TUID = tuid;
        //    FirstName = firstname;
        //    LastName = lastname;
        //    Email = email;
        //    Program = program;
        //    Status = status;
        //    Major = major;
        //    LastUpdate = lastupdate;
        //}


        //null Constructor
        public Student()
        {

        }

        public Student(WebService.StudentObj studentObj, string program, string gradDate)
        {
            TUID = studentObj.tuid;
            FirstName = studentObj.firstName;
            LastName = studentObj.lastName;
            Email = studentObj.email;
            Major = studentObj.major1;
            this.Program = program;
            GradDate = gradDate;
            LastUpdate = DateTime.Now;

        }

        //Auto Implemented Properties
        public String TUID
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
        public string Email
        {
            get { return email; }
            set { email = value; }
        }
        public string Program
        {
            get { return program; }
            set { program = value; }
        }

        public string Major
        {
            get { return major; }
            set { major = value; }
        }

        public string GradDate
        {
            get { return gradDate; }
            set { gradDate = value; }
        }

        public DateTime LastUpdate
        {
            get { return lastUpdate; }
            set { lastUpdate = value; }
        }

    }
}