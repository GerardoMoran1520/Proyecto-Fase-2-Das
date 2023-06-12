using Universidad.Models.Domain;
using Universidad.Models.DTO;

namespace Universidad.Repositories.Abstract
{
    public interface IPresentationService
    {
        bool Add(Presentation model);
        bool Update(Presentation model);
        Presentation GetById(int id);
        bool Delete(int id);

        IQueryable<Presentation> List();
    }
}
