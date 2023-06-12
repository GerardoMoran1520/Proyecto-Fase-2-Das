using Microsoft.AspNetCore.Mvc.Rendering;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace Universidad.Models.Domain
{
    public class Career
    {
        public int Id { get; set; }
        [Required]
        public string? Profession { get; set; }

       
        public string? CareerImage { get; set; } 
       
        
        [Required]
        public string? Descripcion { get; set; }

        [NotMapped]
        public IFormFile? ImageFile { get; set; }
        [NotMapped]
        [Required]
        public List<int>? Categorys { get; set; }
        [NotMapped]
        public IEnumerable<SelectListItem>? CategoryList { get; set; }
        [NotMapped]
        public string? CategoryNames { get; set; }

        [NotMapped]
        public MultiSelectList? MultiCategoryList { get; set; }
    }
}
