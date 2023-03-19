using System;
using System.Web.Configuration;

namespace Website.Common.ConfigSettings
{
    public partial class ConfigSettings
    {
        public static string ContactNumber
        {
            get
            {
                if (WebConfigurationManager.AppSettings["ContactNumber"] != null)
                {
                    return WebConfigurationManager.AppSettings["ContactNumber"].ToString();
                }

                return "";
            }
        }

        public static string EmailUserName
        {
            get
            {
                if (WebConfigurationManager.AppSettings["EmailUserName"] != null)
                {
                    return WebConfigurationManager.AppSettings["EmailUserName"].ToString();
                }

                return "";
            }
        }

        public static string BCCEmails
        {
            get
            {
                if (WebConfigurationManager.AppSettings["BCCEmails"] != null)
                {

                    return WebConfigurationManager.AppSettings["BCCEmails"].ToString();
                }

                return "";
            }
        }

        public static string EmailPassword
        {
            get
            {
                if (WebConfigurationManager.AppSettings["EmailPassword"] != null)
                {
                    return WebConfigurationManager.AppSettings["EmailPassword"].ToString();
                }

                return "";
            }
        }

        public static int EmailPort
        {
            get
            {
                if (WebConfigurationManager.AppSettings["EmailPort"] != null)
                {
                    return Convert.ToInt32(WebConfigurationManager.AppSettings["EmailPort"].ToString());
                }

                return 587;
            }
        }

        public static string B2CUrl
        {
            get
            {
                if (WebConfigurationManager.AppSettings["B2CUrl"] != null)
                {
                    return WebConfigurationManager.AppSettings["B2CUrl"].ToString();
                }

                return "";
            }
        }
        public static string B2CEmailURL
        {
            get
            {
                if (WebConfigurationManager.AppSettings["B2CEmailURL"] != null)
                {
                    return WebConfigurationManager.AppSettings["B2CEmailURL"].ToString();
                }

                return "";
            }
        }
        public static string Host
        {
            get
            {
                if (WebConfigurationManager.AppSettings["Host"] != null)
                {
                    return WebConfigurationManager.AppSettings["Host"].ToString();
                }

                return "";
            }
        }
        public static bool EnableSsl
        {
            get
            {
                if (WebConfigurationManager.AppSettings["EnableSsl"] != null)
                {
                    string result = WebConfigurationManager.AppSettings["EnableSsl"].ToString();

                    if (result.ToLower() == "true")
                    {
                        return true;
                    }
                }

                return false;
            }
        }
    }
}