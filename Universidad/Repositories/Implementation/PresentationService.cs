

using Universidad.Models.Domain;
using Universidad.Repositories.Abstract;

namespace Universidad.Repositories.Implementation
{
    public class PresentationService : IPresentationService
    {
        private readonly DataBaseContext ctx;
        public PresentationService(DataBaseContext ctx)
        {
            this.ctx = ctx;
        }
        public bool Add(Presentation model)
        {
            try
            {
                ctx.Presenation.Add(model);
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
                ctx.Presenation.Remove(data);
                ctx.SaveChanges();
                return true;
            }
            catch (Exception ex)
            {
                return false;
            }
        }

        public Presentation GetById(int id)
        {
            return ctx.Presenation.Find(id);
        }

        public IQueryable<Presentation> List()
        {
            var data = ctx.Presenation.AsQueryable();
            return data;
        }

        public bool Update(Presentation model)
        {
            try
            {
                ctx.Presenation.Update(model);
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
