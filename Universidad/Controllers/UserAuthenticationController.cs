using Microsoft.AspNetCore.Mvc;
using Universidad.Models.DTO;
using Universidad.Repositories.Abstract;

namespace Universidad.Controllers
{
    public class UserAuthenticationController : Controller

    {

        private IUserAuthenticationService authService;
        public UserAuthenticationController(IUserAuthenticationService authService)
        {
            this.authService = authService;
        }
        //public async Task<IActionResult> Register()
        // {
        //var model = new RegistrationModel
        // {
        // Email = "udb@gmail.com",
        // Username = "UDB",
        //  Name = "UDB",
        //  Password = "Udb123.",
        // PasswordConfirm = "Udb123.",
        // Role = "Admin"
        // };

        // var result = await authService.RegisterAsync(model);
        //  return Ok(result.Message);
        // }
        public async Task<IActionResult> Login()
        {
            return View();
        }
        [HttpPost]

        public async Task<IActionResult> Login(LoginModel model)
        {
            if (!ModelState.IsValid)
                return View(model);

            var result = await authService.LoginAsync(model);
            if (result.StatusCode == 1)
                return RedirectToAction("Index", "Home");
            else
            {
                TempData["msg"] = "No se pudo iniciar sesión..";
                return RedirectToAction(nameof(Login));
            }
        }

        public async Task<IActionResult> Logout()
        {
            await authService.LogoutAsync();
            return RedirectToAction(nameof(Login));
        }


    }
}
