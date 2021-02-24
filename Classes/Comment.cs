using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace URPSSPSuccessTracker.Classes
{
    public class Comment
    {
        public int CommentID { get; set; }
        public int ResearchID { get; set; }
        public string Name { get; set; }
        public string Body { get; set; }
        public DateTime Date { get; set; }

        public Comment(int commentid, int researchid, string name, string body, DateTime date)
        {
            CommentID = commentid;
            ResearchID = researchid;
            Name = name;
            Body = body;
            Date = date;
        }
    }
}