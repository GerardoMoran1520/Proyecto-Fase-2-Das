using Universidad.Models.Domain;

namespace Universidad.Models.DTO
{
    public class CareerListVm
    {
        public IQueryable<Career> CareerList { get; set; }
        public int PageSize { get; set; }
        public int CurrentPage { get; set; }
        public int TotalPages { get; set; }
        public string? Term { get; set; }
    }
}
