using Microsoft.AspNetCore.Mvc.Rendering;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace Universidad.Models.Domain
{
    public class Notice
    {
        public int Id { get; set; }
        [Required]
        public string? Occurrence { get; set; }


        public string? OccurrenceImage { get; set; }


        [Required]
        public string? Descripcion1 { get; set; }

        [Required]
        public string? Publicationdate { get; set; }

        [NotMapped]
        public IFormFile? ImageFile1 { get; set; }
        [NotMapped]
        [Required]
        public List<int>? Catalogs { get; set; }
        [NotMapped]
        public IEnumerable<SelectListItem>? CatalogList { get; set; }
        [NotMapped]
        public string? CatalogNames { get; set; }

        [NotMapped]
        public MultiSelectList? MultiCatalogList { get; set; }
    }
}
