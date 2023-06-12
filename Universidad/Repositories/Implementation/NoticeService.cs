using Universidad.Models.Domain;
using Universidad.Models.DTO;
using Universidad.Repositories.Abstract;

namespace Universidad.Repositories.Implementation
{
    public class NoticeService : INoticeService
    {
        private readonly DataBaseContext ctx;
        public NoticeService(DataBaseContext ctx)
        {
            this.ctx = ctx;
        }
        public bool Add(Notice model)
        {
            try
            {

                ctx.Notice.Add(model);
                ctx.SaveChanges();
                foreach (int catalogId in model.Catalogs)
                {
                    var noticeCatalog = new NoticeCatalog
                    {
                        NoticeId = model.Id,
                        CatalogId = catalogId
                    };
                    ctx.NoticeCatalog.Add(noticeCatalog);
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
                var noticeCatalogs = ctx.NoticeCatalog.Where(a => a.NoticeId == data.Id);
                foreach (var noticeCatalog in noticeCatalogs)
                {
                    ctx.NoticeCatalog.Remove(noticeCatalog);
                }
                ctx.Notice.Remove(data);
                ctx.SaveChanges();
                return true;
            }
            catch (Exception ex)
            {
                return false;
            }
        }

        public Notice GetById(int id)
        {
            return ctx.Notice.Find(id);
        }

        public NoticeListVm List(string term = "", bool paging = false, int currentPage = 0)
        {
            var data = new NoticeListVm();

            var list = ctx.Notice.ToList();


            if (!string.IsNullOrEmpty(term))
            {
                term = term.ToLower();
                list = list.Where(a => a.Occurrence.ToLower().StartsWith(term)).ToList();
            }

            if (paging)
            {
                // here we will apply paging
                int pageSize = 5;
                int count = list.Count;
                int TotalPages = (int)Math.Ceiling(count / (double)pageSize);
                list = list.Skip((currentPage - 1) * pageSize).Take(pageSize).ToList();
                data.PageSize1 = pageSize;
                data.CurrentPage1 = currentPage;
                data.TotalPages1 = TotalPages;
            }

            foreach (var notice in list)
            {
                var catalogs = (from catalog in ctx.Catalog
                              join mg in ctx.NoticeCatalog
                              on catalog.Id equals mg.CatalogId
                              where mg.NoticeId == notice.Id
                              select catalog.CatalogName
                              ).ToList();
                var catalogNames = string.Join(',', catalogs);
                notice.CatalogNames = catalogNames;
            }
            data.NoticeList = list.AsQueryable();
            return data;
        }

        public bool Update(Notice model)
        {
            try
            {
                // these CatalogIds are not selected by users and still present is movieCatalog table corresponding to
                // this movieId. So these ids should be removed.
                var catalogsToDeleted = ctx.NoticeCatalog.Where(a => a.NoticeId == model.Id && !model.Catalogs.Contains(a.CatalogId)).ToList();
                foreach (var mCatalog in catalogsToDeleted)
                {
                    ctx.NoticeCatalog.Remove(mCatalog);
                }
                foreach (int catId in model.Catalogs)
                {
                    var noticeCatalog = ctx.NoticeCatalog.FirstOrDefault(a => a.NoticeId == model.Id && a.CatalogId == catId);
                    if (noticeCatalog == null)
                    {
                        noticeCatalog = new NoticeCatalog { CatalogId = catId, NoticeId = model.Id };
                        ctx.NoticeCatalog.Add(noticeCatalog);
                    }
                }

                ctx.Notice.Update(model);
                // we have to add these Catalog ids in movieCatalog table
                ctx.SaveChanges();
                return true;
            }
            catch (Exception ex)
            {
                return false;
            }
        }

        public List<int> GetCatalogByNoticeId(int noticeId)
        {
            var catalogIds = ctx.NoticeCatalog.Where(a => a.NoticeId == noticeId).Select(a => a.CatalogId).ToList();
            return catalogIds;
        }

        

    }
}
