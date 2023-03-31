using System;

namespace RB.Website.DTO
{
    public class ExperienceDetailsDTO
    {
        public long? ExperienceDetailsID { get; set; }
        public string JobTitle { get; set; }
        public string Employer { get; set; }
        public string City { get; set; }
        public string Country { get; set; }
        public DateTime? StartDate { get; set; }
        public DateTime? EndDate { get; set; }
        public bool IsActive { get; set; }
        public bool IsCurrentlyWorkingCompany { get; set; }
        public long UserID { get; set; }
    }
}
