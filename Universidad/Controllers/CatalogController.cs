using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Universidad.Models.Domain;
using Universidad.Repositories.Abstract;

namespace Universidad.Controllers
{
    [Authorize]
    public class CatalogController : Controller
    {
        private readonly ICatalogService _catalogService;
        public CatalogController(ICatalogService catalogService)
        {
            _catalogService = catalogService;
        }
        public IActionResult Add()
        {
            return View();
        }

        [HttpPost]
        public IActionResult Add(Catalog model)
        {
            if (!ModelState.IsValid)
                return View(model);
            var result = _catalogService.Add(model);
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
            var data = _catalogService.GetById(id);
            return View(data);
        }

        [HttpPost]
        public IActionResult Update(Catalog model)
        {
            if (!ModelState.IsValid)
                return View(model);
            var result = _catalogService.Update(model);
            if (result)
            {
                TempData["msg"] = "Agregado exitosamente";
                return RedirectToAction(nameof(CatalogList));
            }
            else
            {
                TempData["msg"] = "Error en el lado del servidor";
                return View(model);
            }
        }

        public IActionResult CatalogList()
        {
            var data = this._catalogService.List().ToList();
            return View(data);
        }

        public IActionResult Delete(int id)
        {
            var result = _catalogService.Delete(id);
            return RedirectToAction(nameof(CatalogList));
        }



    }
}
