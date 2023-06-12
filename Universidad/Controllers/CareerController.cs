using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc.Rendering;
using Universidad.Repositories.Abstract;
using Universidad.Models.Domain;

namespace Universidad.Controllers
{
    [Authorize]
    public class CareerController : Controller
    {
        private readonly ICareerService _CareerService;
        private readonly IFileService _fileService;
        private readonly ICategoryService _cateService;
        public CareerController(ICategoryService catService, ICareerService CareerService, IFileService fileService)
        {
            _CareerService = CareerService;
            _fileService = fileService;
            _cateService = catService;
        }
        public IActionResult Add()
        {
            var model = new Career();
            model.CategoryList = _cateService.List().Select(a => new SelectListItem { Text = a.CategoryName, Value = a.Id.ToString() });
            return View(model);
        }

        [HttpPost]
        public IActionResult Add(Career model)
        {
            model.CategoryList = _cateService.List().Select(a => new SelectListItem { Text = a.CategoryName, Value = a.Id.ToString() });
            if (!ModelState.IsValid)
                return View(model);
            if (model.ImageFile != null)
            {
                var fileReult = this._fileService.SaveImage(model.ImageFile);
                if (fileReult.Item1 == 0)
                {
                    TempData["msg"] = "No se pudo guardar el archivo";
                    return View(model);
                }
                var imageName = fileReult.Item2;
                model.CareerImage = imageName;
            }
            var result = _CareerService.Add(model);
            if (result)
            {
                TempData["msg"] = "Añadido Exitosamente";
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
            var model = _CareerService.GetById(id);
            var selectedCategorys = _CareerService.GetCategoryByCareerId(model.Id);
            MultiSelectList multiCategoryList = new MultiSelectList(_cateService.List(), "Id", "CategoryName", selectedCategorys);
            model.MultiCategoryList = multiCategoryList;
            return View(model);
        }

        [HttpPost]
        public IActionResult Edit(Career model)
        {
            var selectedCategorys = _CareerService.GetCategoryByCareerId(model.Id);
            MultiSelectList multiCategoryList = new MultiSelectList(_cateService.List(), "Id", "CategoryName", selectedCategorys);
            model.MultiCategoryList = multiCategoryList;
            if (!ModelState.IsValid)
                return View(model);
            if (model.ImageFile != null)
            {
                var fileReult = this._fileService.SaveImage(model.ImageFile);
                if (fileReult.Item1 == 0)
                {
                    TempData["msg"] = "No se pudo guardar el archivo";
                    return View(model);
                }
                var imageName = fileReult.Item2;
                model.CareerImage = imageName;
            }
            var result = _CareerService.Update(model);
            if (result)
            {
                TempData["msg"] = "Añadido Exitosamente";
                return RedirectToAction(nameof(CareerList));
            }
            else
            {
                TempData["msg"] = "Error en el lado del servidor";
                return View(model);
            }
        }

        public IActionResult CareerList()
        {
            var data = this._CareerService.List();
            return View(data);
        }

        public IActionResult Delete(int id)
        {
            var result = _CareerService.Delete(id);
            return RedirectToAction(nameof(CareerList));
        }



    }
}
