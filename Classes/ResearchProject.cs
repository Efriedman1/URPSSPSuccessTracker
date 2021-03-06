﻿using System;
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
        private int termID;
        private string piTUID;
        private string studentTUID;
        private int researchID;
        private string description;
        private string typeOfResearch;
        private string researchMethod;
        private string researchPapers;
        private string researchJournals;
        private string researchConferences;
        private string links;
        private DateTime lastUpdate;
        private ResearchDocument[] researchDocuments;


        public ResearchProject()
        {

        }

        public ResearchProject(string researchTitle, string researchType, string researchDescription, string piTUID, string studentTUID)
        {
            ResearchTitle = researchTitle;
            ResearchType = researchType;
            ResearchDescription = researchDescription;
            PITUID = piTUID;
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
        public string StudentTUID
        {
            get { return studentTUID; }
            set { studentTUID = value; }
        }
        public string ResearchPapers
        {
            get { return researchPapers; }
            set { researchPapers = value; }
        }

        public string ResearchJournals
        {
            get { return researchJournals; }
            set { researchJournals = value; }
        }
        public string ResearchConferences
        {
            get { return researchConferences; }
            set { researchConferences = value; }
        }
        public string Links
        {
            get { return links; }
            set { links = value; }
        }

        public string Description
        {
            get { return description; }
            set { description = value; }
        }

        public string TypeOfResearch
        {
            get { return typeOfResearch; }
            set { typeOfResearch = value; }
        }

        public string ResearchMethod
        {
            get { return researchMethod; }
            set { researchMethod = value; }
        }

        public int ResearchID
        {
            get { return researchID; }
            set { researchID = value; }
        }
    }
}