
using System.Collections.Generic;

namespace RB.Website.Model
{
    public class ResumeDataModel
    {
        public UserDetailsModel UserDetailsModel { get; set; }
        public ExperienceDetailsModel ExperienceDetailsModel { get; set; }
        public List<EducationDetailsModel> EducationDetailsModel { get; set; }
    }
}
