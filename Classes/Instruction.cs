using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace URPSSPSuccessTracker.Classes
{
    public class Instruction
    {
        public string Body { get; set; }
        public int InstructionId { get; set; }
        public Instruction(int id, string body)
        {
            Body = body;
            InstructionId = id;
        }
    }
}