using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Universidad.Models.Domain;
using Universidad.Repositories.Abstract;

namespace Universidad.Controllers
{
    [Authorize]
    public class PresentationController : Controller
    {
        private readonly IPresentationService _presentationService;
        public PresentationController(IPresentationService presentationService)
        {
            _presentationService = presentationService;
        }
        public IActionResult Add()
        {
            return View();
        }

        [HttpPost]
        public IActionResult Add(Presentation model)
        {
            if (!ModelState.IsValid)
                return View(model);
            var result = _presentationService.Add(model);
            if (result)
            {
                TempData["msg"] = "Agregado exitosamente";
                return RedirectToAction(nameof(Add));
            }
            else
            {
                TempData["msg"] = "Error en el lado del servidor";
                return View(model);
            }
        }

        public IActionResult Edit(int id)
        {
            var data = _presentationService.GetById(id);
            return View(data);
        }

        [HttpPost]
        public IActionResult Update(Presentation model)
        {
            if (!ModelState.IsValid)
                return View(model);
            var result = _presentationService.Update(model);
            if (result)
            {
                TempData["msg"] = "Agregado exitosamente";
                return RedirectToAction(nameof(PresentationList));
            }
            else
            {
                TempData["msg"] = "Error en el lado del servidor";
                return View(model);
            }
        }

        public IActionResult PresentationList()
        {
            var data = this._presentationService.List().ToList();
            return View(data);
        }

        public IActionResult Delete(int id)
        {
            var result = _presentationService.Delete(id);
            return RedirectToAction(nameof(PresentationList));
        }



    }
}
