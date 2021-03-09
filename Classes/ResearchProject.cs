using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace URPSSPSuccessTracker.Classes
{
    public class ResearchProject
    {

        private string researchTitle;
        //research type will be the same as the student's program
        private string researchType;
        private string researchDescription = "";
        //by default a new research project is set to incomplete
        private string status = "Incomplete";
        private string piTUID;
        private string piDepartment;
        private string studentTUID;
        private string researchPapers;
        private string researchJournals;
        private string researchConferences;


        public ResearchProject()
        {

        }

        public ResearchProject(string researchTitle, string researchType, string researchDescription, string piTUID, string piDepartment, string studentTUID)
        {
            ResearchTitle = researchTitle;
            ResearchType = researchType;
            ResearchDescription = researchDescription;
            PITUID = piTUID;
            PIDepartment = piDepartment;
            StudentTUID = studentTUID;
        }

        public string ResearchTitle
        {
            get { return researchTitle; }
            set { researchTitle = value; }
        }
        public string ResearchType
        {
            get { return researchType; }
            set { researchType = value; }
        }
        public string ResearchDescription
        {
            get { return researchDescription; }
            set { researchDescription = value; }
        }
        public string PITUID
        {
            get { return piTUID; }
            set { piTUID = value; }
        }
        public string PIDepartment
        {
            get { return piDepartment; }
            set { piDepartment = value; }
        }
        public string StudentTUID
        {
            get { return studentTUID; }
            set { studentTUID = value; }
        }

    }
}