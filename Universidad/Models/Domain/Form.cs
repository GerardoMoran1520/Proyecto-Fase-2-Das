using Microsoft.AspNetCore.Mvc.Rendering;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;


namespace Universidad.Models.Domain
{
    public class Form
    {
        public int Id { get; set; }
        [Required]
        public string? Email { get; set;}

        [Required]
        public string? Question { get; set; }

        [NotMapped]
        [Required]
        public List<int>? Helps { get; set; }
        [NotMapped]
        public IEnumerable<SelectListItem>? HelpList { get; set; }
        [NotMapped]
        public string? HelpNames { get; set; }

        [NotMapped]
        public MultiSelectList? MultiHelpList { get; set; }
    }
}
