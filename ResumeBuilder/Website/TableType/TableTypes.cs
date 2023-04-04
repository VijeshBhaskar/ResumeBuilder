using System;
using System.Data;

namespace Website.TableType
{
    public class TableTypes
    {
        public static DataTable CreateSkillTable()
        {
            DataTable dt = new DataTable();
            dt.Columns.Add("SkillDetailID", typeof(Int64));
            dt.Columns.Add("SkillName", typeof(string));
            dt.Columns.Add("SkillRating", typeof(Int32));
            dt.Columns.Add("IsActive", typeof(bool));
            return dt;
        }
        public static DataTable CreateExpTable()
        {
            DataTable dt = new DataTable();
            dt.Columns.Add("ExperienceDetailsID", typeof(Int64));
            dt.Columns.Add("JobTitle", typeof(string));
            dt.Columns.Add("Employer", typeof(string));
            dt.Columns.Add("City", typeof(string));
            dt.Columns.Add("Country", typeof(string));
            dt.Columns.Add("StartDate", typeof(DateTime));
            dt.Columns.Add("EndDate", typeof(DateTime));
            dt.Columns.Add("IsCurrentlyWorkingCompany", typeof(bool));
            dt.Columns.Add("Description", typeof(string));
            dt.Columns.Add("IsActive", typeof(bool));
            return dt;
        }
        public static DataTable CreateEduTable()
        {
            DataTable dt = new DataTable();
            dt.Columns.Add("EducationDetailID", typeof(Int64));
            dt.Columns.Add("Education", typeof(string));
            dt.Columns.Add("School", typeof(string));
            dt.Columns.Add("StartDate", typeof(DateTime));
            dt.Columns.Add("EndDate", typeof(DateTime));
            dt.Columns.Add("City", typeof(string));
            dt.Columns.Add("IsActive", typeof(bool));
            return dt;
        }
        public static DataTable CreateHobbyTable()
        {
            DataTable dt = new DataTable();
            dt.Columns.Add("HobbyDetailsID", typeof(Int64));
            dt.Columns.Add("HobbyName", typeof(string));
            dt.Columns.Add("IsActive", typeof(bool));
            return dt;
        }
        public static DataTable CreateLangTable()
        {
            DataTable dt = new DataTable();
            dt.Columns.Add("LanguageDetailID", typeof(Int64));
            dt.Columns.Add("LanguageName", typeof(string));
            dt.Columns.Add("IsActive", typeof(bool));
            return dt;
        }
    }
}