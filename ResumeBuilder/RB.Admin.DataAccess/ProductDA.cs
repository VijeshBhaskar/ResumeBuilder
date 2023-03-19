using Admin.Common.ConfigSettings;
using Admin.Common.Logger;
using Dapper;
using System;
using System.Data;
using System.Data.SqlClient;
using System.Threading.Tasks;
using XPEL.Admin.DTO;

namespace XPEL.Admin.DataAccess
{
    public class ProductDA
    {
        public async Task<long> InsertUpdateProductDetails(ProductDetailsDTO productDetails)
        {
            long productDetailsID = 0;

            try
            {
                DynamicParameters param = new DynamicParameters();
                param.Add("@RoleID", productDetails.RoleID);
                param.Add("@ProductName", productDetails.ProductName);
                param.Add("@BatchNumber", productDetails.BatchNumber);
                param.Add("@MaterialQuantity", productDetails.MaterialQuantity);
                param.Add("@InstallerDetailsID", productDetails.InstallerDetailsID);
                param.Add("@Warranty", productDetails.Warranty.Date);

                using (var connection = new SqlConnection(ConfigSettings.ConnectionString))
                {
                    productDetailsID = await connection.QueryFirstAsync<long>("XPEL.InsertUpdateProductDetails", param, commandType: CommandType.StoredProcedure);
                }
            }

            catch (Exception ex)
            {
                await Logger.Error(ex, "Error in ProductRegistrationDA.InsertUpdateProductDetails");
            }

            return productDetailsID;
        }
    }
}
