using RB.Website.DTO;
using System;
using System.Threading.Tasks;
using System.Web;

namespace Website.Common.Session
{
    public class UserSessionDetails
    {
        public static UserDetailsDTO UserDetails
        {
            get
            {
                UserDetailsDTO user = null;

                try
                {
                    if (HttpContext.Current.Session["UserDetails"] != null)
                    {
                        user = HttpContext.Current.Session["UserDetails"] as UserDetailsDTO;
                    }
                }
                catch (Exception ex)
                {
                    Task.FromResult(Logger.Logger.Error(ex, "Error in UserSessionDetails.UserDetails"));
                }

                return user;
            }

            set
            {
                HttpContext.Current.Session["UserDetails"] = value;
            }
        }
    }
}