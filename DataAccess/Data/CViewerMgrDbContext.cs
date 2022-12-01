using CViewer.DataAccess.Entities;
using Microsoft.EntityFrameworkCore;

namespace CViewer.DataAccess.Data
{
    /// <summary>
    /// ToDo: Miron, perhaps, we should use ORM here and in other places.
    /// </summary>
    public class CViewerMgrDbContext : DbContext
    {
        public CViewerMgrDbContext(DbContextOptions<CViewerMgrDbContext> options)
            : base(options) { }

        public DbSet<CV> CVs => Set<CV>();
        public DbSet<Profile> Profiles => Set<Profile>();
        public DbSet<Report> Reports => Set<Report>();
        public DbSet<UserCredentials> UserCredentials => Set<UserCredentials>();
    }
}