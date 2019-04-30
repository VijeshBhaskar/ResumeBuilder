using Microsoft.AspNetCore.Mvc;
using System.Collections.Generic;
using ResumeBuilder.Models;

namespace ResumeBuilder.Controllers
{
  public class ResumesController : Controller
  {

    [HttpPost("/resume")]
    public ActionResult CreateResume(string name, int birthyear, string email, string phone, string city, string career, string state)
    {
      Resume myResume = new Resume(name, birthyear, email, phone, city, career, state);
      return View("Display", myResume);
    }

    [HttpGet("/resume")]
    public ActionResult Display(Resume resume)
    {
      return View(resume);
    }

  }
}
