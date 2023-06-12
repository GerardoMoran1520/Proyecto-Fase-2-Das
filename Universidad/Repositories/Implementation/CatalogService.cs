

using Universidad.Models.Domain;
using Universidad.Repositories.Abstract;

namespace Universidad.Repositories.Implementation
{
    public class CatalogService : ICatalogService
    {
        private readonly DataBaseContext ctx;
        public CatalogService(DataBaseContext ctx)
        {
            this.ctx = ctx;
        }
        public bool Add(Catalog model)
        {
            try
            {
                ctx.Catalog.Add(model);
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
                ctx.Catalog.Remove(data);
                ctx.SaveChanges();
                return true;
            }
            catch (Exception ex)
            {
                return false;
            }
        }

        public Catalog GetById(int id)
        {
            return ctx.Catalog.Find(id);
        }

        public IQueryable<Catalog> List()
        {
            var data = ctx.Catalog.AsQueryable();
            return data;
        }

        public bool Update(Catalog model)
        {
            try
            {
                ctx.Catalog.Update(model);
                ctx.SaveChanges();
                return true;
            }
            catch (Exception ex)
            {
                return false;
            }
        }
    }
}
