using System.ComponentModel.DataAnnotations;

namespace Universidad.Models.Domain
{
    public class Catalog
    {
        public int Id { get; set; }
        [Required]
        public string? CatalogName { get; set; }
    }
}
