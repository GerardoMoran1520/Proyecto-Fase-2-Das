using Universidad.Models.Domain;
using Universidad.Models.DTO;

namespace Universidad.Repositories.Abstract
{
    public interface ICareerService
    {
        bool Add(Career model);
        bool Update(Career model);
        Career GetById(int id);
        bool Delete(int id);
        CareerListVm List(string term = "", bool paging = false, int currentPage = 0);
        List<int> GetCategoryByCareerId(int careerId);
    }
}
