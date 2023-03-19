using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using System.Web.Mvc;


namespace Website.Common.Helper
{
    public class CustomHelper
    {
        public static async Task<string> GetModelStateErrors(ModelStateDictionary modelState)
        {
            string responseMessage = string.Empty;

            try
            {
                var error = modelState.Select(x => x.Value.Errors).Where(y => y.Count > 0).ToList();

                if (error != null && error.Count > 0)
                {
                    List<string> errorMessage = new List<string>();

                    for (int i = 0; i < error.Count; i++)
                    {
                        if (error[i].Any(x => !string.IsNullOrEmpty(x.ErrorMessage)))
                        {
                            errorMessage.Add(error[i].Select(x => x.ErrorMessage).FirstOrDefault());
                        }
                    }

                    responseMessage = string.Join("<br/>", errorMessage);
                }
            }
            catch (Exception ex)
            {
                await Logger.Logger.Error(ex, "Error in HtmlHelper.GetModelStateErrors");
                responseMessage = "Please fill the Form";
            }

            return responseMessage;
        }
    }
}