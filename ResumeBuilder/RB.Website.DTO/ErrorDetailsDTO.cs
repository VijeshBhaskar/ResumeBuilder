using System;

namespace RB.Website.DTO
{
    public class ErrorDetailsDTO
    {
        public int ErrorID { get; set; }
        public string CustomMessage { get; set; }
        public string ErrorMessage { get; set; }
        public string StackTrace { get; set; }
        public DateTime CreatedDate { get; set; }
    }
}
