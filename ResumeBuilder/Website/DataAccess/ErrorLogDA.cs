using Dapper;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Threading.Tasks;
using System.Web;
using Website.Common.ConfigSettings;
using RB.Website.DTO;

namespace Website.DataAccess
{
    public class ErrorLogDA
    {
        public static async Task InsertErrorDetails(ErrorDetailsDTO errorDetails)
        {
            try
            {
                DynamicParameters param = new DynamicParameters();
                param.Add("@CustomMessage", errorDetails.CustomMessage);
                param.Add("@ErrorMessage", errorDetails.ErrorMessage);
                param.Add("@StackTrace", errorDetails.StackTrace);
                param.Add("@CreatedDate", DateTime.Now);

                using (var connection = new SqlConnection(ConfigSettings.ConnectionString))
                {
                    var response = await connection.ExecuteScalarAsync<int>("RB.InsertErrorLogDetails", param, commandType: CommandType.StoredProcedure);
                }
            }

            catch (Exception ex)
            {
                
            }
        }
    }
}