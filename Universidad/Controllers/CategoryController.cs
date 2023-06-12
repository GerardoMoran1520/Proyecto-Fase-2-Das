using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Universidad.Models.Domain;
using Universidad.Repositories.Abstract;

namespace Universidad.Controllers
{
    [Authorize]
    public class CategoryController : Controller
    {
        private readonly ICategoryService _categoryService;
        public CategoryController(ICategoryService categoryService)
        {
            _categoryService = categoryService;
        }
        public IActionResult Add()
        {
            return View();
        }

        [HttpPost]
        public IActionResult Add(Category model)
        {
            if (!ModelState.IsValid)
                return View(model);
            var result = _categoryService.Add(model);
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
            var data = _categoryService.GetById(id);
            return View(data);
        }

        [HttpPost]
        public IActionResult Update(Category model)
        {
            if (!ModelState.IsValid)
                return View(model);
            var result = _categoryService.Update(model);
            if (result)
            {
                TempData["msg"] = "Agregado exitosamente";
                return RedirectToAction(nameof(CategoryList));
            }
            else
            {
                TempData["msg"] = "Error en el lado del servidor";
                return View(model);
            }
        }

        public IActionResult CategoryList()
        {
            var data = this._categoryService.List().ToList();
            return View(data);
        }

        public IActionResult Delete(int id)
        {
            var result = _categoryService.Delete(id);
            return RedirectToAction(nameof(CategoryList));
        }



    }
}
