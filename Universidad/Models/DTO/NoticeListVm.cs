using Universidad.Models.Domain;

namespace Universidad.Models.DTO
{
    public class NoticeListVm
    {
        public IQueryable<Notice> NoticeList { get; set; }
        public int PageSize1 { get; set; }
        public int CurrentPage1 { get; set; }
        public int TotalPages1 { get; set; }
        public string? Term1 { get; set; }
    }
}
