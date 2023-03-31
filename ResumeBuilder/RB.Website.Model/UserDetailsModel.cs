using System.ComponentModel.DataAnnotations;
namespace RB.Website.Model
{
    public class UserDetailsModel
    {
        public long PersonalDetailD { get; set; }
        [Required(ErrorMessage = "FirstName is required")]
        public string FirstName { get; set; }
        public string LastName { get; set; }

        [Required(ErrorMessage = "Email is required")]
        public string Email { get; set; }

        [Required(ErrorMessage = "Phone Number is required")]
        public string PhoneNumber { get; set; }

        [Required(ErrorMessage = "Address is required")]
        public string Address { get; set; }
        public string Summary { get; set; }
        public string JobTitle { get; set; }
        public long UserID { get; set; }
    }
}
