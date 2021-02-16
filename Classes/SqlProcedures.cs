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

        //====================
        //Administrator
        //====================

        //Add admin
        public Boolean AddAdministrator(int tuid, string firstName, string lastName, string email, string active)
        {
            SqlCommand adminCommand = new SqlCommand();
            adminCommand.CommandType = CommandType.StoredProcedure;
            adminCommand.CommandText = "AddAdministrator";
            adminCommand.Parameters.AddWithValue("@tuid", tuid);

            return urpDB.DoUpdateUsingCmdObj(adminCommand) > 0;
        }

        //Change admin active status
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
        
        //Load admins
        public DataSet LoadAdministrator()
        {
            SqlCommand adminCommand = new SqlCommand();
            adminCommand.CommandType = CommandType.StoredProcedure;
            adminCommand.CommandText = "LoadAdministrator";

            return urpDB.GetDataSetUsingCmdObj(adminCommand);
        }

        //====================
        //Student
        //====================

        //add student
        public Boolean AddStudent(int tuid, string firstName, string lastName, string email, string program, string status, string major, string gender, string ethnicity, string graduationDate, string lastUpdate)
        {
            SqlCommand studentCommand = new SqlCommand();
            studentCommand.CommandType = CommandType.StoredProcedure;
            studentCommand.CommandText = "AddStudent";
            studentCommand.Parameters.AddWithValue("@TUID", tuid);

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
            studentCommand.Parameters.AddWithValue("@status", status);

            return urpDB.GetDataSetUsingCmdObj(studentCommand);
        }

        //====================
        //Principal Investigator
        //====================

        //add PI
        public Boolean AddPrincipalInvestigator(int tuid, string firstName, string lastName, string school, string department, string campus, string phoneNumber, string email, string lastUpdate)
        {
            SqlCommand piCommand = new SqlCommand();
            piCommand.CommandType = CommandType.StoredProcedure;
            piCommand.CommandText = "AddStudent";
            piCommand.Parameters.AddWithValue("@tuid", tuid);

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
        public DataSet LoadPrincipalInvestigator()
        {
            SqlCommand piCommand = new SqlCommand();
            piCommand.CommandType = CommandType.StoredProcedure;
            piCommand.CommandText = "LoadPrincipalInvestigator";

            return urpDB.GetDataSetUsingCmdObj(piCommand);
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
        public Boolean InsertInstructions (string body)
        {
            SqlCommand instructionCommand = new SqlCommand();
            instructionCommand.CommandType = CommandType.StoredProcedure;
            instructionCommand.CommandText = "InsertInstructions";
            instructionCommand.Parameters.AddWithValue("@Body", body);

            return urpDB.DoUpdateUsingCmdObj(instructionCommand) > 0;
        }

        //load instructions
        public DataSet LoadInstructions(int instructionID)
        {
            SqlCommand instructionCommand = new SqlCommand();
            instructionCommand.CommandType = CommandType.StoredProcedure;
            instructionCommand.CommandText = "LoadInstructions";
            instructionCommand.Parameters.AddWithValue("@InstructionID", instructionID);

            return urpDB.GetDataSetUsingCmdObj(instructionCommand);
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

            //check research projects
        public Boolean CheckResearchProjects(int researchID)
        {
            SqlCommand researchCommand = new SqlCommand();
            researchCommand.CommandType = CommandType.StoredProcedure;
            researchCommand.CommandText = "CheckResearchProjects";
            researchCommand.Parameters.AddWithValue("@ResearchID", researchID);

            return urpDB.DoUpdateUsingCmdObj(researchCommand) > 0;
        }

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
    }
}