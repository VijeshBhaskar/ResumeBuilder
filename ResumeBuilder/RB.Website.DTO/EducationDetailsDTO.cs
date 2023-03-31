using System;

namespace RB.Website.DTO
{
    public class EducationDetailsDTO
    {
        public long? EducationDetailID { get; set; }
        public string Education { get; set; }
        public string School { get; set; }
        public DateTime? StartDate { get; set; }
        public DateTime? EndDate { get; set; }
        public string City { get; set; }
        public long UserID { get; set; }
        public bool IsActive { get; set; }
    }
}
