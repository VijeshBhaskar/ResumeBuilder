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
        public ActionResult Login(string message = "", string RegMsg = "")
        {
            ViewBag.Message = message;
            ViewBag.RegMsg = RegMsg;
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
                var response = await UserService.CreateUser(user);
                return RedirectToAction("Login", "User", new { RegMsg = response.Message });
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
                if (UserSessionDetails.UserDetails!=null)
                {
                    UserSessionDetails.UserDetails.SelectedTemplateID = selectedTemplateDetails.TemplateID;
                }
                return RedirectToAction("ResumeDetails", "User", new { selectedTemplateDetails.TemplateID });
                //new { selectedTemplateDetails.TemplateID });
            }
            catch (Exception ex)
            {
                await Logger.Error(ex, "Error in UserController.TemplateSelection");
                return RedirectToAction("Login", "User", new { message = "error occurred" });
            }
        }
        [OutputCache(Duration = 0)]
        public async Task<ActionResult> ResumeDetails(int TemplateID = 0)
        {
            ResumeDataModel ResumeDetails = null;
            ViewBag.TemplateID = TemplateID;
            if (UserSessionDetails.UserDetails != null && UserSessionDetails.UserDetails.UserID > 0)
            {
                ResumeDetails = await UserService.GetResumeDetails(UserSessionDetails.UserDetails.UserID);
                if (ResumeDetails.EducationDetailsModel == null || ResumeDetails.EducationDetailsModel.Count == 0)
                {
                    ResumeDetails.EducationDetailsModel = new List<EducationDetailsModel>()
                    {
                        new EducationDetailsModel(){IsActive = true}
                    };

                }
                if (ResumeDetails.ExperienceDetailsModel == null || ResumeDetails.ExperienceDetailsModel.Count == 0)
                {
                    ResumeDetails.ExperienceDetailsModel = new List<ExperienceDetailsModel>
                    {
                        new ExperienceDetailsModel(){IsActive = true}
                    };
                }
                if (ResumeDetails.SkillDetailsModel == null || ResumeDetails.SkillDetailsModel.Count == 0)
                {
                    ResumeDetails.SkillDetailsModel = new List<SkillDetailsModel>
                    {
                        new SkillDetailsModel(){IsActive = true}
                    };
                }
                if (ResumeDetails.LanguageDetailsModel == null || ResumeDetails.LanguageDetailsModel.Count == 0)
                {
                    ResumeDetails.LanguageDetailsModel = new List<LanguageDetailsModel>
                    {
                        new LanguageDetailsModel(){IsActive = true}
                    };
                }
                if (ResumeDetails.HobbyDetailsModel == null || ResumeDetails.HobbyDetailsModel.Count == 0)
                {
                    ResumeDetails.HobbyDetailsModel = new List<HobbyDetailsModel>
                    {
                        new HobbyDetailsModel(){IsActive = true}
                    };
                }
            }
            else
            {
                ResumeDetails = new ResumeDataModel()
                {
                    UserDetailsModel = new UserDetailsModel(),
                    ExperienceDetailsModel = new List<ExperienceDetailsModel>(),
                    EducationDetailsModel = new List<EducationDetailsModel>(),
                    LanguageDetailsModel = new List<LanguageDetailsModel>(),
                    HobbyDetailsModel = new List<HobbyDetailsModel>()
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
        public async Task<ActionResult> InsertPersonalDetails(ResumeDataModel resumeDetails)
        {

            Response<long> response = new Response<long>
            {
                Data = -1
            };

            try
            {
                UserDetailsDTO user = new UserDetailsDTO()
                {
                    PersonalDetailD = resumeDetails.UserDetailsModel.PersonalDetailD,
                    FirstName = resumeDetails.UserDetailsModel.FirstName,
                    LastName = resumeDetails.UserDetailsModel.LastName,
                    Email = resumeDetails.UserDetailsModel.Email,
                    PhoneNumber = resumeDetails.UserDetailsModel.PhoneNumber,
                    Address = resumeDetails.UserDetailsModel.Address,
                    UserID = UserSessionDetails.UserDetails.UserID,
                    Summary = resumeDetails.UserDetailsModel.Summary,
                    JobTitle = resumeDetails.UserDetailsModel.JobTitle
                };

                UserDetailsDTO res = await UserService.InsertPersonalDetails(user);
                resumeDetails.UserDetailsModel.PersonalDetailD = res.PersonalDetailD;
                //return View("ResumeDetails", resumeDetails);
                return PartialView(@"~/Views/User/PersonalPartialView.cshtml", resumeDetails);
            }
            catch (Exception ex)
            {
                response.Status = ResponseCode.Error;
                response.Message = ex.Message;

                await Logger.Error(ex, "Error in UserController.InsertPersonalDetails");
                return PartialView(@"~/Views/User/PersonalPartialView.cshtml", resumeDetails);
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
                        Description = item.Description,
                        IsActive = item.IsActive,
                        UserID = UserSessionDetails.UserDetails.UserID
                    };
                    experience.Add(exp);
                }

                var experienceDetailsModel = await UserService.InsertExperienceDetails(experience);
                resumeDetails.ExperienceDetailsModel = new List<ExperienceDetailsModel>();
                foreach (ExperienceDetailsDTO item in experienceDetailsModel)
                {
                    if (item.IsActive)
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
                            Description = item.Description,
                            IsActive = item.IsActive
                        };

                        resumeDetails.ExperienceDetailsModel.Add(expDetail);
                    }
                }

                return PartialView(@"~/Views/User/ExperiencePartialView.cshtml", resumeDetails);
            }
            catch (Exception ex)
            {
                response.Status = ResponseCode.Error;
                response.Message = ex.Message;

                await Logger.Error(ex, "Error in UserController.InsertPersonalDetails");
                return PartialView(@"~/Views/User/ExperiencePartialView.cshtml", resumeDetails);
            }
        }
        [HttpPost]
        [Route("InsertEducationDetails")]
        public async Task<ActionResult> InsertEducationDetails(ResumeDataModel resumeDetails)
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
                        UserID = UserSessionDetails.UserDetails.UserID,
                        IsActive = item.IsActive
                    };
                    education.Add(edu);
                }

                var result = await UserService.InsertEducationDetails(education);
                resumeDetails.EducationDetailsModel = new List<EducationDetailsModel>();
                foreach (var item in result)
                {
                    EducationDetailsModel eduDetails = new EducationDetailsModel()
                    {
                        EducationDetailID = item.EducationDetailID,
                        Education = item.Education,
                        School = item.School,
                        StartDate = item.StartDate,
                        EndDate = item.EndDate,
                        City = item.City,
                        IsActive = item.IsActive
                    };
                    resumeDetails.EducationDetailsModel.Add(eduDetails);
                }

                return PartialView(@"~/Views/User/EducationPartialView.cshtml", resumeDetails);
            }
            catch (Exception ex)
            {
                response.Status = ResponseCode.Error;
                response.Message = ex.Message;
                await Logger.Error(ex, "Error in UserController.InsertEducationDetails");
                return PartialView(@"~/Views/User/EducationPartialView.cshtml", resumeDetails);
            }
        }
        [HttpPost]
        [Route("InsertSkillDetails")]
        public async Task<ActionResult> InsertSkillDetails(ResumeDataModel resumeDetails)
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

                List<SkillDetailsDTO> skills = new List<SkillDetailsDTO>();
                foreach (SkillDetailsModel item in resumeDetails.SkillDetailsModel)
                {
                    SkillDetailsDTO skill = new SkillDetailsDTO()
                    {
                        SkillDetailID = item.SkillDetailID,
                        SkillName = item.SkillName,
                        SkillRating = item.SkillRating,
                        UserID = UserSessionDetails.UserDetails.UserID,
                        IsActive = item.IsActive
                    };
                    skills.Add(skill);
                }

                var result = await UserService.InsertSkillDetails(skills);
                resumeDetails.SkillDetailsModel = new List<SkillDetailsModel>();
                foreach (var item in result)
                {
                    SkillDetailsModel sklDetails = new SkillDetailsModel()
                    {
                        SkillDetailID = item.SkillDetailID,
                        SkillName = item.SkillName,
                        SkillRating = item.SkillRating,
                        IsActive = item.IsActive
                    };
                    resumeDetails.SkillDetailsModel.Add(sklDetails);
                }

                return PartialView(@"~/Views/User/SkillsPartialView.cshtml", resumeDetails);
            }
            catch (Exception ex)
            {
                response.Status = ResponseCode.Error;
                response.Message = ex.Message;
                await Logger.Error(ex, "Error in UserController.InsertSkillDetails");
                return PartialView(@"~/Views/User/SkillsPartialView.cshtml", resumeDetails);
            }
        }
        [HttpPost]
        [Route("InsertHobbyDetails")]
        public async Task<ActionResult> InsertHobbyDetails(ResumeDataModel resumeDetails)
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

                List<HobbyDetailsDTO> hobby = new List<HobbyDetailsDTO>();
                foreach (HobbyDetailsModel item in resumeDetails.HobbyDetailsModel)
                {
                    HobbyDetailsDTO hob = new HobbyDetailsDTO()
                    {
                        HobbyDetailsID = item.HobbyDetailsID,
                        HobbyName = item.HobbyName,
                        IsActive = item.IsActive,
                        UserID = UserSessionDetails.UserDetails.UserID
                    };
                    hobby.Add(hob);
                }

                var result = await UserService.InsertHobbyDetails(hobby);
                resumeDetails.HobbyDetailsModel = new List<HobbyDetailsModel>();
                foreach (var item in result)
                {
                    HobbyDetailsModel hbyDetails = new HobbyDetailsModel()
                    {
                        HobbyDetailsID = item.HobbyDetailsID,
                        HobbyName = item.HobbyName,
                        IsActive = item.IsActive
                    };
                    resumeDetails.HobbyDetailsModel.Add(hbyDetails);
                }

                return PartialView(@"~/Views/User/HobbyPartialView.cshtml", resumeDetails);
            }
            catch (Exception ex)
            {
                response.Status = ResponseCode.Error;
                response.Message = ex.Message;
                await Logger.Error(ex, "Error in UserController.InsertHobbyDetails");
                return PartialView(@"~/Views/User/HobbyPartialView.cshtml", resumeDetails);
            }
        }
        [HttpPost]
        [Route("InsertLanguageDetails")]
        public async Task<ActionResult> InsertLanguageDetails(ResumeDataModel resumeDetails)
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

                List<LanguageDetailsDTO> language = new List<LanguageDetailsDTO>();
                foreach (LanguageDetailsModel item in resumeDetails.LanguageDetailsModel)
                {
                    LanguageDetailsDTO lang = new LanguageDetailsDTO()
                    {
                        LanguageDetailsID = item.LanguageDetailsID,
                        LanguageName = item.LanguageName,
                        UserID = UserSessionDetails.UserDetails.UserID,
                        IsActive = item.IsActive
                    };
                    language.Add(lang);
                }

                var result = await UserService.InsertLanguageDetails(language);
                resumeDetails.LanguageDetailsModel = new List<LanguageDetailsModel>();
                foreach (var item in result)
                {
                    LanguageDetailsModel lngDetails = new LanguageDetailsModel()
                    {
                        LanguageDetailsID = item.LanguageDetailsID,
                        LanguageName = item.LanguageName,
                        IsActive = item.IsActive
                    };
                    resumeDetails.LanguageDetailsModel.Add(lngDetails);
                }

                return PartialView(@"~/Views/User/LanguagePartialView.cshtml", resumeDetails);
            }
            catch (Exception ex)
            {
                response.Status = ResponseCode.Error;
                response.Message = ex.Message;
                await Logger.Error(ex, "Error in UserController.InsertLanguageDetails");
                return PartialView(@"~/Views/User/LanguagePartialView.cshtml", resumeDetails);
            }
        }
        [HttpPost]
        [Route("AddNewExperience")]
        [OutputCache(Duration = 0)]
        public async Task<PartialViewResult> AddNewExperience(ResumeDataModel resumeDetails)
        {

            Response<long> response = new Response<long>
            {
                Data = -1
            };

            try
            {
                ModelState.Clear();
                //to remove unwanted item from list
                for (int i = 0; i < resumeDetails.ExperienceDetailsModel.Count; i++)
                {
                    if (!resumeDetails.ExperienceDetailsModel[i].IsActive)
                    {
                        resumeDetails.ExperienceDetailsModel.RemoveAt(i);
                    }
                }
                //
                resumeDetails.ExperienceDetailsModel.Add(new ExperienceDetailsModel()
                {
                    IsActive = true
                });
                if (resumeDetails.EducationDetailsModel == null || resumeDetails.EducationDetailsModel.Count == 0)
                {
                    resumeDetails.EducationDetailsModel = new List<EducationDetailsModel>();
                }
                if (resumeDetails.SkillDetailsModel == null || resumeDetails.SkillDetailsModel.Count == 0)
                {
                    resumeDetails.SkillDetailsModel = new List<SkillDetailsModel>();
                }
                if (resumeDetails.HobbyDetailsModel == null || resumeDetails.HobbyDetailsModel.Count == 0)
                {
                    resumeDetails.HobbyDetailsModel = new List<HobbyDetailsModel>();
                }
                if (resumeDetails.LanguageDetailsModel == null || resumeDetails.LanguageDetailsModel.Count == 0)
                {
                    resumeDetails.LanguageDetailsModel = new List<LanguageDetailsModel>();
                }
                return PartialView(@"~/Views/User/ExperiencePartialView.cshtml", resumeDetails);
            }
            catch (Exception ex)
            {
                response.Status = ResponseCode.Error;
                response.Message = ex.Message;

                await Logger.Error(ex, "Error in UserController.AddNewExperience");
                return PartialView(@"~/Views/User/ExperiencePartialView.cshtml", resumeDetails);
            }
        }
        [Route("AddNewEducation")]
        [OutputCache(Duration = 0)]
        public async Task<PartialViewResult> AddNewEducation(ResumeDataModel resumeDetails)
        {

            Response<long> response = new Response<long>
            {
                Data = -1
            };

            try
            {
                ModelState.Clear();

                //to remove unwanted item from list
                for (int i = 0; i < resumeDetails.EducationDetailsModel.Count; i++)
                {
                    if (!resumeDetails.EducationDetailsModel[i].IsActive)
                    {
                        resumeDetails.EducationDetailsModel.RemoveAt(i);
                    }
                }
                //

                resumeDetails.EducationDetailsModel.Add(new EducationDetailsModel
                {
                    IsActive = true
                });
                if (resumeDetails.ExperienceDetailsModel == null || resumeDetails.ExperienceDetailsModel.Count == 0)
                {
                    resumeDetails.ExperienceDetailsModel = new List<ExperienceDetailsModel>();
                }
                if (resumeDetails.SkillDetailsModel == null || resumeDetails.SkillDetailsModel.Count == 0)
                {
                    resumeDetails.SkillDetailsModel = new List<SkillDetailsModel>();
                }
                if (resumeDetails.HobbyDetailsModel == null || resumeDetails.HobbyDetailsModel.Count == 0)
                {
                    resumeDetails.HobbyDetailsModel = new List<HobbyDetailsModel>();
                }
                if (resumeDetails.LanguageDetailsModel == null || resumeDetails.LanguageDetailsModel.Count == 0)
                {
                    resumeDetails.LanguageDetailsModel = new List<LanguageDetailsModel>();
                }
                return PartialView(@"~/Views/User/EducationPartialView.cshtml", resumeDetails);
            }
            catch (Exception ex)
            {
                response.Status = ResponseCode.Error;
                response.Message = ex.Message;
                await Logger.Error(ex, "Error in UserController.AddNewEducation");
                return PartialView(@"~/Views/User/EducationPartialView.cshtml", resumeDetails);
            }
        }
        [Route("AddNewSkill")]
        [OutputCache(Duration = 0)]
        public async Task<PartialViewResult> AddNewSkill(ResumeDataModel resumeDetails)
        {

            Response<long> response = new Response<long>
            {
                Data = -1
            };

            try
            {
                ModelState.Clear();

                //to remove unwanted item from list
                for (int i = 0; i < resumeDetails.SkillDetailsModel.Count; i++)
                {
                    if (!resumeDetails.SkillDetailsModel[i].IsActive)
                    {
                        resumeDetails.SkillDetailsModel.RemoveAt(i);
                    }
                }
                //
                resumeDetails.SkillDetailsModel.Add(new SkillDetailsModel
                {
                    IsActive = true
                });
                if (resumeDetails.ExperienceDetailsModel == null || resumeDetails.ExperienceDetailsModel.Count == 0)
                {
                    resumeDetails.ExperienceDetailsModel = new List<ExperienceDetailsModel>();
                }
                if (resumeDetails.EducationDetailsModel == null || resumeDetails.EducationDetailsModel.Count == 0)
                {
                    resumeDetails.EducationDetailsModel = new List<EducationDetailsModel>();
                }
                if (resumeDetails.HobbyDetailsModel == null || resumeDetails.HobbyDetailsModel.Count == 0)
                {
                    resumeDetails.HobbyDetailsModel = new List<HobbyDetailsModel>();
                }
                if (resumeDetails.LanguageDetailsModel == null || resumeDetails.LanguageDetailsModel.Count == 0)
                {
                    resumeDetails.LanguageDetailsModel = new List<LanguageDetailsModel>();
                }
                return PartialView(@"~/Views/User/SkillsPartialView.cshtml", resumeDetails);
            }
            catch (Exception ex)
            {
                response.Status = ResponseCode.Error;
                response.Message = ex.Message;
                await Logger.Error(ex, "Error in UserController.AddNewSkill");
                return PartialView(@"~/Views/User/SkillsPartialView.cshtml", resumeDetails);
            }
        }
        [Route("AddNewHobby")]
        [OutputCache(Duration = 0)]
        public async Task<PartialViewResult> AddNewHobby(ResumeDataModel resumeDetails)
        {

            Response<long> response = new Response<long>
            {
                Data = -1
            };

            try
            {
                ModelState.Clear();

                //to remove unwanted item from list
                for (int i = 0; i < resumeDetails.HobbyDetailsModel.Count; i++)
                {
                    if (!resumeDetails.HobbyDetailsModel[i].IsActive)
                    {
                        resumeDetails.HobbyDetailsModel.RemoveAt(i);
                    }
                }
                //

                resumeDetails.HobbyDetailsModel.Add(new HobbyDetailsModel
                {
                    IsActive = true
                });
                if (resumeDetails.ExperienceDetailsModel == null || resumeDetails.ExperienceDetailsModel.Count == 0)
                {
                    resumeDetails.ExperienceDetailsModel = new List<ExperienceDetailsModel>();
                }
                if (resumeDetails.EducationDetailsModel == null || resumeDetails.EducationDetailsModel.Count == 0)
                {
                    resumeDetails.EducationDetailsModel = new List<EducationDetailsModel>();
                }
                if (resumeDetails.SkillDetailsModel == null || resumeDetails.SkillDetailsModel.Count == 0)
                {
                    resumeDetails.SkillDetailsModel = new List<SkillDetailsModel>();
                }
                if (resumeDetails.LanguageDetailsModel == null || resumeDetails.LanguageDetailsModel.Count == 0)
                {
                    resumeDetails.LanguageDetailsModel = new List<LanguageDetailsModel>();
                }
                return PartialView(@"~/Views/User/HobbyPartialView.cshtml", resumeDetails);
            }
            catch (Exception ex)
            {
                response.Status = ResponseCode.Error;
                response.Message = ex.Message;
                await Logger.Error(ex, "Error in UserController.AddNewHobby");
                return PartialView(@"~/Views/User/HobbyPartialView.cshtml", resumeDetails);
            }
        }
        [Route("AddNewLanguage")]
        [OutputCache(Duration = 0)]
        public async Task<PartialViewResult> AddNewLanguage(ResumeDataModel resumeDetails)
        {

            Response<long> response = new Response<long>
            {
                Data = -1
            };

            try
            {
                ModelState.Clear();

                //to remove unwanted item from list
                for (int i = 0; i < resumeDetails.LanguageDetailsModel.Count; i++)
                {
                    if (!resumeDetails.LanguageDetailsModel[i].IsActive)
                    {
                        resumeDetails.LanguageDetailsModel.RemoveAt(i);
                    }
                }
                //

                resumeDetails.LanguageDetailsModel.Add(new LanguageDetailsModel
                {
                    IsActive = true
                });
                if (resumeDetails.ExperienceDetailsModel == null || resumeDetails.ExperienceDetailsModel.Count == 0)
                {
                    resumeDetails.ExperienceDetailsModel = new List<ExperienceDetailsModel>();
                }
                if (resumeDetails.EducationDetailsModel == null || resumeDetails.EducationDetailsModel.Count == 0)
                {
                    resumeDetails.EducationDetailsModel = new List<EducationDetailsModel>();
                }
                if (resumeDetails.SkillDetailsModel == null || resumeDetails.SkillDetailsModel.Count == 0)
                {
                    resumeDetails.SkillDetailsModel = new List<SkillDetailsModel>();
                }
                if (resumeDetails.HobbyDetailsModel == null || resumeDetails.HobbyDetailsModel.Count == 0)
                {
                    resumeDetails.HobbyDetailsModel = new List<HobbyDetailsModel>();
                }
                return PartialView(@"~/Views/User/LanguagePartialView.cshtml", resumeDetails);
            }
            catch (Exception ex)
            {
                response.Status = ResponseCode.Error;
                response.Message = ex.Message;
                await Logger.Error(ex, "Error in UserController.AddNewLanguage");
                return PartialView(@"~/Views/User/LanguagePartialView.cshtml", resumeDetails);
            }
        }
        [HttpPost]
        [Route("ViewResume")]
        public async Task<ActionResult> ViewResume()
        {
            string response = await UserService.GetTemplatesDetailsByID(UserSessionDetails.UserDetails.UserID, UserSessionDetails.UserDetails.SelectedTemplateID);
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