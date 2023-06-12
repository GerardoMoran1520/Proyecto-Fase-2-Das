using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc.Rendering;
using Universidad.Repositories.Abstract;
using Universidad.Models.Domain;

namespace Universidad.Controllers
{
    [Authorize]
    public class NoticeController : Controller
    {
        private readonly INoticeService _NoticeService;
        private readonly IFileService _fileService;
        private readonly ICatalogService _cateService;
        public NoticeController(ICatalogService catService, INoticeService NoticeService, IFileService fileService)
        {
            _NoticeService = NoticeService;
            _fileService = fileService;
            _cateService = catService;
        }
        public IActionResult Add()
        {
            var model = new Notice();
            model.CatalogList = _cateService.List().Select(a => new SelectListItem { Text = a.CatalogName, Value = a.Id.ToString() });
            return View(model);
        }

        [HttpPost]
        public IActionResult Add(Notice model)
        {
            model.CatalogList = _cateService.List().Select(a => new SelectListItem { Text = a.CatalogName, Value = a.Id.ToString() });
            if (!ModelState.IsValid)
                return View(model);
            if (model.ImageFile1 != null)
            {
                var fileReult = this._fileService.SaveImage(model.ImageFile1);
                if (fileReult.Item1 == 0)
                {
                    TempData["msg"] = "No se pudo guardar el archivo";
                    return View(model);
                }
                var imageName = fileReult.Item2;
                model.OccurrenceImage = imageName;
            }
            var result = _NoticeService.Add(model);
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
            var model = _NoticeService.GetById(id);
            var selectedCatalogs = _NoticeService.GetCatalogByNoticeId(model.Id);
            MultiSelectList multiCatalogList = new MultiSelectList(_cateService.List(), "Id", "CatalogName", selectedCatalogs);
            model.MultiCatalogList = multiCatalogList;
            return View(model);
        }

        [HttpPost]
        public IActionResult Edit(Notice model)
        {
            var selectedCatalogs = _NoticeService.GetCatalogByNoticeId(model.Id);
            MultiSelectList multiCatalogList = new MultiSelectList(_cateService.List(), "Id", "CatalogName", selectedCatalogs);
            model.MultiCatalogList = multiCatalogList;
            if (!ModelState.IsValid)
                return View(model);
            if (model.ImageFile1 != null)
            {
                var fileReult = this._fileService.SaveImage(model.ImageFile1);
                if (fileReult.Item1 == 0)
                {
                    TempData["msg"] = "No se pudo guardar el archivo";
                    return View(model);
                }
                var imageName = fileReult.Item2;
                model.OccurrenceImage = imageName;
            }
            var result = _NoticeService.Update(model);
            if (result)
            {
                TempData["msg"] = "Añadido Exitosamente";
                return RedirectToAction(nameof(NoticeList));
            }
            else
            {
                TempData["msg"] = "Error en el lado del servidor";
                return View(model);
            }
        }

        public IActionResult NoticeList()
        {
            var data = this._NoticeService.List();
            return View(data);
        }

        public IActionResult Delete(int id)
        {
            var result = _NoticeService.Delete(id);
            return RedirectToAction(nameof(NoticeList));
        }



    }
}
