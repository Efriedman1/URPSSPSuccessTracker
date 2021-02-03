using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Text;

namespace Capstone_Template_SSO.Classes
{
    public class Connection
    {
        readonly String SqlConnectString = ConfigurationManager.ConnectionStrings["Connection_Database"].ConnectionString;
        SqlConnection myConnectionSql;
        DataSet ds;

        public Connection()
        {
            //myConnectionSql = new SqlConnection(SqlConnectString + Encoding.UTF8.GetString(Convert.FromBase64String(ConfigurationManager.AppSettings["Connection_DB_Password"])));
            myConnectionSql = new SqlConnection(SqlConnectString + ConfigurationManager.AppSettings["Connection_DB_Password"]);
        }


        public bool Open()
        {
            try
            {
                if (myConnectionSql != null)
                {
                    if (myConnectionSql.State != ConnectionState.Open)
                    {
                        myConnectionSql.Open();
                        return true;
                    }
                    else
                        return false;
                }
                else
                    return false;
            }
            catch (Exception)
            {
                return false;
            }
        }

        public DataSet GetDataSet(String SqlSelect)
        {
            // Input parameter is a SELECT SQL statement. Return is the Dataset
            // Note: The Dataset is also stored as a class variable for use in the GetField function
            SqlDataAdapter myDataAdapter = new SqlDataAdapter(SqlSelect, myConnectionSql);
            DataSet myDataSet = new DataSet();
            myDataAdapter.Fill(myDataSet);
            ds = myDataSet;
            return myDataSet;
        }

        public int DoUpdateUsingCmdObj(SqlCommand theCommandObject)
        {
            // Input parameter is a Command object containing a SQL manipulate statement (Insert,
            // Update, Delete). Returns the number of rows affected by the update. Returns -1 when an
            // exception occurs. This method is used for passing parameters to a Stored Procedure
            if (myConnectionSql == null || myConnectionSql.State == ConnectionState.Closed)
            {
                myConnectionSql.Open();
            }

            try
            {
                theCommandObject.Connection = myConnectionSql;
                int ret = theCommandObject.ExecuteNonQuery();
                return ret;
            }
            catch (Exception)
            {
                return -1;
            }
            finally
            {
                theCommandObject.Connection.Close();
            }
        }

        public int DoUpdateUsingCmdObjWithoutAffectedRows(SqlCommand theCommandObject)
        {
            // Input parameter is a Command object containing a SQL manipulate statement (Insert,
            // Update, Delete). Returns the number of rows affected by the update. Returns -1 when an
            // exception occurs. This method is used for passing parameters to a Stored Procedure
            if (myConnectionSql == null || myConnectionSql.State == ConnectionState.Closed)
            {
                myConnectionSql.Open();
            }

            int Request_ID = 0;
            try
            {
                theCommandObject.Connection = myConnectionSql;
                theCommandObject.Parameters.Add("@Request_ID_Returned", SqlDbType.Int).Direction = ParameterDirection.Output;
                theCommandObject.ExecuteNonQuery();
                Request_ID = Convert.ToInt32(theCommandObject.Parameters["@Request_ID_Returned"].Value);
                return Request_ID;
            }
            catch (Exception)
            {
                return -1;
            }
            finally
            {
                theCommandObject.Connection.Close();
            }
        }
        public DataSet GetDataSetUsingCmdObj(SqlCommand theCommand)
        {
            // This method is used for Stored Procedures (SELECT statement only) with Parameters
            theCommand.Connection = myConnectionSql;
            SqlDataAdapter myDataAdapter = new SqlDataAdapter(theCommand);
            DataSet myDataSet = new DataSet();
            myDataAdapter.Fill(myDataSet);
            ds = myDataSet;

            return myDataSet;

        }
        public void CommitDataSet(DataSet theDataSet)
        {
            // Input parameter is a DataSet. This function is used to Commit the Dataset to the Data
            // Source when updating a disconnected ds.

            SqlDataAdapter myDataAdapter = new SqlDataAdapter();
            myDataAdapter.Update(theDataSet);
        }
        public SqlConnection GetConnection()
        {
            // NOTE: .NET has implemented its Stored User Defined Functions only with the Managed
            // Provider for SQL Server, not the OLEDB provider.
            return myConnectionSql;
        }
        public void CloseConnection()
        {
            try
            {
                myConnectionSql.Close();
            }
            catch (Exception)
            {
                // Catch exception created when trying to close a closed connection.
            }
        }
        public void ResetConnection()
        {
            try
            {
                myConnectionSql.Close();
                myConnectionSql.Open();
            }
            catch (Exception)
            {
                // Catch exception created when trying to close a closed connection.
            }
        }

        ~Connection()
        {
            // Close any open connections to the database before the objects of this class are
            // garbage collected.
            try
            {
                myConnectionSql.Close();
            }
            catch (Exception)
            {
                // Catch exception created when trying to close a closed connection.
            }
        }
    }
}