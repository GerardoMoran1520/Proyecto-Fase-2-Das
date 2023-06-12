using Universidad.Models.Domain;

namespace Universidad.Models.DTO
{
    public class FormListVm
    {
        public IQueryable<Form> FormList { get; set; }
        public int PageSize { get; set; }
        public int CurrentPage { get; set; }
        public int TotalPages { get; set; }
        public string? Term { get; set; }
    }
}
