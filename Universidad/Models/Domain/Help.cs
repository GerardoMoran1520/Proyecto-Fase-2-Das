using System.ComponentModel.DataAnnotations;

namespace Universidad.Models.Domain
{
    public class Help
    {
        public int Id { get; set; }
        [Required]
        public string? HelpName { get; set; }
    }
}
