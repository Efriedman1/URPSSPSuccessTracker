using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace URPSSPSuccessTracker.Classes
{
    public class Instruction
    {
        public string Body { get; set; }
        public int Id { get; set; }
        public Instruction (string body, int id)
        {
            Body = body;
            Id = id;
        }
    }
}