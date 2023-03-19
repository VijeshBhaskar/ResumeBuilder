using System.Web.Configuration;

namespace Website.Common.ConfigSettings
{
    public partial class ConfigSettings
    {
        public static string ConnectionString
        {
            get
            {
                return WebConfigurationManager.ConnectionStrings["ConString"].ToString();
            }
        }
    }
}