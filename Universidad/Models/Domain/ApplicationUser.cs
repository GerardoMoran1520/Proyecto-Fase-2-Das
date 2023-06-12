using Microsoft.AspNetCore.Identity;

namespace Universidad.Models.Domain
{
    public class ApplicationUser : IdentityUser
    {
        public string Name { get; set; }
    }
}
