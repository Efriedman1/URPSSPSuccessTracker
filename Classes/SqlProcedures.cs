using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;

namespace URPSSPSuccessTracker.Classes
{
    public class SqlProcedures
    {
        Connection urpDB;

        public SqlProcedures()
        {
            urpDB = new Connection();
        }

        public Boolean TestConnection()
        {
            return urpDB.Open();
        }

        public string GetUserRole(string tuid)
        {
            SqlCommand cmd = new SqlCommand();
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "GetUserRole";
            cmd.Parameters.AddWithValue("@TUID", tuid);
            DataSet ds = urpDB.GetDataSetUsingCmdObj(cmd);
            string userRole = "";
            if (ds.Tables[0].Rows.Count > 0)
            {
                userRole = ds.Tables[0].Rows[0][1].ToString();
            }
            return userRole;
        }

        //====================
        //Administrator
        //====================

        //Add admin
        public Boolean AddAdministrator(int tuid, string firstName, string lastName, string email, string active)
        {
            SqlCommand adminCommand = new SqlCommand();
            adminCommand.CommandType = CommandType.StoredProcedure;
            adminCommand.CommandText = "AddAdministrator";
            adminCommand.Parameters.AddWithValue("@TUID", tuid);
            adminCommand.Parameters.AddWithValue("@FirstName", firstName);
            adminCommand.Parameters.AddWithValue("@LastName", lastName);
            adminCommand.Parameters.AddWithValue("@Email", email);
            adminCommand.Parameters.AddWithValue("@Active", active);

            return urpDB.DoUpdateUsingCmdObj(adminCommand) > 0;
        }

        //Change admin active status
        public Boolean ChangeAdministratorActive(int tuid)
        {
            SqlCommand adminCommand = new SqlCommand();
            adminCommand.CommandType = CommandType.StoredProcedure;
            adminCommand.CommandText = "ChangeAdministratorStatus";
            adminCommand.Parameters.AddWithValue("@tuid", tuid);

            return urpDB.DoUpdateUsingCmdObj(adminCommand) > 0;
        }
        public Boolean ChangeAdministratorActive(int tuid, string active)
        {
            SqlCommand adminCommand = new SqlCommand();
            adminCommand.CommandType = CommandType.StoredProcedure;
            adminCommand.CommandText = "ChangeAdministratorActive";
            adminCommand.Parameters.AddWithValue("@tuid", tuid);
            adminCommand.Parameters.AddWithValue("@active", active);

            return urpDB.DoUpdateUsingCmdObj(adminCommand) > 0;
        }

        //Delete admin
        public Boolean DeleteAdministrator(int tuid)
        {
            SqlCommand adminCommand = new SqlCommand();
            adminCommand.CommandType = CommandType.StoredProcedure;
            adminCommand.CommandText = "DeleteAdministrator";
            adminCommand.Parameters.AddWithValue("@tuid", tuid);

            return urpDB.DoUpdateUsingCmdObj(adminCommand) > 0;
        }

        public DataSet SearchAdministrator(int tuid)
        {
            SqlCommand adminCommand = new SqlCommand();
            adminCommand.CommandType = CommandType.StoredProcedure;
            adminCommand.CommandText = "SearchAdministrator";
            adminCommand.Parameters.AddWithValue("@TUID", tuid);

            return urpDB.GetDataSetUsingCmdObj(adminCommand);
        }

        //Load admins
        public DataSet LoadAdministrator()
        {
            List<Administrator> adminList = new List<Administrator>();

            SqlCommand adminCommand = new SqlCommand();
            adminCommand.CommandType = CommandType.StoredProcedure;
            adminCommand.CommandText = "LoadAdministrator";

            DataSet adminData = urpDB.GetDataSetUsingCmdObj(adminCommand);/*
            int count = adminData.Tables[0].Rows.Count;
            for (int i = 0; i < count; i++)
            {
                Administrator newAdmin = new Administrator((int)adminData.Tables[0].Rows[i][0], adminData.Tables[0].Rows[i][1].ToString(), adminData.Tables[0].Rows[i][2].ToString(), adminData.Tables[0].Rows[i][3].ToString(),
                     adminData.Tables[0].Rows[i][4].ToString());
                adminList.Add(newAdmin);
            }*/

            return adminData;
        }

        //====================
        //Student
        //====================

        //add student
        public Boolean AddStudent(Student student)
        {
            SqlCommand studentCommand = new SqlCommand();
            studentCommand.CommandType = CommandType.StoredProcedure;
            studentCommand.CommandText = "AddStudent";
            studentCommand.Parameters.AddWithValue("@TUID", student.TUID);
            studentCommand.Parameters.AddWithValue("@FirstName", student.FirstName);
            studentCommand.Parameters.AddWithValue("@LastName", student.LastName);
            studentCommand.Parameters.AddWithValue("@Email", student.Email);
            studentCommand.Parameters.AddWithValue("@Program", student.Program);
            studentCommand.Parameters.AddWithValue("@Major", student.Major);
            studentCommand.Parameters.AddWithValue("@GraduationDate", student.GradDate);


            return urpDB.DoUpdateUsingCmdObj(studentCommand) > 0;
        }

        //delete student
        public Boolean DeleteStudent(int tuid)
        {
            SqlCommand studentCommand = new SqlCommand();
            studentCommand.CommandType = CommandType.StoredProcedure;
            studentCommand.CommandText = "DeleteStudent";
            studentCommand.Parameters.AddWithValue("@tuid", tuid);

            return urpDB.DoUpdateUsingCmdObj(studentCommand) > 0;
        }

        public DataSet SearchStudent(int tuid, string program, string firstName, string lastName, string major, string status)
        {
            SqlCommand studentCommand = new SqlCommand();
            studentCommand.CommandType = CommandType.StoredProcedure;
            studentCommand.CommandText = "SearchStudent";
            studentCommand.Parameters.AddWithValue("@TUID", tuid);
            studentCommand.Parameters.AddWithValue("@program", program);
            studentCommand.Parameters.AddWithValue("@firstName", firstName);
            studentCommand.Parameters.AddWithValue("@lastName", lastName);
            studentCommand.Parameters.AddWithValue("@major", major);
            //studentCommand.Parameters.AddWithValue("@status", status);

            return urpDB.GetDataSetUsingCmdObj(studentCommand);
        }

        //public List<Student> LoadStudents()
        //{
        //    List<Student> studentList = new List<Student>();

        //    SqlCommand studentCommand = new SqlCommand();
        //    studentCommand.CommandType = CommandType.StoredProcedure;
        //    studentCommand.CommandText = "LoadStudents";
        //    DataSet studentData = urpDB.GetDataSetUsingCmdObj(studentCommand);
        //    int count = studentData.Tables[0].Rows.Count;
        //    for (int i = 0; i < count; i++)
        //    {
        //        Student newStudent = new Student((string)studentData.Tables[0].Rows[i][0], studentData.Tables[0].Rows[i][1].ToString(), studentData.Tables[0].Rows[i][2].ToString(), studentData.Tables[0].Rows[i][3].ToString(),
        //             studentData.Tables[0].Rows[i][4].ToString(), studentData.Tables[0].Rows[i][5].ToString(), studentData.Tables[0].Rows[i][6].ToString(), (DateTime)studentData.Tables[0].Rows[i][7]);
        //        studentList.Add(newStudent);
        //    }

        //    return studentList;
        //}

        public DataSet LoadStudents()
        {
            SqlCommand studentCommand = new SqlCommand();
            studentCommand.CommandType = CommandType.StoredProcedure;
            studentCommand.CommandText = "LoadStudents";
            DataSet studentData = urpDB.GetDataSetUsingCmdObj(studentCommand);
            int count = studentData.Tables[0].Rows.Count;

            return studentData;
        }
        public DataSet GetAllStudents()
        {
            List<Student> studentList = new List<Student>();

            SqlCommand studentCommand = new SqlCommand();
            studentCommand.CommandType = CommandType.StoredProcedure;
            studentCommand.CommandText = "GetAllStudents";
            DataSet ds = urpDB.GetDataSetUsingCmdObj(studentCommand);
            return ds;
        }
        //====================
        //Principal Investigator
        //====================

        //add PI
        public Boolean AddPrincipalInvestigator(PrincipalInvestigator principalInvestigator)
        {
            SqlCommand piCommand = new SqlCommand();
            piCommand.CommandType = CommandType.StoredProcedure;
            piCommand.CommandText = "AddPrincipalInvestigator";
            piCommand.Parameters.AddWithValue("@TUID", principalInvestigator.TUID);
            piCommand.Parameters.AddWithValue("@FirstName", principalInvestigator.FirstName);
            piCommand.Parameters.AddWithValue("@LastName", principalInvestigator.LastName);
            piCommand.Parameters.AddWithValue("@Department", principalInvestigator.Department);
            piCommand.Parameters.AddWithValue("@Email", principalInvestigator.Email);

            return urpDB.DoUpdateUsingCmdObj(piCommand) > 0;
        }

        //delete pi
        public Boolean DeletePrincipalInvestigator(int tuid)
        {
            SqlCommand piCommand = new SqlCommand();
            piCommand.CommandType = CommandType.StoredProcedure;
            piCommand.CommandText = "DeletePrincipalInvestigator";
            piCommand.Parameters.AddWithValue("@tuid", tuid);

            return urpDB.DoUpdateUsingCmdObj(piCommand) > 0;
        }

        //load pi
        public List<PrincipalInvestigator> LoadPrincipalInvestigator()
        {
            List<PrincipalInvestigator> piList = new List<PrincipalInvestigator>();

            //SqlCommand piCommand = new SqlCommand();
            //piCommand.CommandType = CommandType.StoredProcedure;
            //piCommand.CommandText = "LoadPrincipalInvestigator";
            //DataSet piData = urpDB.GetDataSetUsingCmdObj(piCommand);
            //int count = piData.Tables[0].Rows.Count;
            //for (int i = 0; i < count; i++)
            //{
            //    PrincipalInvestigator newPI = new PrincipalInvestigator((int)piData.Tables[0].Rows[i][0], piData.Tables[0].Rows[i][1].ToString(), piData.Tables[0].Rows[i][2].ToString(), piData.Tables[0].Rows[i][3].ToString(),
            //         piData.Tables[0].Rows[i][4].ToString(), piData.Tables[0].Rows[i][5].ToString(), piData.Tables[0].Rows[i][6].ToString(), piData.Tables[0].Rows[i][6].ToString(), (DateTime)piData.Tables[0].Rows[i][8]);
            //    piList.Add(newPI);
            //}

            return piList;
        }

        //search pi
        public DataSet SearchPrincipalInvestigator(int tuid, string department, string firstName, string lastName)
        {
            SqlCommand piCommand = new SqlCommand();
            piCommand.CommandType = CommandType.StoredProcedure;
            piCommand.CommandText = "SearchPrincipalInvestigator";
            piCommand.Parameters.AddWithValue("@TUID", tuid);
            piCommand.Parameters.AddWithValue("@Department", department);
            piCommand.Parameters.AddWithValue("@firstName", firstName);
            piCommand.Parameters.AddWithValue("@lastName", lastName);

            return urpDB.GetDataSetUsingCmdObj(piCommand);
        }

        //====================
        //Comments
        //====================

        //add comment
        public Boolean AddComments(int researchID, string name, string body, DateTime date)
        {
            SqlCommand commentCommand = new SqlCommand();
            commentCommand.CommandType = CommandType.StoredProcedure;
            commentCommand.CommandText = "AddComments";
            commentCommand.Parameters.AddWithValue("@ResearchID", researchID);
            commentCommand.Parameters.AddWithValue("@Name", name);
            commentCommand.Parameters.AddWithValue("@Body", body);
            commentCommand.Parameters.AddWithValue("@Date", date);

            return urpDB.DoUpdateUsingCmdObj(commentCommand) > 0;
        }

        public List<Comment> LoadComments(int researchID)
        {
            List<Comment> commentList = new List<Comment>();

            SqlCommand commentCommand = new SqlCommand();
            commentCommand.CommandType = CommandType.StoredProcedure;
            commentCommand.CommandText = "LoadComments";
            commentCommand.Parameters.AddWithValue("@ResearchID", researchID);
            DataSet commentData = urpDB.GetDataSetUsingCmdObj(commentCommand);
            int count = commentData.Tables[0].Rows.Count;
            for (int i = 0; i < count; i++)
            {
                Comment newComment = new Comment((int)commentData.Tables[0].Rows[i][0], (int)commentData.Tables[0].Rows[i][1], commentData.Tables[0].Rows[i][2].ToString(), commentData.Tables[0].Rows[i][3].ToString(),
                      (DateTime)commentData.Tables[0].Rows[i][4]);
                commentList.Add(newComment);
            }
            return commentList;
        }

        //====================
        //Department
        //====================

        //check department
        public Boolean CheckDepartment(string departmentName)
        {
            SqlCommand departmentCommand = new SqlCommand();
            departmentCommand.CommandType = CommandType.StoredProcedure;
            departmentCommand.CommandText = "CheckDepartment";
            departmentCommand.Parameters.AddWithValue("@DepartmentName", departmentName);

            return urpDB.DoUpdateUsingCmdObj(departmentCommand) > 0;
        }

        //get department id
        public int GetDepartmentID(string departmentName)
        {
            SqlCommand departmentCommand = new SqlCommand();
            departmentCommand.CommandType = CommandType.StoredProcedure;
            departmentCommand.CommandText = "GetDepartmentID";
            departmentCommand.Parameters.AddWithValue("@DepartmentName", departmentName);

            DataSet dsDepartment = urpDB.GetDataSetUsingCmdObj(departmentCommand);

            return (int)dsDepartment.Tables[0].Rows[0][0];
        }

        //====================
        //Email
        //====================

        //insert email
        public Boolean InsertEmail(string sender, string receiver, DateTime time)
        {
            SqlCommand emailCommand = new SqlCommand();
            emailCommand.CommandType = CommandType.StoredProcedure;
            emailCommand.CommandText = "InsertEmail";
            emailCommand.Parameters.AddWithValue("@Sender", sender);
            emailCommand.Parameters.AddWithValue("@Receiver", receiver);
            emailCommand.Parameters.AddWithValue("@Time", time);

            return urpDB.DoUpdateUsingCmdObj(emailCommand) > 0;
        }

        //====================
        //Instructions
        //====================

        //insert instructions
        public Boolean InsertInstructions(string body)
        {
            SqlCommand instructionCommand = new SqlCommand();
            instructionCommand.CommandType = CommandType.StoredProcedure;
            instructionCommand.CommandText = "InsertInstructions";
            instructionCommand.Parameters.AddWithValue("@Body", body);

            return urpDB.DoUpdateUsingCmdObj(instructionCommand) > 0;
        }

        //load instructions
        public Instruction LoadInstructions(int instructionID)
        {
            SqlCommand instructionCommand = new SqlCommand();
            instructionCommand.CommandType = CommandType.StoredProcedure;
            instructionCommand.CommandText = "LoadInstructions";
            instructionCommand.Parameters.AddWithValue("@InstructionID", instructionID);

            DataSet ds = urpDB.GetDataSetUsingCmdObj(instructionCommand);

            Instruction instruction = new Instruction((int)ds.Tables[0].Rows[0][0], ds.Tables[0].Rows[0][1].ToString());

            return instruction;
        }

        //update instructions
        public Boolean UpdateInstructions(string instructionID, string body)
        {
            SqlCommand instructionCommand = new SqlCommand();
            instructionCommand.CommandType = CommandType.StoredProcedure;
            instructionCommand.CommandText = "UpdateInstructions";
            instructionCommand.Parameters.AddWithValue("@InstructionID", instructionID);
            instructionCommand.Parameters.AddWithValue("@Body", body);

            return urpDB.DoUpdateUsingCmdObj(instructionCommand) > 0;
        }

        //====================
        //Major
        //====================

        //check major
        public DataSet CheckMajor(string major)
        {
            SqlCommand majorCommand = new SqlCommand();
            majorCommand.CommandType = CommandType.StoredProcedure;
            majorCommand.CommandText = "CheckMajor";
            majorCommand.Parameters.AddWithValue("@Major", major);

            return urpDB.GetDataSetUsingCmdObj(majorCommand);
        }

        //====================
        //Research
        //====================
        
        public Boolean UpdateLink(int ResearchID, string Body)
        {
            SqlCommand UpdateLink = new SqlCommand();
            UpdateLink.CommandType = CommandType.StoredProcedure;
            UpdateLink.CommandText = "UpdateLink";
            UpdateLink.Parameters.AddWithValue("@ResearchID", ResearchID);
            UpdateLink.Parameters.AddWithValue("@Link", Body);

            return urpDB.DoUpdateUsingCmdObj(UpdateLink) > 0;
        }

        public Boolean UpdateJournal(int ResearchID, string Body)
        {
            SqlCommand UpdateJournal = new SqlCommand();
            UpdateJournal.CommandType = CommandType.StoredProcedure;
            UpdateJournal.CommandText = "UpdateJournal";
            UpdateJournal.Parameters.AddWithValue("@ResearchID", ResearchID);
            UpdateJournal.Parameters.AddWithValue("@Journals", Body);

            return urpDB.DoUpdateUsingCmdObj(UpdateJournal) > 0;
        }

        public Boolean UpdateConference(int ResearchID, string Body)
        {
            SqlCommand UpdateConference = new SqlCommand();
            UpdateConference.CommandType = CommandType.StoredProcedure;
            UpdateConference.CommandText = "UpdateConference";
            UpdateConference.Parameters.AddWithValue("@ResearchID", ResearchID);
            UpdateConference.Parameters.AddWithValue("@Conference", Body);

            return urpDB.DoUpdateUsingCmdObj(UpdateConference) > 0;
        }

        public Boolean UpdatePaper(int ResearchID, string Body)
        {
            SqlCommand UpdatePaper = new SqlCommand();
            UpdatePaper.CommandType = CommandType.StoredProcedure;
            UpdatePaper.CommandText = "UpdatePaper";
            UpdatePaper.Parameters.AddWithValue("@ResearchID", ResearchID);
            UpdatePaper.Parameters.AddWithValue("@Paper", Body);

            return urpDB.DoUpdateUsingCmdObj(UpdatePaper) > 0;
        }

        public List<ResearchDocument> GetProjectInfo(int ResearchID)
        {
            List<ResearchDocument> researchList = new List<ResearchDocument>();
            SqlCommand getJournal = new SqlCommand();
            getJournal.CommandType = CommandType.StoredProcedure;
            getJournal.CommandText = "GetJournal";
            getJournal.Parameters.AddWithValue("@ResearchID", ResearchID);
            DataSet researchData = urpDB.GetDataSetUsingCmdObj(getJournal);

            for (int i = 0; i < researchData.Tables[0].Rows.Count; i++)
            {
                ResearchDocument newResearch = new ResearchDocument(ResearchID, researchData.Tables[0].Rows[i][0].ToString(), researchData.Tables[0].Rows[i][1].ToString(), researchData.Tables[0].Rows[i][2].ToString(), researchData.Tables[0].Rows[i][3].ToString());
                researchList.Add(newResearch);
            }


            return researchList;
        }

        //check research projects
        public DataSet LoadResearchDocuments(int researchID)
        {
            List<ResearchDocument> researchList = new List<ResearchDocument>();

            //DataSet researchList = new DataSet();

            SqlCommand researchCommand = new SqlCommand();
            researchCommand.CommandType = CommandType.StoredProcedure;
            researchCommand.CommandText = "GetJournal";
            researchCommand.Parameters.AddWithValue("@ResearchID", researchID);
            DataSet researchData = urpDB.GetDataSetUsingCmdObj(researchCommand);

            return researchData;
        }

        public List<ResearchProject> LoadResearchProjects(string tuid)
        {
            List<ResearchProject> researchList = new List<ResearchProject>();

            SqlCommand researchCommand = new SqlCommand();
            researchCommand.CommandType = CommandType.StoredProcedure;
            researchCommand.CommandText = "LoadResearchDocuments";
            researchCommand.Parameters.AddWithValue("@ResearchID", tuid);
            DataSet researchData = urpDB.GetDataSetUsingCmdObj(researchCommand);

            for (int i = 0; i < researchData.Tables[0].Rows.Count; i++)
            {
                ResearchProject newResearch = new ResearchProject(researchData.Tables[0].Rows[i][4].ToString(), researchData.Tables[0].Rows[i][9].ToString(), researchData.Tables[0].Rows[i][5].ToString(),
                    researchData.Tables[0].Rows[i][2].ToString(), "");
                researchList.Add(newResearch);
            }
            return researchList;
        }

        public ResearchProject LoadResearchProjectByID(int id)
        {
            ResearchProject researchProject = new ResearchProject();
            return researchProject;
        }

        //public ResearchProject(string researchTitle, string researchType, string researchDescription, string piTUID, string piDepartment, string studentTUID)
        //private string researchTitle;
        ////research type will be the same as the student's program
        //private string researchType;
        //private string researchDescription = "";
        ////by default a new research project is set to incomplete
        //private string status = "Incomplete";
        //private string piTUID;
        //private string piDepartment;
        //private string studentTUID;
        //private string researchPapers;
        //private string researchJournals;
        //private string researchConferences;

        public Boolean UpdateResearchProject(int researchID, int studentTUID, int piTUID, int termID, string title, string description, string link, string researchMethod, string status, string typeOfResearch, DateTime lastUpdate)
        {
            SqlCommand researchCommand = new SqlCommand();
            researchCommand.CommandType = CommandType.StoredProcedure;
            researchCommand.CommandText = "UpdateResarchProject";
            researchCommand.Parameters.AddWithValue("@ResearchID", researchID);
            researchCommand.Parameters.AddWithValue("@StudentTUID", studentTUID);
            researchCommand.Parameters.AddWithValue("@PITUID", piTUID);
            researchCommand.Parameters.AddWithValue("@TermID", termID);
            researchCommand.Parameters.AddWithValue("@Title", title);
            researchCommand.Parameters.AddWithValue("@Description", description);
            researchCommand.Parameters.AddWithValue("@Link", link);
            researchCommand.Parameters.AddWithValue("@ResarchMethod", researchMethod);
            researchCommand.Parameters.AddWithValue("@Status", status);
            researchCommand.Parameters.AddWithValue("@TypeOfResearch", typeOfResearch);
            researchCommand.Parameters.AddWithValue("@LastUpdate", lastUpdate);

            return urpDB.DoUpdateUsingCmdObj(researchCommand) > 0;
        }

        public Boolean InsertResearchDocuments(int researchID, string documentType, string documentTitle, string description)
        {
            SqlCommand researchCommand = new SqlCommand();
            researchCommand.CommandType = CommandType.StoredProcedure;
            researchCommand.CommandText = "InsertResearchDocuments";
            researchCommand.Parameters.AddWithValue("@ResearchID", researchID);
            researchCommand.Parameters.AddWithValue("@DocumentType", documentType);
            researchCommand.Parameters.AddWithValue("@DocumentTitle", documentTitle);
            researchCommand.Parameters.AddWithValue("@Description", description);

            return urpDB.DoUpdateUsingCmdObj(researchCommand) > 0;
        }


        public Boolean InsertResearchProject(ResearchProject researchProject, int termID)
        {
            SqlCommand researchCommand = new SqlCommand();
            researchCommand.CommandType = CommandType.StoredProcedure;
            researchCommand.CommandText = "InsertResearchProjects";
            researchCommand.Parameters.AddWithValue("@StudentTUID", researchProject.StudentTUID);
            researchCommand.Parameters.AddWithValue("@PITUID", researchProject.PITUID);
            researchCommand.Parameters.AddWithValue("@TermID", termID);
            researchCommand.Parameters.AddWithValue("@Title", researchProject.ResearchTitle);
            researchCommand.Parameters.AddWithValue("@Description", researchProject.ResearchDescription);
            researchCommand.Parameters.AddWithValue("@TypeOfResearch", researchProject.ResearchType);

            return urpDB.DoUpdateUsingCmdObj(researchCommand) > 0;
        }

        //====================
        //Term
        //====================

        //get term id
        public Boolean GetTermID(string semester, int year)
        {
            SqlCommand termCommand = new SqlCommand();
            termCommand.CommandType = CommandType.StoredProcedure;
            termCommand.CommandText = "GetTermID";
            termCommand.Parameters.AddWithValue("@Semester", semester);
            termCommand.Parameters.AddWithValue("@Year", year);

            return urpDB.DoUpdateUsingCmdObj(termCommand) > 0;
        }

        public DataSet GetAllTerms()
        {
            SqlCommand termCommand = new SqlCommand();
            termCommand.CommandType = CommandType.StoredProcedure;
            termCommand.CommandText = "LoadTerms";
            return urpDB.GetDataSetUsingCmdObj(termCommand);
        }

        public Boolean AddTerm(string semester, int year)
        {
            SqlCommand termCommand = new SqlCommand();
            termCommand.CommandType = CommandType.StoredProcedure;
            termCommand.CommandText = "AddTerm";
            termCommand.Parameters.AddWithValue("@Semester", semester);
            termCommand.Parameters.AddWithValue("@Year", year);

            return urpDB.DoUpdateUsingCmdObj(termCommand) > 0;
        }

        public Boolean DeleteTerm(int termID)
        {
            SqlCommand termCommand = new SqlCommand();
            termCommand.CommandType = CommandType.StoredProcedure;
            termCommand.CommandText = "DeleteTerm";
            termCommand.Parameters.AddWithValue("@TermID", termID);

            return urpDB.DoUpdateUsingCmdObj(termCommand) > 0;

        }
        public Boolean ChangeTermStatus(int termID)
        {
            SqlCommand termCommand = new SqlCommand();
            termCommand.CommandType = CommandType.StoredProcedure;
            termCommand.CommandText = "ChangeTermStatus";
            termCommand.Parameters.AddWithValue("@TermID", termID);


            return urpDB.DoUpdateUsingCmdObj(termCommand) > 0;
        }
    }
}