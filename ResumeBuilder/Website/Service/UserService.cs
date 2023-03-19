using RB.Website.DTO;
using RB.Website.Model;
using System.Collections.Generic;
using System.Threading.Tasks;
using Website.DataAccess;
using XPEL.Website.DTO;
using XPEL.Website.Model;

namespace Website.Service
{
    public class UserService
    {
        public static async Task CreateUser(UserLoginDTO userDetails)
        {
            await UserDA.CreateUser(userDetails);
        }
        public static async Task<UserDetailsDTO> LoginUser(UserLoginDTO userDetails)
        {
            return await UserDA.LoginUser(userDetails);
        }
        public static async Task<UserSaveResponseDTO> InsertPersonalDetails(UserDetailsDTO userDetails)
        {
            return await UserDA.InsertPersonalDetails(userDetails);
        }
        public static async Task<UserSaveResponseDTO> InsertExperienceDetails(ExperienceDetailsDTO expDetails)
        {
            return await UserDA.InsertExperienceDetails(expDetails);
        }
        public static async Task<List<EducationDetailsDTO>> InsertEducationDetails(List<EducationDetailsDTO> eduDetails)
        {
           return await UserDA.InsertEducationDetails(eduDetails);

        }
        public static async Task<IEnumerable<TemplateDetailsDTO>> GetTemplatesDetails()
        {
           return await UserDA.GetTemplatesDetails();
        }
        public static async Task<string> GetTemplatesDetailsByID()
        {
            return await UserDA.GetTemplatesDetailsByID();
        }

        public static async Task<ResumeDataModel> GetResumeDetails(long UserID)
        {
            return await UserDA.GetResumeDetails(UserID);
        }
        

        public static async Task<int> SelectWarrantyByRoleID(long roleID)
        {
            return await UserDA.SelectWarrantyByRoleID(roleID);
        }
        public static async Task<WarrantyDetailsDTO> CheckWarranty(WarrantyCheckDTO request)
        {
            return await UserDA.CheckWarranty(request);
        }
        public static async Task<IEnumerable<InstallerDetailsDTO>> SelectInstallerDetailsByName(string installerName)
        {
            return await UserDA.SelectInstallerDetailsByName(installerName);
        }

        public static async Task<InstallerDetailsDTO> SelectInstallerDetailsByID(long installerDetailsID)
        {
            return await UserDA.SelectInstallerDetailsByID(installerDetailsID);
        }
    }
}