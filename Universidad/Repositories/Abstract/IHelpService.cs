using Universidad.Models.Domain;
using Universidad.Models.DTO;

namespace Universidad.Repositories.Abstract
{
    public interface IHelpService
    {
        bool Add(Help model);
        bool Update(Help model);
        Help GetById(int id);
        bool Delete(int id);

        IQueryable<Help> List();
    }
}
