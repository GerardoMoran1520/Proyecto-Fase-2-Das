using Microsoft.AspNetCore.Mvc;
using Universidad.Repositories.Abstract;

namespace Universidad.Controllers
{
    public class ProfessionController : Controller
    {
        private readonly ICareerService _CareerService;
        public ProfessionController(ICareerService CareerService)
        {
            _CareerService = CareerService;
        }
        public IActionResult Carrers(string term = "", int currentPage = 1)
        {
            var Careers = _CareerService.List(term, true, currentPage);
            return View(Careers);
        }

        public IActionResult CareerDetail(int CareerId)
        {
            var Career = _CareerService.GetById(CareerId);
            return View(Career);
        }
    }
}
