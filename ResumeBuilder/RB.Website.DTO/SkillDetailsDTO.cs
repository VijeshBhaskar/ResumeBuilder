namespace RB.Website.DTO
{
    public class SkillDetailsDTO
    {
        public long? SkillDetailID { get; set; }
        public long UserID { get; set; }
        public string SkillName { get; set; }
        public int SkillRating { get; set; }
        public bool IsActive { get; set; }

    }
}
