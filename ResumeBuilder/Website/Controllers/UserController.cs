using RB.Website.DTO;
using RB.Website.Model;
using System;
using System.Collections.Generic;
using System.Threading.Tasks;
using System.Web.Mvc;
using Website.Common.Helper;
using Website.Common.Logger;
using Website.Common.Response;
using Website.Common.Session;
using Website.Service;

namespace Website.Controllers
{
    public class UserController : Controller
    {
        // GET: User
        public ActionResult Login(string message = "")
        {
            ViewBag.Message = message;
            return View();
        }

        [HttpPost]
        [Route("CreateUser")]
        public async Task<ActionResult> CreateUser(UserLoginModel modal)
        {
            try
            {
                UserLoginDTO user = new UserLoginDTO()
                {
                    Email = modal.Email,
                    Password = modal.Password
                };
                await UserService.CreateUser(user);
                return RedirectToAction("Login", "User");
            }
            catch (Exception ex)
            {
                await Logger.Error(ex, "Error in CreateUser");
                return RedirectToAction("Login", "User", new { message = "error occurred" });
            }
        }

        [HttpPost]
        [Route("LoginUser")]
        public async Task<ActionResult> LoginUser(UserLoginModel modal)
        {
            try
            {
                UserLoginDTO user = new UserLoginDTO()
                {
                    Email = modal.Email,
                    Password = modal.Password
                };

                var response = await UserService.LoginUser(user);
                if (response != null)
                {
                    UserSessionDetails.UserDetails = response;
                    return RedirectToAction("TemplateSelection", "User");
                    //return RedirectToAction("UserRegistration", "User", new { TemplateID =  1 });
                }
                else
                {
                    return RedirectToAction("Login", "User", new { message = "invalid login details" });
                }
            }
            catch (Exception ex)
            {
                await Logger.Error(ex, "Error in UserController.LoginUser");
                return RedirectToAction("Login", "User", new { message = "error occurred" });
            }
        }
        [Route("LogoutUser")]
        [HttpGet]
        public async Task<ActionResult> LogoutUser()
        {
            Session.Abandon();
            return await Task.FromResult(RedirectToAction("Login", "User"));
        }

        public async Task<ActionResult> TemplateSelection(string message = "")
        {
            ViewBag.Message = message;
            IEnumerable<TemplateDetailsDTO> response = await UserService.GetTemplatesDetails();
            return View(response);

        }
        [Route("OnChooseTemplate")]
        [HttpPost]
        public async Task<ActionResult> OnChooseTemplate(SelectedTemplateDetailsModel selectedTemplateDetails)
        {
            try
            {
                return RedirectToAction("ResumeDetails", "User", new { selectedTemplateDetails.TemplateID });
                //new { selectedTemplateDetails.TemplateID });
            }
            catch (Exception ex)
            {
                await Logger.Error(ex, "Error in UserController.TemplateSelection");
                return RedirectToAction("Login", "User", new { message = "error occurred" });
            }
        }
        public async Task<ActionResult> ResumeDetails(int TemplateID = 0)
        {
            ResumeDataModel ResumeDetails = null;
            ViewBag.TemplateID = TemplateID;
            if (UserSessionDetails.UserDetails != null && UserSessionDetails.UserDetails.UserID > 0)
            {
                ResumeDetails = await UserService.GetResumeDetails(UserSessionDetails.UserDetails.UserID);
                if (ResumeDetails.EducationDetailsModel == null)
                {
                    ResumeDetails.EducationDetailsModel = new List<EducationDetailsModel>()
                    {
                        new EducationDetailsModel()
                    };

                }
                if(ResumeDetails.ExperienceDetailsModel == null || ResumeDetails.ExperienceDetailsModel.Count == 0)
                {
                    ResumeDetails.ExperienceDetailsModel = new List<ExperienceDetailsModel>
                    {
                        new ExperienceDetailsModel()
                    };
                }
            }
            else
            {
                ResumeDetails = new ResumeDataModel()
                {
                    UserDetailsModel = new UserDetailsModel(),
                    ExperienceDetailsModel = new List<ExperienceDetailsModel>(),
                    EducationDetailsModel = new List<EducationDetailsModel>()
                };
            }

            return View(ResumeDetails);
        }
        public ActionResult UserRegistration(int TemplateID = 0)
        {
            ViewBag.TemplateID = TemplateID;
            return View();
        }

        [HttpPost]
        [Route("InsertPersonalDetails")]
        public async Task<JsonResult> InsertPersonalDetails(ResumeDataModel resumeDetails)
        {

            Response<long> response = new Response<long>
            {
                Data = -1
            };

            try
            {
                if (!ModelState.IsValid)
                {
                    response.Status = ResponseCode.ModelIsNotValid;
                    response.Message = await CustomHelper.GetModelStateErrors(ModelState);
                    return Json(response, JsonRequestBehavior.AllowGet);
                }

                UserDetailsDTO user = new UserDetailsDTO()
                {
                    FirstName = resumeDetails.UserDetailsModel.FirstName,
                    LastName = resumeDetails.UserDetailsModel.LastName,
                    Email = resumeDetails.UserDetailsModel.Email,
                    PhoneNumber = resumeDetails.UserDetailsModel.PhoneNumber,
                    Address = resumeDetails.UserDetailsModel.Address,
                    UserID = UserSessionDetails.UserDetails.UserID
                };

                UserSaveResponseDTO res = await UserService.InsertPersonalDetails(user);
                //response.Data = res.UserID;
                //response.Status = res.UserID > 0 ? ResponseCode.Success : ResponseCode.Failed;
                response.Message = res.Message;

                return Json(response, JsonRequestBehavior.AllowGet);
            }
            catch (Exception ex)
            {
                response.Status = ResponseCode.Error;
                response.Message = ex.Message;

                await Logger.Error(ex, "Error in UserController.InsertPersonalDetails");
                return Json(response, JsonRequestBehavior.AllowGet);
            }
        }
        [HttpPost]
        [Route("InsertExperienceDetails")]
        public async Task<ActionResult> InsertExperienceDetails(ResumeDataModel resumeDetails)
        {

            Response<long> response = new Response<long>
            {
                Data = -1
            };

            try
            {
                if (!ModelState.IsValid)
                {
                    response.Status = ResponseCode.ModelIsNotValid;
                    response.Message = await CustomHelper.GetModelStateErrors(ModelState);
                    return Json(response, JsonRequestBehavior.AllowGet);
                }

                List<ExperienceDetailsDTO> experience = new List<ExperienceDetailsDTO>();
                foreach (ExperienceDetailsModel item in resumeDetails.ExperienceDetailsModel)
                {
                    ExperienceDetailsDTO exp = new ExperienceDetailsDTO()
                    {
                        ExperienceDetailsID = item.ExperienceDetailsID,
                        JobTitle = item.JobTitle,
                        Employer = item.Employer,
                        City = item.City,
                        Country = item.Country,
                        StartDate = item.StartDate,
                        EndDate = item.EndDate,
                        IsCurrentlyWorkingCompany = item.IsCurrentlyWorkingCompany,
                        UserID = UserSessionDetails.UserDetails.UserID
                    };
                    experience.Add(exp);
                }

                var experienceDetailsModel = await UserService.InsertExperienceDetails(experience);
                resumeDetails.ExperienceDetailsModel = new List<ExperienceDetailsModel>();
                foreach (ExperienceDetailsDTO item in  experienceDetailsModel)
                {
                    var expDetail = new ExperienceDetailsModel()
                    {
                        ExperienceDetailsID = item.ExperienceDetailsID,
                        JobTitle = item.JobTitle,
                        Employer = item.Employer,
                        City = item.City,
                        Country = item.Country,
                        StartDate = item.StartDate,
                        EndDate = item.EndDate,
                        IsCurrentlyWorkingCompany = item.IsCurrentlyWorkingCompany,
                    };

                    resumeDetails.ExperienceDetailsModel.Add(expDetail);
                }
                //response.Data = res.UserID;
                //response.Status = res.UserID > 0 ? ResponseCode.Success : ResponseCode.Failed;

                //return Json(response, JsonRequestBehavior.AllowGet);
                return View("ResumeDetails", resumeDetails);
            }
            catch (Exception ex)
            {
                response.Status = ResponseCode.Error;
                response.Message = ex.Message;

                await Logger.Error(ex, "Error in UserController.InsertPersonalDetails");
                return Json(response, JsonRequestBehavior.AllowGet);
            }
        }
        [HttpPost]
        [Route("InsertEducationDetails")]
        public async Task<JsonResult> InsertEducationDetails(ResumeDataModel resumeDetails)
        {

            Response<long> response = new Response<long>
            {
                Data = -1
            };

            try
            {
                if (!ModelState.IsValid)
                {
                    response.Status = ResponseCode.ModelIsNotValid;
                    response.Message = await CustomHelper.GetModelStateErrors(ModelState);
                    return
                        Json(response, JsonRequestBehavior.AllowGet);
                }

                List<EducationDetailsDTO> education = new List<EducationDetailsDTO>();
                foreach (EducationDetailsModel item in resumeDetails.EducationDetailsModel)
                {
                    EducationDetailsDTO edu = new EducationDetailsDTO()
                    {
                        EducationDetailID = item.EducationDetailID,
                        Education = item.Education,
                        School = item.School,
                        StartDate = item.StartDate,
                        EndDate = item.EndDate,
                        City = item.City,
                        UserID = UserSessionDetails.UserDetails.UserID
                    };
                    education.Add(edu);
                }

                var result = await UserService.InsertEducationDetails(education);
                resumeDetails.EducationDetailsModel = new List<EducationDetailsModel>();
                foreach (var item in result)
                {
                    EducationDetailsModel eduDetails = new EducationDetailsModel()
                    {
                        Education = item.Education,
                        School = item.School,
                        StartDate = item.StartDate,
                        EndDate = item.EndDate,
                        City = item.City
                    };
                    resumeDetails.EducationDetailsModel.Add(eduDetails);
                }

                return Json(resumeDetails, JsonRequestBehavior.AllowGet);
            }
            catch (Exception ex)
            {
                response.Status = ResponseCode.Error;
                response.Message = ex.Message;

                await Logger.Error(ex, "Error in UserController.InsertPersonalDetails");
                return Json(response, JsonRequestBehavior.AllowGet);
            }
        }
        [HttpPost]
        [Route("AddNewExperience")]
        public async Task<JsonResult> AddNewExperience(ResumeDataModel resumeDetails)
        {

            Response<long> response = new Response<long>
            {
                Data = -1
            };

            try
            {
                resumeDetails.ExperienceDetailsModel.Add(new ExperienceDetailsModel());
                return Json(resumeDetails, JsonRequestBehavior.AllowGet);
            }
            catch (Exception ex)
            {
                response.Status = ResponseCode.Error;
                response.Message = ex.Message;

                await Logger.Error(ex, "Error in UserController.InsertPersonalDetails");
                return Json(response, JsonRequestBehavior.AllowGet);
            }
        }
        [HttpPost]
        [Route("ViewResume")]
        public async Task<ActionResult> ViewResume()
        {
            string response = await UserService.GetTemplatesDetailsByID();
            ViewResumeModel veiwResume = new ViewResumeModel
            {
                TemplateHtml = response
            };
            ViewBag.TemplateHtml = response;
            return View();
        }
        [HttpGet]
        [Route("SelectWarrantyByRoleID")]
        public async Task<JsonResult> SelectWarrantyByRoleID(long roleID)
        {
            Response<int> response = new Response<int>
            {
                Data = 0
            };

            try
            {
                response.Data = await UserService.SelectWarrantyByRoleID(roleID);

                if (response.Data == -1)
                {
                    response.Status = ResponseCode.InvalidRequest;
                    response.Message = "Invalid Roll ID";
                }
                else if (response.Data == -2)
                {
                    response.Status = ResponseCode.InvalidRequest;
                    response.Message = "Roll Expired";
                }
                else
                {
                    response.Status = ResponseCode.Success;
                    response.Message = "Success";
                }
                return Json(response, JsonRequestBehavior.AllowGet);
            }
            catch (Exception ex)
            {
                response.Status = ResponseCode.Error;
                response.Message = ex.Message;

                await Logger.Error(ex, "Error in UserController.SelectWarrantyByRoleID");
                return Json(response, JsonRequestBehavior.AllowGet);
            }
        }
    }
}