using Microsoft.AspNetCore.Identity.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore;

namespace Universidad.Models.Domain
{
    public class DataBaseContext : IdentityDbContext<ApplicationUser>
    {
        public DataBaseContext(DbContextOptions<DataBaseContext> options) : base(options)
        {

        }

        public DbSet<Help> Help { get; set; }
        public DbSet<FormHelp> FormHelp { get; set; }
        public DbSet<Form> Form { get; set; }


        public DbSet<Category> Category { get; set; }
        public DbSet<CareerCategory> CareerCategory { get; set; }
        public DbSet<Career> Career { get; set; }

        public DbSet<Catalog> Catalog { get; set; }
        public DbSet<NoticeCatalog> NoticeCatalog { get; set; }
        public DbSet<Notice> Notice { get; set; }

        public DbSet<Presentation> Presenation { get; set; }

    }

  
}
