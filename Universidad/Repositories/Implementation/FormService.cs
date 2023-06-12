using Universidad.Models.Domain;
using Universidad.Models.DTO;
using Universidad.Repositories.Abstract;

namespace Universidad.Repositories.Implementation
{
    public class FormService : IFormService
    {
        private readonly DataBaseContext ctx;
        public FormService(DataBaseContext ctx)
        {
            this.ctx = ctx;
        }
        public bool Add(Form model)
        {
            try
            {

                ctx.Form.Add(model);
                ctx.SaveChanges();
                foreach (int helpId in model.Helps)
                {
                    var formHelp = new FormHelp
                    {
                        FormId = model.Id,
                        HelpId = helpId
                    };
                    ctx.FormHelp.Add(formHelp);
                }
                ctx.SaveChanges();
                return true;
            }
            catch (Exception ex)
            {
                return false;
            }
        }

        public bool Delete(int id)
        {
            try
            {
                var data = this.GetById(id);
                if (data == null)
                    return false;
                var formHelps = ctx.FormHelp.Where(a => a.FormId == data.Id);
                foreach (var formHelp in formHelps)
                {
                    ctx.FormHelp.Remove(formHelp);
                }
                ctx.Form.Remove(data);
                ctx.SaveChanges();
                return true;
            }
            catch (Exception ex)
            {
                return false;
            }
        }

        public Form GetById(int id)
        {
            return ctx.Form.Find(id);
        }

        public FormListVm List(string term = "", bool paging = false, int currentPage = 0)
        {
            var data = new FormListVm();

            var list = ctx.Form.ToList();


            if (!string.IsNullOrEmpty(term))
            {
                term = term.ToLower();
                list = list.Where(a => a.Question.ToLower().StartsWith(term)).ToList();
            }

            if (paging)
            {
                // here we will apply paging
                int pageSize = 5;
                int count = list.Count;
                int TotalPages = (int)Math.Ceiling(count / (double)pageSize);
                list = list.Skip((currentPage - 1) * pageSize).Take(pageSize).ToList();
                data.PageSize = pageSize;
                data.CurrentPage = currentPage;
                data.TotalPages = TotalPages;
            }

            foreach (var form in list)
            {
                var helps = (from help in ctx.Help
                              join mg in ctx.FormHelp
                              on help.Id equals mg.HelpId
                              where mg.FormId == form.Id
                              select help.HelpName
                              ).ToList();
                var helpNames = string.Join(',', helps);
                form.HelpNames = helpNames;
            }
            data.FormList = list.AsQueryable();
            return data;
        }

        public bool Update(Form model)
        {
            try
            {
                // these HelpIds are not selected by users and still present is movieHelp table corresponding to
                // this movieId. So these ids should be removed.
                var helpsToDeleted = ctx.FormHelp.Where(a => a.FormId == model.Id && !model.Helps.Contains(a.HelpId)).ToList();
                foreach (var mHelp in helpsToDeleted)
                {
                    ctx.FormHelp.Remove(mHelp);
                }
                foreach (int hepId in model.Helps)
                {
                    var formHelp = ctx.FormHelp.FirstOrDefault(a => a.FormId == model.Id && a.HelpId == hepId);
                    if (formHelp == null)
                    {
                        formHelp = new FormHelp { HelpId = hepId, FormId = model.Id };
                        ctx.FormHelp.Add(formHelp);
                    }
                }

                ctx.Form.Update(model);
                // we have to add these Help ids in movieHelp table
                ctx.SaveChanges();
                return true;
            }
            catch (Exception ex)
            {
                return false;
            }
        }

        public List<int> GetHelpByFormId(int formId)
        {
            var helpIds = ctx.FormHelp.Where(a => a.FormId == formId).Select(a => a.HelpId).ToList();
            return helpIds;
        }

        

    }
}
