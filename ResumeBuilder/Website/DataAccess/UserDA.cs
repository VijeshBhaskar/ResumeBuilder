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
using Website.TableType;

namespace Website.DataAccess
{
    public class UserDA
    {
        public static async Task<UserCreationResponseDTO> CreateUser(UserLoginDTO userDetails)
        {
            UserCreationResponseDTO response = new UserCreationResponseDTO();
            try
            {
                DynamicParameters param = new DynamicParameters();
                param.Add("@Email", userDetails.Email);
                param.Add("@Password", userDetails.Password);
                param.Add("@Message", dbType: DbType.String, direction: ParameterDirection.Output, size: 100);
                param.Add("@IsSuccess", dbType: DbType.Boolean, direction: ParameterDirection.Output, size: 100);
                using (var connection = new SqlConnection(ConfigSettings.ConnectionString))
                {
                    await connection.ExecuteAsync("RB.InsertUserDetails", param, commandType: CommandType.StoredProcedure);
                    response.IsSuccess = param.Get<bool>("@IsSuccess");
                    response.Message = param.Get<string>("@Message");
                }
            }
            catch (Exception ex)
            {
                await Logger.Error(ex, "Error in UserDA.CreateUser");
            }
            return response;
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
        public static async Task<UserDetailsDTO> InsertPersonalDetails(UserDetailsDTO userDetails)
        {
            try
            {
                DynamicParameters param = new DynamicParameters();
                param.Add("@PersonalDetailD", userDetails.PersonalDetailD);
                param.Add("@UserID", userDetails.UserID);
                param.Add("@FirstName", userDetails.FirstName);
                param.Add("@LastName", userDetails.LastName);
                param.Add("@Email", userDetails.Email);
                param.Add("@PhoneNumber", userDetails.PhoneNumber);
                param.Add("@Address", userDetails.Address);
                param.Add("@Summary", userDetails.Summary);
                param.Add("@JobTitle", userDetails.JobTitle);
                param.Add("@Message", dbType: DbType.String, direction: ParameterDirection.Output, size: 100);
                param.Add("@PersonalID", dbType: DbType.Int64, direction: ParameterDirection.Output, size: 100);

                using (var connection = new SqlConnection(ConfigSettings.ConnectionString))
                {
                    await connection.ExecuteAsync("RB.InsertPersonalDetails", param, commandType: CommandType.StoredProcedure);
                    userDetails.PersonalDetailD = param.Get<long>("@PersonalID");
                }
            }

            catch (Exception ex)
            {
                await Logger.Error(ex, "Error in UserDA.InsertPersonalDetails");
            }
            return userDetails;
        }
        public static async Task<List<ExperienceDetailsDTO>> InsertExperienceDetails(List<ExperienceDetailsDTO> expDetails)
        {

            try
            {
                DataTable expItems = TableTypes.CreateExpTable();
                foreach (ExperienceDetailsDTO item in expDetails)
                {
                    expItems.Rows.Add(item.ExperienceDetailsID, item.JobTitle, item.Employer, item.City, item.Country, item.StartDate, item.EndDate,
                       item.IsCurrentlyWorkingCompany,item.Description, item.IsActive);
                }
                DynamicParameters param = new DynamicParameters();
                param.Add("@ExpTableType", expItems.AsTableValuedParameter("RB.TT_ExpDetails"));
                param.Add("@UserID", expDetails[0].UserID);
                param.Add("@Message", dbType: DbType.String, direction: ParameterDirection.Output, size: 100);
                using (var connection = new SqlConnection(ConfigSettings.ConnectionString))
                {
                    await connection.ExecuteAsync("RB.InsertExperienceDetails", param, commandType: CommandType.StoredProcedure);
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
                DataTable eduItems = TableTypes.CreateEduTable();
                foreach (EducationDetailsDTO item in eduDetails)
                {
                    eduItems.Rows.Add(item.EducationDetailID, item.Education, item.School, item.StartDate, item.EndDate, item.City, item.IsActive);
                }

                DynamicParameters param = new DynamicParameters();
                param.Add("@EduTableType", eduItems.AsTableValuedParameter("RB.TT_EducationDetails"));
                param.Add("@UserID", eduDetails[0].UserID);
                param.Add("@Message", dbType: DbType.String, direction: ParameterDirection.Output, size: 100);
                using (var connection = new SqlConnection(ConfigSettings.ConnectionString))
                {
                    await connection.ExecuteAsync("RB.InsertEducationDetails", param, commandType: CommandType.StoredProcedure);
                }

                //foreach (EducationDetailsDTO item in eduDetails)
                //{
                //    DynamicParameters param = new DynamicParameters();
                //    param.Add("@EducationDetailID", item.EducationDetailID);
                //    param.Add("@Education", item.Education);
                //    param.Add("@School", item.School);
                //    param.Add("@StartDate", item.StartDate);
                //    param.Add("@EndDate", item.EndDate);
                //    param.Add("@City", item.City);
                //    param.Add("@UserID", item.UserID);
                //    param.Add("@IsActive", item.IsActive);
                //    param.Add("@Message", dbType: DbType.String, direction: ParameterDirection.Output, size: 100);
                //    param.Add("@EduID", dbType: DbType.Int64, direction: ParameterDirection.Output, size: 100);

                //    using (var connection = new SqlConnection(ConfigSettings.ConnectionString))
                //    {
                //        await connection.ExecuteAsync("RB.InsertEducationDetails", param, commandType: CommandType.StoredProcedure);
                //        if (param.Get<long?>("@EduID") != null)
                //        {
                //            item.EducationDetailID = param.Get<long>("@EduID");
                //        }
                //    }
                //}

                return eduDetails;
            }

            catch (Exception ex)
            {
                await Logger.Error(ex, "Error in UserDA.InsertEducationDetails");
            }
            return eduDetails;
        }
        public static async Task<List<SkillDetailsDTO>> InsertSkillDetails(List<SkillDetailsDTO> skillDetails)
        {

            try
            {
                DataTable skillItems = TableTypes.CreateSkillTable();
                foreach (SkillDetailsDTO item in skillDetails)
                {
                    skillItems.Rows.Add(item.SkillDetailID, item.SkillName, item.SkillRating, item.IsActive);
                }

                DynamicParameters param = new DynamicParameters();
                param.Add("@SkillTableType", skillItems.AsTableValuedParameter("RB.TT_SkillDetails"));
                param.Add("@UserID", skillDetails[0].UserID);
                param.Add("@Message", dbType: DbType.String, direction: ParameterDirection.Output, size: 100);
                using (var connection = new SqlConnection(ConfigSettings.ConnectionString))
                {
                    await connection.ExecuteAsync("RB.InsertSkillsDetails", param, commandType: CommandType.StoredProcedure);
                }
                return skillDetails;
            }

            catch (Exception ex)
            {
                await Logger.Error(ex, "Error in UserDA.InsertEducationDetails");
            }
            return skillDetails;
        }

        public static async Task<List<HobbyDetailsDTO>> InsertHobbyDetails(List<HobbyDetailsDTO> hobbyDetails)
        {

            try
            {
                DataTable hobbyItems = TableTypes.CreateHobbyTable();
                foreach (HobbyDetailsDTO item in hobbyDetails)
                {
                    hobbyItems.Rows.Add(item.HobbyDetailsID, item.HobbyName, item.IsActive);
                }

                DynamicParameters param = new DynamicParameters();
                param.Add("@HobbyTableType", hobbyItems.AsTableValuedParameter("RB.TT_HobbyDetails"));
                param.Add("@UserID", hobbyDetails[0].UserID);
                param.Add("@Message", dbType: DbType.String, direction: ParameterDirection.Output, size: 100);
                using (var connection = new SqlConnection(ConfigSettings.ConnectionString))
                {
                    await connection.ExecuteAsync("RB.InsertHobbyDetails", param, commandType: CommandType.StoredProcedure);
                }

                //foreach (HobbyDetailsDTO item in hobbyDetails)
                //{
                //    DynamicParameters param = new DynamicParameters();
                //    param.Add("@HobbyDetailsID", item.HobbyDetailsID);
                //    param.Add("@HobbyName", item.HobbyName);
                //    param.Add("@IsActive", item.IsActive);
                //    param.Add("@UserID", item.UserID);
                //    param.Add("@Message", dbType: DbType.String, direction: ParameterDirection.Output, size: 100);
                //    param.Add("@HobbyID", dbType: DbType.Int64, direction: ParameterDirection.Output, size: 100);

                //    using (var connection = new SqlConnection(ConfigSettings.ConnectionString))
                //    {
                //        await connection.ExecuteAsync("RB.InsertHobbyDetails", param, commandType: CommandType.StoredProcedure);
                //        if (param.Get<long?>("@HobbyID") != null)
                //        {
                //            item.HobbyDetailsID = param.Get<long>("@HobbyID");
                //        }
                //    }
                //}

                //return hobbyDetails;
            }

            catch (Exception ex)
            {
                await Logger.Error(ex, "Error in UserDA.InsertHobbyDetails");
            }
            return hobbyDetails;
        }
        public static async Task<List<LanguageDetailsDTO>> InsertLanguageDetails(List<LanguageDetailsDTO> languageDetails)
        {

            try
            {
                DataTable lngtems = TableTypes.CreateLangTable();
                foreach (LanguageDetailsDTO item in languageDetails)
                {
                    lngtems.Rows.Add(item.LanguageDetailsID, item.LanguageName, item.IsActive);
                }

                DynamicParameters param = new DynamicParameters();
                param.Add("@LangTableType", lngtems.AsTableValuedParameter("RB.TT_LangDetails"));
                param.Add("@UserID", languageDetails[0].UserID);
                param.Add("@Message", dbType: DbType.String, direction: ParameterDirection.Output, size: 100);
                using (var connection = new SqlConnection(ConfigSettings.ConnectionString))
                {
                    await connection.ExecuteAsync("RB.InsertLanguageDetails", param, commandType: CommandType.StoredProcedure);
                }

                //foreach (LanguageDetailsDTO item in languageDetails)
                //{
                //    DynamicParameters param = new DynamicParameters();
                //    param.Add("@LanguageDetailID", item.LanguageDetailsID);
                //    param.Add("@LanguageName", item.LanguageName);
                //    param.Add("@UserID", item.UserID);
                //    param.Add("@IsActive", item.IsActive);
                //    param.Add("@Message", dbType: DbType.String, direction: ParameterDirection.Output, size: 100);
                //    param.Add("@LangID", dbType: DbType.Int64, direction: ParameterDirection.Output, size: 100);

                //    using (var connection = new SqlConnection(ConfigSettings.ConnectionString))
                //    {
                //        await connection.ExecuteAsync("RB.InsertLanguageDetails", param, commandType: CommandType.StoredProcedure);
                //        if (param.Get<long?>("@LangID") != null)
                //        {
                //            item.LanguageDetailsID = param.Get<long>("@LangID");
                //        }
                //    }
                //}

                return languageDetails;
            }

            catch (Exception ex)
            {
                await Logger.Error(ex, "Error in UserDA.InsertLanguageDetails");
            }
            return languageDetails;
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
        public static async Task<string> GetTemplatesDetailsByID(long userID,int selectedTemplateID)
        {
            string result = null; ;

            try
            {
                DynamicParameters param = new DynamicParameters();
                param.Add("@TemplateId", selectedTemplateID);
                param.Add("@UserID", userID);
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
                using (var connection = new SqlConnection(ConfigSettings.ConnectionString))
                {
                    IEnumerable<SkillDetailsModel> skillDetails = await connection.QueryAsync<SkillDetailsModel>("RB.GetSkillDetails", param, commandType: CommandType.StoredProcedure);
                    result.SkillDetailsModel = skillDetails.ToList();
                }
                using (var connection = new SqlConnection(ConfigSettings.ConnectionString))
                {
                    IEnumerable<HobbyDetailsModel> hobbyDetails = await connection.QueryAsync<HobbyDetailsModel>("RB.GetHobbyDetails", param, commandType: CommandType.StoredProcedure);
                    result.HobbyDetailsModel = hobbyDetails.ToList();
                }
                using (var connection = new SqlConnection(ConfigSettings.ConnectionString))
                {
                    IEnumerable<LanguageDetailsModel> langDetails = await connection.QueryAsync<LanguageDetailsModel>("RB.GetLanguageDetails", param, commandType: CommandType.StoredProcedure);
                    result.LanguageDetailsModel = langDetails.ToList();
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