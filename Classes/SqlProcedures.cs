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
        public Boolean LoadAdministrator()
        {
            SqlCommand adminCommand = new SqlCommand();
            adminCommand.CommandType = CommandType.StoredProcedure;
            adminCommand.CommandText = "LoadAdministrator";

            return urpDB.GetDataSetUsingCmdObj(adminCommand) > 0;
        }

        //====================
        //Student
        //====================

        public Boolean AddStudent(int tuid, string firstName, string lastName, string email, string program, string status, string major, string gender, string ethnicity, string graduationDate, string lastUpdate)
        {
            SqlCommand studentCommand = new SqlCommand();
            studentCommand.CommandType = CommandType.StoredProcedure;
            studentCommand.CommandText = "AddStudent";
            studentCommand.Parameters.AddWithValue("@tuid", tuid);

            return urpDB.DoUpdateUsingCmdObj(studentCommand) > 0;
        }
                          
        public Boolean DeleteStudent(int tuid)
        {
            SqlCommand studentCommand = new SqlCommand();
            studentCommand.CommandType = CommandType.StoredProcedure;
            studentCommand.CommandText = "DeleteStudent";
            studentCommand.Parameters.AddWithValue("@tuid", tuid);

            return urpDB.DoUpdateUsingCmdObj(studentCommand) > 0;
        }

        //====================
        //Principal Investigator
        //====================
        public Boolean AddPrincipalInvestigator(int tuid, string firstName, string lastName, string school, string department, string campus, string phoneNumber, string email, string lastUpdate)
        {
            SqlCommand piCommand = new SqlCommand();
            piCommand.CommandType = CommandType.StoredProcedure;
            piCommand.CommandText = "AddStudent";
            piCommand.Parameters.AddWithValue("@tuid", tuid);

            return urpDB.DoUpdateUsingCmdObj(piCommand) > 0;
        }

        public Boolean DeletePrincipalInvestigator(int tuid)
        {
            SqlCommand piCommand = new SqlCommand();
            piCommand.CommandType = CommandType.StoredProcedure;
            piCommand.CommandText = "DeletePrincipalInvestigator";
            piCommand.Parameters.AddWithValue("@tuid", tuid);

            return urpDB.DoUpdateUsingCmdObj(piCommand) > 0;
        }

        public DataSet LoadPrincipalInvestigator()
        {
            SqlCommand piCommand = new SqlCommand();
            piCommand.CommandType = CommandType.StoredProcedure;
            piCommand.CommandText = "LoadPrincipalInvestigator";

            return urpDB.GetDataSetUsingCmdObj(piCommand);
        }

        //====================
        //Comments
        //====================

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

        public Boolean CheckDepartment(string departmentName)
        {
            SqlCommand departmentCommand = new SqlCommand();
            departmentCommand.CommandType = CommandType.StoredProcedure;
            departmentCommand.CommandText = "CheckDepartment";
            departmentCommand.Parameters.AddWithValue("@DepartmentName", departmentName);

            return urpDB.DoUpdateUsingCmdObj(departmentName) > 0;
        }

        public int GetDepartmentID(string departmentName)
        {
            SqlCommand departmentCommand = new SqlCommand();
            departmentCommand.CommandType = CommandType.StoredProcedure;
            departmentCommand.CommandText = "GetDepartmentID";
            departmentCommand.Parameters.AddWithValue("@DepartmentName", departmentName);

            return urpDB.GetDataSetUsingCmdObj(departmentName);
        }

        //====================
        //Email
        //====================

        public boo

        //====================
        //Instructions
        //====================


        //====================
        //Major
        //====================

        public Boolean CheckMajor(string major)
        {
            SqlCommand majorCommand = new SqlCommand();
            majorCommand.CommandType = CommandType.StoredProcedure;
            majorCommand.CommandText = "CheckMajor";
            majorCommand.Parameters.AddWithValue("@DepartmentName", departmentName);

            return urpDB.GetDataSetUsingCmdObj(departmentName);
        }

        //====================
        //Research
        //====================

        public Boolean CheckResearchProjects(int researchID)
        {
            SqlCommand researchCommand = new SqlCommand();
            researchCommand.CommandType = CommandType.StoredProcedure;
            researchCommand.CommandText = "CheckResearchProjects";
            researchCommand.Parameters.AddWithValue("@ResearchID", researchID);

            return urpDB.DoUpdateUsingCmdObj(researchCommand) > 0;
        }

        //====================
        //Term
        //====================

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