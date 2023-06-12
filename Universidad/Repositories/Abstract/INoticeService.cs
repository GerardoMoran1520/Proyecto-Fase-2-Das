using Universidad.Models.Domain;
using Universidad.Models.DTO;

namespace Universidad.Repositories.Abstract
{
    public interface INoticeService
    {
        bool Add(Notice model);
        bool Update(Notice model);
        Notice GetById(int id);
        bool Delete(int id);
        NoticeListVm List(string term = "", bool paging = false, int currentPage = 0);
        List<int> GetCatalogByNoticeId(int NoticeId);
    }
}
