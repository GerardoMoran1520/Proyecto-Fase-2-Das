using System.ComponentModel.DataAnnotations;

namespace Universidad.Models.Domain
{
    public class Presentation
    {
        public int Id { get; set; }
        [Required]
        public string? Vision { get; set; }

        public string? Mision { get; set; }
    }
}
