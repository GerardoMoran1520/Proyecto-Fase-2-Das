using Universidad.Models.Domain;
using Universidad.Models.DTO;
using Universidad.Repositories.Abstract;

namespace Universidad.Repositories.Implementation
{
    public class CareerService : ICareerService
    {
        private readonly DataBaseContext ctx;
        public CareerService(DataBaseContext ctx)
        {
            this.ctx = ctx;
        }
        public bool Add(Career model)
        {
            try
            {

                ctx.Career.Add(model);
                ctx.SaveChanges();
                foreach (int categoryId in model.Categorys)
                {
                    var careerCategory = new CareerCategory
                    {
                        CareerId = model.Id,
                        CategoryId = categoryId
                    };
                    ctx.CareerCategory.Add(careerCategory);
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
                var careerCategorys = ctx.CareerCategory.Where(a => a.CareerId == data.Id);
                foreach (var careerCategory in careerCategorys)
                {
                    ctx.CareerCategory.Remove(careerCategory);
                }
                ctx.Career.Remove(data);
                ctx.SaveChanges();
                return true;
            }
            catch (Exception ex)
            {
                return false;
            }
        }

        public Career GetById(int id)
        {
            return ctx.Career.Find(id);
        }

        public CareerListVm List(string term = "", bool paging = false, int currentPage = 0)
        {
            var data = new CareerListVm();

            var list = ctx.Career.ToList();


            if (!string.IsNullOrEmpty(term))
            {
                term = term.ToLower();
                list = list.Where(a => a.Profession.ToLower().StartsWith(term)).ToList();
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

            foreach (var career in list)
            {
                var categorys = (from category in ctx.Category
                              join mg in ctx.CareerCategory
                              on category.Id equals mg.CategoryId
                              where mg.CareerId == career.Id
                              select category.CategoryName
                              ).ToList();
                var categoryNames = string.Join(',', categorys);
                career.CategoryNames = categoryNames;
            }
            data.CareerList = list.AsQueryable();
            return data;
        }

        public bool Update(Career model)
        {
            try
            {
                // these CategoryIds are not selected by users and still present is movieCategory table corresponding to
                // this movieId. So these ids should be removed.
                var categorysToDeleted = ctx.CareerCategory.Where(a => a.CareerId == model.Id && !model.Categorys.Contains(a.CategoryId)).ToList();
                foreach (var mCategory in categorysToDeleted)
                {
                    ctx.CareerCategory.Remove(mCategory);
                }
                foreach (int catId in model.Categorys)
                {
                    var careerCategory = ctx.CareerCategory.FirstOrDefault(a => a.CareerId == model.Id && a.CategoryId == catId);
                    if (careerCategory == null)
                    {
                        careerCategory = new CareerCategory { CategoryId = catId, CareerId = model.Id };
                        ctx.CareerCategory.Add(careerCategory);
                    }
                }

                ctx.Career.Update(model);
                // we have to add these Category ids in movieCategory table
                ctx.SaveChanges();
                return true;
            }
            catch (Exception ex)
            {
                return false;
            }
        }

        public List<int> GetCategoryByCareerId(int careerId)
        {
            var categoryIds = ctx.CareerCategory.Where(a => a.CareerId == careerId).Select(a => a.CategoryId).ToList();
            return categoryIds;
        }

        

    }
}
