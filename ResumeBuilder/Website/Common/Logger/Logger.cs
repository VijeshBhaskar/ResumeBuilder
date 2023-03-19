using System;
using System.IO;
using System.Threading.Tasks;
using Website.DataAccess;
using RB.Website.DTO;

namespace Website.Common.Logger
{
    public sealed class Logger
    {
        public static async Task<bool> Error(Exception ex, string message = "")
        {
            try
            {
                ErrorDetailsDTO errorDetails = new ErrorDetailsDTO();
                errorDetails.CustomMessage = message;
                errorDetails.ErrorMessage = ex.Message;
                errorDetails.StackTrace = ex.StackTrace;

                await ErrorLogDA.InsertErrorDetails(errorDetails);

                return await Task.FromResult(true);

                //string exceptionMessage = string.Format("{0}Custom Message: {1}{0}Error Message: {2}{0}Stack Trace: {3}", Environment.NewLine, message, ex.Message, ex.StackTrace);
                //string path = Path.Combine(AppDomain.CurrentDomain.BaseDirectory, "Logs", "Error");

                //if (!Directory.Exists(path))
                //{
                //    Directory.CreateDirectory(path);
                //}

                //string fileName = "log_Error_" + DateTime.Now.ToString("dd-MM-yyyy hh_mm_ss") + ".txt";

                //string location = Path.Combine(path, fileName);
                //File.AppendAllText(location, exceptionMessage);

                //return await Task.FromResult(true);
            }
            catch (Exception)
            {
                return await Task.FromResult(false);
            }
        }
        public static async Task<bool> LogToTextFile(string message = "")
        {
            try
            {
                if (string.IsNullOrEmpty(message))
                {
                    return await Task.FromResult(false);
                }

                string path = Path.Combine(AppDomain.CurrentDomain.BaseDirectory, "Logs", "Logs");

                if (!Directory.Exists(path))
                {
                    Directory.CreateDirectory(path);
                }

                string fileName = "log_" + DateTime.Now.ToString("dd-MM-yyyy hh_mm_ss") + ".txt";

                string location = Path.Combine(path, fileName);
                File.AppendAllText(location, message);

                return await Task.FromResult(true);
            }
            catch (Exception)
            {
                return await Task.FromResult(false);
            }
        }
    }
}