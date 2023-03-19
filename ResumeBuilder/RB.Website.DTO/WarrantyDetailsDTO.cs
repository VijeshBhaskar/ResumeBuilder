using System;

namespace XPEL.Website.DTO
{
    public class WarrantyDetailsDTO
    {
        public string UserName { get; set; }
        public string Address { get; set; }
        public string PhoneNumber { get; set; }
        public string Email { get; set; }
        public string VIN { get; set; }
        public string RegistrationNumber { get; set; }
        public long InstallerID { get; set; }
        public string InstallerName { get; set; }
        public long RoleID1 { get; set; }
        public long RoleID2 { get; set; }
        public string RoleID
        {
            get
            {
                return string.Format("{0},{1}", RoleID1, RoleID2 > 0 ? RoleID2.ToString() : "").Trim(',');
            }
        }
        public int Warranty { get; set; }
        public bool IsWarrantyAvailable { get; set; }
        public DateTime WarrantyExpiryDate { get; set; }
        public decimal ConsumedQuantity { get; set; }
    }
}
