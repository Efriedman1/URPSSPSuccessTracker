using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using URPSSPSuccessTracker.Library;

namespace URPSSPSuccessTracker.Classes
{
    public class Student
    {

        private WebService.StudentObj studentObj;
        private string program;


        //null Constructor
        public Student()
        {

        }

        public Student(WebService.StudentObj studentObj, string program)
        {
            this.studentObj = studentObj;
            this.program = program;

        }


        public WebService.StudentObj StudentObj
        {
            get { return studentObj; }
            set { studentObj = value; }
        }

        public string Program
        {
            get { return program; }
            set { program = value; }
        }
    }
}