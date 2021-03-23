using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace URPSSPSuccessTracker.Classes
{
    public class UpdateProjectDocuments
    {
        public string Body { get; set; }
        public int ResearchID { get; set; }
        public UpdateProjectDocuments(int researchid, string body)
        {
            Body = body;
            ResearchID = researchid;
        }
    }
}