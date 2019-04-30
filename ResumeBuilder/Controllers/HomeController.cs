using Microsoft.AspNetCore.Mvc;

namespace ResumeBuilder.Controllers
{
  public class HomeController : Controller
  {
    [Route("/")]
    public ActionResult Home() { return View(); }

  }
}
