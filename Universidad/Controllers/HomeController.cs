using Microsoft.AspNetCore.Mvc;
using Universidad.Repositories.Abstract;

namespace Universidad.Controllers
{
    public class HomeController : Controller
    {


        private readonly INoticeService _NoticeService;
        public HomeController (INoticeService NoticeService)
        {
            _NoticeService = NoticeService;
        }
        public IActionResult Index(string term = "", int currentPage = 1)
        {
            var Notices = _NoticeService.List(term, true, currentPage);
            return View(Notices);
        }

        public IActionResult NoticeDetail(int NoticeId)
        {
            var Notice = _NoticeService.GetById(NoticeId);
            return View(Notice);
        }



    }
}
