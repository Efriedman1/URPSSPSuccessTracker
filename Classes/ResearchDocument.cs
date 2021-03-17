using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace URPSSPSuccessTracker.Classes
{
    public class ResearchDocument
    {
        public int ResearchID { get; set; }
        //public string DocumentType { get; set; }
        //public string DocumentTitle { get; set; }
        //public string Description { get; set; }
        public string Journal { get; set; }
        public string Conference { get; set; }
        public string Paper { get; set; }


        public ResearchDocument()
        {

        }

        public ResearchDocument(int researchID, string journal,string conference, string paper)
        {
            ResearchID = researchID;
            Journal = journal;
            Conference = conference;
            Paper = paper;

        }
    }
}