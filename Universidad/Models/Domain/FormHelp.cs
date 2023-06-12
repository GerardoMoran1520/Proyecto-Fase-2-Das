using System.ComponentModel.DataAnnotations;

namespace Universidad.Models.Domain
{
    public class FormHelp
    {
        public int Id { get; set; }
        public int FormId { get; set; }
        public int HelpId { get; set; }
    }
}
