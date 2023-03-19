using Admin.Common.ConfigSettings;
using Admin.Common.Logger;
using Dapper;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Threading.Tasks;
using XPEL.Admin.DTO;

namespace XPEL.Admin.DataAccess
{
    public class InstallerDA
    {
        public static async Task<long> InsertUpdateInstallerDetails(InstallerDetailsDTO installerDetails)
        {
            long installerDetailsID = 0;

            try
            {
                DynamicParameters param = new DynamicParameters();
                param.Add("@InstallerDetailsID", installerDetails.InstallerDetailsID);
                param.Add("@InstallerName", installerDetails.InstallerName);
                param.Add("@Address", installerDetails.Address);
                param.Add("@CreatedDate", DateTime.Now);
                param.Add("@ModifiedDate", DateTime.Now);
                param.Add("@IsActive", true);

                using (var connection = new SqlConnection(ConfigSettings.ConnectionString))
                {
                    installerDetailsID = await connection.QueryFirstAsync<long>("XPEL.InsertUpdateInstallerDetails", param, commandType: CommandType.StoredProcedure);
                }
            }

            catch (Exception ex)
            {
                await Logger.Error(ex, "Error in InstallerDA.InsertUpdateInstallerDetails");
            }

            return installerDetailsID;
        }
        public static async Task<IEnumerable<InstallerDetailsDTO>> SelectInstallerDetails(long installerDetailsID)
        {
            IEnumerable<InstallerDetailsDTO> result = null;

            try
            {
                DynamicParameters param = new DynamicParameters();
                param.Add("@InstallerDetailsID", installerDetailsID);

                using (var connection = new SqlConnection(ConfigSettings.ConnectionString))
                {
                    result = await connection.QueryAsync<InstallerDetailsDTO>("dbo.SelectInstallerDetails", param, commandType: CommandType.StoredProcedure);
                }
            }
            catch (Exception ex)
            {
                await Logger.Error(ex, "Error in InstallerDA.SelectInstallerDetails");
            }

            return result;
        }
    }
}
