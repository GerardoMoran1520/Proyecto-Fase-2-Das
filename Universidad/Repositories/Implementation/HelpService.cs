

using Universidad.Models.Domain;
using Universidad.Repositories.Abstract;

namespace Universidad.Repositories.Implementation
{
    public class HelpService : IHelpService
    {
        private readonly DataBaseContext ctx;
        public HelpService(DataBaseContext ctx)
        {
            this.ctx = ctx;
        }
        public bool Add(Help model)
        {
            try
            {
                ctx.Help.Add(model);
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
                ctx.Help.Remove(data);
                ctx.SaveChanges();
                return true;
            }
            catch (Exception ex)
            {
                return false;
            }
        }

        public Help GetById(int id)
        {
            return ctx.Help.Find(id);
        }

        public IQueryable<Help> List()
        {
            var data = ctx.Help.AsQueryable();
            return data;
        }

        public bool Update(Help model)
        {
            try
            {
                ctx.Help.Update(model);
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
