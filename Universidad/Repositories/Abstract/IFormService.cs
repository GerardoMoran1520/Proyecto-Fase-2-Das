using Universidad.Models.Domain;
using Universidad.Models.DTO;

namespace Universidad.Repositories.Abstract
{
    public interface IFormService
    {
        bool Add(Form model);
        bool Update(Form model);
        Form GetById(int id);
        bool Delete(int id);
        FormListVm List(string term = "", bool paging = false, int currentPage = 0);
        List<int> GetHelpByFormId(int formId);
    }
}
