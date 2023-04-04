﻿using System;

namespace RB.Website.Model
{
    public class ExperienceDetailsModel
    {
        public long? ExperienceDetailsID { get; set; }
        public string JobTitle { get; set; }
        public string Employer { get; set; }
        public string City { get; set; }
        public string Country { get; set; }
        public string Description { get; set; }
        public DateTime? StartDate { get; set; }
        public DateTime? EndDate { get; set; }
        public bool IsActive { get; set; }
        public bool IsCurrentlyWorkingCompany { get; set; }
    }
}
