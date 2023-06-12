using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc.Rendering;
using Universidad.Repositories.Abstract;
using Universidad.Models.Domain;

namespace Universidad.Controllers
{
    public class FormController : Controller
    {
        private readonly IFormService _formService;
        
        private readonly IHelpService _hepService;
        public FormController(IHelpService hepService, IFormService FormService)
        {
            _formService = FormService;
          
            _hepService = hepService;
        }
        public IActionResult Add()
        {
            var model = new Form();
            model.HelpList = _hepService.List().Select(a => new SelectListItem { Text = a.HelpName, Value = a.Id.ToString() });
            return View(model);
        }

        [HttpPost]
        public IActionResult Add(Form model)
        {
            model.HelpList = _hepService.List().Select(a => new SelectListItem { Text = a.HelpName, Value = a.Id.ToString() });
            if (!ModelState.IsValid)
                return View(model);
         
            var result = _formService.Add(model);
            if (result)
            {
                TempData["msg"] = "Agregado Exitosamente";
                return RedirectToAction(nameof(Add));
            }
            else
            {
                TempData["msg"] = "Error en el lado del servidor";
                return View(model);
            }
        }



        public IActionResult FormList()
        {
            var data = this._formService.List();
            return View(data);
        }

        public IActionResult Delete(int id)
        {
            var result = _formService.Delete(id);
            return RedirectToAction(nameof(FormList));
        }


    }
}
