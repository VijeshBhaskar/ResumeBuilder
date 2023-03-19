using System;

namespace XPEL.Website.DTO
{
    public class InstallerDetailsDTO
    {
        public long InstallerDetailsID { get; set; }
        public string InstallerName { get; set; }
        public string Address { get; set; }
        public bool IsActive { get; set; }
        public string MobileNumber1 { get; set; }
        public DateTime CreatedDate { get; set; }
        public DateTime ModifiedDate { get; set; }
    }
}
