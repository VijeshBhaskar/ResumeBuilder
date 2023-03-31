using System;

namespace RB.Website.Model
{
    public class EducationDetailsModel
    {
        public long? EducationDetailID { get; set; }
        public string Education { get; set; }
        public string School { get; set; }
        public DateTime? StartDate { get; set; }
        public DateTime? EndDate { get; set; }
        public string City { get; set; }
        public bool IsActive { get; set; }
    }
}
