using System.ComponentModel.DataAnnotations;

namespace XPEL.Website.Model
{
    public class WarrantyCheckModel
    {
        [Required(ErrorMessage = "VIN is required")]
        public string VIN { get; set; }

        [Required(ErrorMessage = "Phone Number is required")]
        public string PhoneNumber { get; set; }
    }
}
