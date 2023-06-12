using Universidad.Models.Domain;
using Universidad.Models.DTO;

namespace Universidad.Repositories.Abstract
{
    public interface ICatalogService
    {
        bool Add(Catalog model);
        bool Update(Catalog model);
        Catalog GetById(int id);
        bool Delete(int id);

        IQueryable<Catalog> List();
    }
}
