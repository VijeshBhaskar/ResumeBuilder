using RB.Website.DTO;
using RB.Website.Model;
using System.Collections.Generic;
using System.Threading.Tasks;
using Website.DataAccess;

namespace Website.Service
{
    public class UserService
    {
        public static async Task<UserCreationResponseDTO> CreateUser(UserLoginDTO userDetails)
        {
            return await UserDA.CreateUser(userDetails);
        }
        public static async Task<UserDetailsDTO> LoginUser(UserLoginDTO userDetails)
        {
            return await UserDA.LoginUser(userDetails);
        }
        public static async Task<UserDetailsDTO> InsertPersonalDetails(UserDetailsDTO userDetails)
        {
            return await UserDA.InsertPersonalDetails(userDetails);
        }
        public static async Task<List<ExperienceDetailsDTO>> InsertExperienceDetails(List<ExperienceDetailsDTO> expDetails)
        {
            return await UserDA.InsertExperienceDetails(expDetails);
        }
        public static async Task<List<EducationDetailsDTO>> InsertEducationDetails(List<EducationDetailsDTO> eduDetails)
        {
           return await UserDA.InsertEducationDetails(eduDetails);

        }
        public static async Task<List<SkillDetailsDTO>> InsertSkillDetails(List<SkillDetailsDTO> skillDetails)
        {
            return await UserDA.InsertSkillDetails(skillDetails);

        }
        public static async Task<List<HobbyDetailsDTO>> InsertHobbyDetails(List<HobbyDetailsDTO> hobbyDetails)
        {
            return await UserDA.InsertHobbyDetails(hobbyDetails);

        }
        public static async Task<List<LanguageDetailsDTO>> InsertLanguageDetails(List<LanguageDetailsDTO> languageDetails)
        {
            return await UserDA.InsertLanguageDetails(languageDetails);

        }
        public static async Task<IEnumerable<TemplateDetailsDTO>> GetTemplatesDetails()
        {
           return await UserDA.GetTemplatesDetails();
        }
        public static async Task<string> GetTemplatesDetailsByID(long userID)
        {
            return await UserDA.GetTemplatesDetailsByID(userID);
        }

        public static async Task<ResumeDataModel> GetResumeDetails(long UserID)
        {
            return await UserDA.GetResumeDetails(UserID);
        }
        

        public static async Task<int> SelectWarrantyByRoleID(long roleID)
        {
            return await UserDA.SelectWarrantyByRoleID(roleID);
        }
    }
}