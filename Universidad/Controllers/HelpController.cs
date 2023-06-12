using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Universidad.Models.Domain;
using Universidad.Repositories.Abstract;

namespace Universidad.Controllers
{
    [Authorize]
    public class HelpController : Controller
    {
        private readonly IHelpService _helpService;
        public HelpController(IHelpService helpService)
        {
            _helpService = helpService;
        }
        public IActionResult Add()
        {
            return View();
        }

        [HttpPost]
        public IActionResult Add(Help model)
        {
            if (!ModelState.IsValid)
                return View(model);
            var result = _helpService.Add(model);
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
            var data = _helpService.GetById(id);
            return View(data);
        }

        [HttpPost]
        public IActionResult Update(Help model)
        {
            if (!ModelState.IsValid)
                return View(model);
            var result = _helpService.Update(model);
            if (result)
            {
                TempData["msg"] = "Agregado exitosamente";
                return RedirectToAction(nameof(HelpList));
            }
            else
            {
                TempData["msg"] = "Error en el lado del servidor";
                return View(model);
            }
        }

        public IActionResult HelpList()
        {
            var data = this._helpService.List().ToList();
            return View(data);
        }

        public IActionResult Delete(int id)
        {
            var result = _helpService.Delete(id);
            return RedirectToAction(nameof(HelpList));
        }



    }
}
