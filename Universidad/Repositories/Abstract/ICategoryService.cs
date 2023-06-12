using Universidad.Models.Domain;
using Universidad.Models.DTO;

namespace Universidad.Repositories.Abstract
{
    public interface ICategoryService
    {
        bool Add(Category model);
        bool Update(Category model);
        Category GetById(int id);
        bool Delete(int id);

        IQueryable<Category> List();
    }
}
