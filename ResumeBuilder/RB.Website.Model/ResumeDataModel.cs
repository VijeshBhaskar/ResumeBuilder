
using System.Collections.Generic;

namespace RB.Website.Model
{
    public class ResumeDataModel
    {
        public UserDetailsModel UserDetailsModel { get; set; }
        public List<ExperienceDetailsModel> ExperienceDetailsModel { get; set; }
        public List<EducationDetailsModel> EducationDetailsModel { get; set; }
        public List<SkillDetailsModel> SkillDetailsModel { get; set; }
        public List<HobbyDetailsModel> HobbyDetailsModel { get; set; }
        public List<LanguageDetailsModel> LanguageDetailsModel { get; set; }
    }

}
