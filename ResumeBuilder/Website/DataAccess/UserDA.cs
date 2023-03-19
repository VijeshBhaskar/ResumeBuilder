using Dapper;
using RB.Website.DTO;
using RB.Website.Model;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Threading.Tasks;
using Website.Common.ConfigSettings;
using Website.Common.Logger;
using XPEL.Website.DTO;

namespace Website.DataAccess
{
    public class UserDA
    {
        public static async Task CreateUser(UserLoginDTO userDetails)
        {
            try
            {
                DynamicParameters param = new DynamicParameters();
                param.Add("@Email", userDetails.Email);
                param.Add("@Password", userDetails.Password);
                using (var connection = new SqlConnection(ConfigSettings.ConnectionString))
                {
                    await connection.ExecuteAsync("RB.InsertUserDetails", param, commandType: CommandType.StoredProcedure);
                }
            }
            catch (Exception ex)
            {
                await Logger.Error(ex, "Error in UserDA.CreateUser");
            }
        }
        public static async Task<UserDetailsDTO> LoginUser(UserLoginDTO userDetails)
        {
            UserDetailsDTO result = null;
            try
            {
                DynamicParameters param = new DynamicParameters();
                param.Add("@Email", userDetails.Email);
                param.Add("@Password", userDetails.Password);
                using (var connection = new SqlConnection(ConfigSettings.ConnectionString))
                {
                    result = await connection.QueryFirstOrDefaultAsync<UserDetailsDTO>("RB.LoginUser", param, commandType: CommandType.StoredProcedure);
                }
            }
            catch (Exception ex)
            {
                await Logger.Error(ex, "Error in UserDA.LoginUser");
            }
            return result;
        }
        public static async Task<UserSaveResponseDTO> InsertPersonalDetails(UserDetailsDTO userDetails)
        {
            UserSaveResponseDTO response = null; ;

            try
            {
                DynamicParameters param = new DynamicParameters();
                param.Add("@UserID", userDetails.UserID);
                param.Add("@FirstName", userDetails.FirstName);
                param.Add("@LastName", userDetails.LastName);
                param.Add("@Email", userDetails.Email);
                param.Add("@PhoneNumber", userDetails.PhoneNumber);
                param.Add("@Address", userDetails.Address);
                param.Add("@Message", dbType: DbType.String, direction: ParameterDirection.Output, size: 100);

                using (var connection = new SqlConnection(ConfigSettings.ConnectionString))
                {
                    await connection.ExecuteAsync("RB.InsertPersonalDetails", param, commandType: CommandType.StoredProcedure);
                    response = new UserSaveResponseDTO()
                    {
                        Message = param.Get<string>("@Message")
                    };
                }
            }

            catch (Exception ex)
            {
                await Logger.Error(ex, "Error in UserDA.InsertPersonalDetails");
            }
            return response;
        }
        public static async Task<UserSaveResponseDTO> InsertExperienceDetails(ExperienceDetailsDTO expDetails)
        {
            UserSaveResponseDTO response = null; ;

            try
            {
                DynamicParameters param = new DynamicParameters();
                param.Add("@ExperienceDetailsID", expDetails.ExperienceDetailsID);
                param.Add("@JobTitle", expDetails.JobTitle);
                param.Add("@Employer", expDetails.Employer);
                param.Add("@City", expDetails.City);
                param.Add("@Country", expDetails.Country);
                param.Add("@StartDate", expDetails.StartDate);
                param.Add("@EndDate", expDetails.EndDate);
                param.Add("@IsCurrentlyWorkingCompany", expDetails.IsCurrentlyWorkingCompany);
                param.Add("@UserID", expDetails.UserID);
                param.Add("@Message", dbType: DbType.String, direction: ParameterDirection.Output, size: 100);

                DataTable myDataTable = new DataTable("MyDataType");

                using (var connection = new SqlConnection(ConfigSettings.ConnectionString))
                {
                    await connection.ExecuteAsync("RB.InsertExperienceDetails", param, commandType: CommandType.StoredProcedure);
                    response = new UserSaveResponseDTO()
                    {
                        Message = param.Get<string>("@Message")
                    };
                }
            }

            catch (Exception ex)
            {
                await Logger.Error(ex, "Error in UserDA.InsertPersonalDetails");
            }
            return response;
        }

        public static async Task<List<EducationDetailsDTO>> InsertEducationDetails(List<EducationDetailsDTO> eduDetails)
        {

            try
            {
               
                    DataTable myDataTable = new DataTable("RB.EducationDataType");
                    myDataTable.Columns.Add("EducationDetailID", typeof(Int64));
                       myDataTable.Columns.Add("Education", typeof(string));
                    myDataTable.Columns.Add("School", typeof(string));
                    myDataTable.Columns.Add("StartDate", typeof(DateTime));
                    myDataTable.Columns.Add("EndDate", typeof(DateTime));
                    myDataTable.Columns.Add("City", typeof(string));
                foreach (EducationDetailsDTO item in eduDetails)
                {
                    myDataTable.Rows.Add(item.EducationDetailID, item.Education, item.School,item.StartDate, item.EndDate,item.City);
                }
                //DynamicParameters param = new DynamicParameters();
                //param.ad("@EducationData", myDataTable);
                //param.Add("@UserID", eduDetails[0].UserID);
                //param.Add("@Message", dbType: DbType.String, direction: ParameterDirection.Output, size: 100);
                //using (var connection = new SqlConnection(ConfigSettings.ConnectionString))
                //{
                //    //await connection.ExecuteAsync("RB.InsertEducationDetails", param, commandType: CommandType.StoredProcedure);
                //    eduDetails = await connection.QueryFirstOrDefaultAsync<List<EducationDetailsDTO>>("RB.InsertEducationDetails", param, commandType: CommandType.StoredProcedure);
                //}
                //return eduDetails;

                using (SqlConnection connection = new SqlConnection(ConfigSettings.ConnectionString))
                {
                    using (SqlCommand cmd = new SqlCommand("RB.InsertEducationDetails"))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Connection = connection;
                        cmd.Parameters.AddWithValue("@EducationData", myDataTable);
                        cmd.Parameters.Add("@UserID", eduDetails[0].UserID);
                        //  cmd.Parameters.Add("@Message", dbType: DbType.String, direction: ParameterDirection.Output, size: 100);
                        connection.Open();
                        cmd.ExecuteNonQuery();
                        connection.Close();
                    }
                }
                return eduDetails;

            }

            catch (Exception ex)
            {
                await Logger.Error(ex, "Error in UserDA.InsertPersonalDetails");
            }
            return eduDetails;
        }
        public static async Task<IEnumerable<TemplateDetailsDTO>> GetTemplatesDetails()
        {
            IEnumerable<TemplateDetailsDTO> result = null; ;

            try
            {
                DynamicParameters param = new DynamicParameters();
                using (var connection = new SqlConnection(ConfigSettings.ConnectionString))
                {
                    result = await connection.QueryAsync<TemplateDetailsDTO>("RB.SelectTemplatesDetails", param, commandType: CommandType.StoredProcedure);
                }
            }

            catch (Exception ex)
            {
                await Logger.Error(ex, "Error in UserDA.GetTemplatesDetails");
            }
            return result;
        }
        public static async Task<string> GetTemplatesDetailsByID()
        {
            string result = null; ;

            try
            {
                DynamicParameters param = new DynamicParameters();
                param.Add("@TemplateId", 1);
                param.Add("@UserID", 1);
                using (var connection = new SqlConnection(ConfigSettings.ConnectionString))
                {
                    result = await connection.QueryFirstOrDefaultAsync<string>("RB.SelectTemplateDetailByID", param, commandType: CommandType.StoredProcedure);
                }
            }

            catch (Exception ex)
            {
                await Logger.Error(ex, "Error in UserDA.GetTemplatesDetails");
            }
            return result;
        }
        public static async Task<ResumeDataModel> GetResumeDetails(long UserID)
        {
            ResumeDataModel result = new ResumeDataModel();
            try
            {
                DynamicParameters param = new DynamicParameters();
                param.Add("@UserID", UserID);

                using (var connection = new SqlConnection(ConfigSettings.ConnectionString))
                {
                    result.UserDetailsModel = await connection.QueryFirstOrDefaultAsync<UserDetailsModel>("RB.GetPersonalDetails", param, commandType: CommandType.StoredProcedure);
                }

                using (var connection = new SqlConnection(ConfigSettings.ConnectionString))
                {
                    result.ExperienceDetailsModel = await connection.QueryFirstOrDefaultAsync<ExperienceDetailsModel>("RB.GetExperienceDetails", param, commandType: CommandType.StoredProcedure);
                }

                using (var connection = new SqlConnection(ConfigSettings.ConnectionString))
                {
                    //var results = await connection.QueryAsync<ProfitMargin>(sqlQuery, new { QuoteId = QuoteIds.ToArray() });
                    //List<ProfitMargin> profitMargin = results.ToList();

                    //result.EducationDetailsModel = await connection.QueryAsync<List<EducationDetailsModel>>("RB.GetEducationDetails", param, commandType: CommandType.StoredProcedure);
                     IEnumerable<EducationDetailsModel> eduDetails = await connection.QueryAsync<EducationDetailsModel>("RB.GetEducationDetails", param, commandType: CommandType.StoredProcedure);
                    result.EducationDetailsModel = eduDetails.ToList();
                }

            }
            catch (Exception ex)
            {
                await Logger.Error(ex, "Error in UserDA.LoginUser");
            }
            return result;
        }
        public static async Task<int> SelectWarrantyByRoleID(long roleID)
        {
            int warranty = 0;

            try
            {
                DynamicParameters param = new DynamicParameters();
                param.Add("@RoleID", roleID);
                using (var connection = new SqlConnection(ConfigSettings.ConnectionString))
                {
                    warranty = await connection.QueryFirstOrDefaultAsync<int>("XPEL.SelectWarrantyByRoleID", param, commandType: CommandType.StoredProcedure);
                }
            }

            catch (Exception ex)
            {
                await Logger.Error(ex, "Error in UserDA.SelectWarrantyByRoleID");
            }

            return warranty;
        }
        public static async Task<WarrantyDetailsDTO> CheckWarranty(WarrantyCheckDTO request)
        {
            WarrantyDetailsDTO warrantyDetails = null;

            try
            {
                DynamicParameters param = new DynamicParameters();
                param.Add("@VIN", request.VIN);
                param.Add("@PhoneNumber", request.PhoneNumber);

                using (var connection = new SqlConnection(ConfigSettings.ConnectionString))
                {
                    warrantyDetails = await connection.QueryFirstOrDefaultAsync<WarrantyDetailsDTO>("XPEL.CheckWarranty", param, commandType: CommandType.StoredProcedure);
                }
            }

            catch (Exception ex)
            {
                await Logger.Error(ex, "Error in UserDA.CheckWarranty");
            }
            return warrantyDetails;
        }
        public static async Task<IEnumerable<InstallerDetailsDTO>> SelectInstallerDetailsByName(string installerName)
        {
            IEnumerable<InstallerDetailsDTO> result = null;

            try
            {
                DynamicParameters param = new DynamicParameters();
                param.Add("@InstallerName", string.Format("%{0}%", installerName));

                using (var connection = new SqlConnection(ConfigSettings.ConnectionString))
                {
                    result = await connection.QueryAsync<InstallerDetailsDTO>("XPEL.SelectInstallerDetailsByName", param, commandType: CommandType.StoredProcedure);
                }
            }
            catch (Exception ex)
            {
                await Logger.Error(ex, "Error in InstallerDA.SelectInstallerDetailsByName");
            }

            return result;
        }
        public static async Task<InstallerDetailsDTO> SelectInstallerDetailsByID(long installerDetailsID)
        {
            InstallerDetailsDTO result = null;

            try
            {
                DynamicParameters param = new DynamicParameters();
                param.Add("@InstallerDetailsID", installerDetailsID);

                using (var connection = new SqlConnection(ConfigSettings.ConnectionString))
                {
                    result = await connection.QueryFirstOrDefaultAsync<InstallerDetailsDTO>("XPEL.SelectInstallerDetails", param, commandType: CommandType.StoredProcedure);
                }
            }
            catch (Exception ex)
            {
                await Logger.Error(ex, "Error in InstallerDA.SelectInstallerDetailsByID");
            }

            return result;
        }
    }
}