using RB.Website.DTO;
using System;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Text;
using System.Threading.Tasks;
using XPEL.Website.DTO;

namespace Website.Common.Notification
{
    public enum EmailType
    {
        UserRegistration = 1
    }

    public class EmailService
    {
        public async Task<bool> SendEmail<T>(string toMailAddress, string subject, T data, EmailType emailType = EmailType.UserRegistration)
        {
            try
            {
                string emailBody = string.Empty;

                MailMessage message = new MailMessage();
                message.From = new MailAddress(ConfigSettings.ConfigSettings.EmailUserName);
                message.To.Add(toMailAddress);

                string bccEmails = ConfigSettings.ConfigSettings.BCCEmails;

                if (!string.IsNullOrEmpty(bccEmails))
                {
                    var bccEmail = bccEmails.Split(',').ToList();

                    foreach (var email in bccEmail)
                    {
                        message.Bcc.Add(email);
                    }
                }
                        
                message.Subject = subject;
                message.IsBodyHtml = true;

                switch (emailType)
                {
                    case EmailType.UserRegistration:
                        UserDetailsDTO user = data as UserDetailsDTO;
                      //  emailBody = await UserRegistrationTemplate(user);
                        break;
                }

                message.Body = emailBody;

                SmtpClient client = new SmtpClient();
                client.Host = ConfigSettings.ConfigSettings.Host;
                client.Port = ConfigSettings.ConfigSettings.EmailPort;
                client.EnableSsl = ConfigSettings.ConfigSettings.EnableSsl;
                client.UseDefaultCredentials = false;
                client.Credentials = new NetworkCredential(ConfigSettings.ConfigSettings.EmailUserName, ConfigSettings.ConfigSettings.EmailPassword);

                await client.SendMailAsync(message);
                return true;
            }
            catch (Exception ex)
            {
                await Logger.Logger.Error(ex, "Error in EmailService.SendEmail");
                return false;
            }
        }
        //public async Task<string> UserRegistrationTemplate(UserDetailsDTO data)
        //{
        //    try
        //    {
        //        string roleid = string.Format("{0},{1}", data.RoleID1, (data.RoleID2 > 0 ? data.RoleID2.ToString() : ""));

        //        StringBuilder template = new StringBuilder();

        //        template.Append("<html>");
        //        template.Append("<head>");
        //        template.Append("</head>");
        //        template.Append("<body>");
        //        template.Append("<div style='font-family:vardana'>");
        //        template.Append("<table style='margin: auto'>");
        //        template.Append("<tr>");
        //        template.Append("<td>");
        //        template.Append("<div style='background: #f5af05;height:45px;'></div>");
        //        template.Append("</td>");
        //        template.Append("</tr>");
        //        template.Append("<tr>");
        //        template.Append("<td>");
        //        template.Append("<div style='background-color:#1c1b1b;height:100px !important'>");
        //        template.Append(string.Format("<img style='margin-top: 35px !important;height: 50px !important;margin-left: 20px !important;' src='{0}{1}'>", ConfigSettings.ConfigSettings.B2CUrl, "dist/img/xpel-logo.png"));
        //        template.Append("</div>");
        //        template.Append("</td>");
        //        template.Append("</tr>");
        //        template.Append("<tr>");
        //        template.Append("<td>");
        //        template.Append(string.Format("<p>{0} {1},</p>", "Dear", data.UserName));
        //        template.Append("<p>You have successfully registered your warranty with XPEL. The registration details are as follows,</p>");
        //        template.Append(string.Format("<p>Name: {0}</p>", data.UserName));
        //        template.Append(string.Format("<p>Make, Model & Reg. No: {0}</p>", data.RegistrationNumber));
        //        template.Append(string.Format("<p>VIN: {0}</p>", data.VIN));
        //        template.Append(string.Format("<p>Role ID: {0}</p>", roleid.Trim(',')));
        //        template.Append("<p><b><u>Installer Details</u></b></p>");
        //        template.Append(string.Format("<p>Installer Name: {0}</p>", data.InstallerName));
        //        template.Append(string.Format("<p>Installer Phone Number: {0}</p>", data.MobileNumber1));
        //        template.Append("<p>Please note, the warranty is non-transferable. Only the registered person can claim the warranty. </p>");
        //        template.Append(string.Format("<p>For warranty check please follow the link: {0}?VIN={1}&phoneNumber={2}&tab={3}</p>", ConfigSettings.ConfigSettings.B2CEmailURL, data.VIN, data.PhoneNumber, "WarrantyCheck"));
        //        template.Append("<p>Regards,</p>");
        //        template.Append("<p>XPEL India</p>");
        //        template.Append("</td>");
        //        template.Append("</tr>");
        //        template.Append("<tr>");
        //        template.Append("<td>");
        //        template.Append("<div style='background-color:#1c1b1b;height:20px !important;margin-top:40px !important;'></div>");
        //        template.Append("</td>");
        //        template.Append("</tr>");
        //        template.Append("<tr>");
        //        template.Append("<td>");
        //        template.Append("<div style='background: #f5af05;height:45px;'></div>");
        //        template.Append("</td>");
        //        template.Append("</tr>");
        //        template.Append("</table>");
        //        template.Append("</div>");
        //        template.Append("</body>");
        //        template.Append("</html>");

        //        return template.ToString();
        //    }
        //    catch (Exception ex)
        //    {
        //        await Logger.Logger.Error(ex, "Error in EmailService.UserRegistrationTemplate");
        //        return "";
        //    }
        //}
    }
}