using System.Data;

namespace RB.Website.DTO
{
    public class UserDetailsDTO
    {
        public long PersonalDetailD { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public string Email { get; set; }
        public string PhoneNumber { get; set; }
        public string Address { get; set; }
        public long UserID { get; set; }
        public string Summary { get; set; }
        public string JobTitle { get; set; }
    }
}
