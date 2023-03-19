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
        public static async Task<List<ExperienceDetailsDTO>> InsertExperienceDetails(List<ExperienceDetailsDTO> expDetails)
        {

            try
            {
                foreach (ExperienceDetailsDTO item in expDetails)
                {
                    DynamicParameters param = new DynamicParameters();
                    param.Add("@ExperienceDetailsID", item.ExperienceDetailsID);
                    param.Add("@JobTitle", item.JobTitle);
                    param.Add("@Employer", item.Employer);
                    param.Add("@City", item.City);
                    param.Add("@Country", item.Country);
                    param.Add("@StartDate", item.StartDate);
                    param.Add("@EndDate", item.EndDate);
                    param.Add("@IsCurrentlyWorkingCompany", item.IsCurrentlyWorkingCompany);
                    param.Add("@UserID", item.UserID);
                    param.Add("@Message", dbType: DbType.String, direction: ParameterDirection.Output, size: 100);

                    DataTable myDataTable = new DataTable("MyDataType");

                    using (var connection = new SqlConnection(ConfigSettings.ConnectionString))
                    {
                        await connection.ExecuteAsync("RB.InsertExperienceDetails", param, commandType: CommandType.StoredProcedure);
                        //response = new UserSaveResponseDTO()
                        //{
                        //    Message = param.Get<string>("@Message"),
                        //    item.ExperienceDetailsID = param.Get<long>("@id")

                        //};
                        item.ExperienceDetailsID = param.Get<long>("@ExpID");
                    }
                }

            }

            catch (Exception ex)
            {
                await Logger.Error(ex, "Error in UserDA.InsertPersonalDetails");
            }
            return expDetails;
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
                    myDataTable.Rows.Add(item.EducationDetailID, item.Education, item.School, item.StartDate, item.EndDate, item.City);
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
                    IEnumerable<ExperienceDetailsModel> expDetails = await connection.QueryAsync<ExperienceDetailsModel>("RB.GetExperienceDetails", param, commandType: CommandType.StoredProcedure);
                    result.ExperienceDetailsModel = expDetails.ToList();
                    //result.ExperienceDetailsModel = await connection.QueryFirstOrDefaultAsync<ExperienceDetailsModel>("RB.GetExperienceDetails", param, commandType: CommandType.StoredProcedure);
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
                await Logger.Error(ex, "Error in UserDA.GetResumeDetails");
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
                    warranty = await connection.QueryFirstOrDefaultAsync<int>("RB.SelectWarrantyByRoleID", param, commandType: CommandType.StoredProcedure);
                }
            }

            catch (Exception ex)
            {
                await Logger.Error(ex, "Error in UserDA.SelectWarrantyByRoleID");
            }

            return warranty;
        }
    }
}