using CViewer.DataAccess.Entities;

namespace CViewer.DataAccess.Repositories
{
    internal sealed class SpecializationRepository
    {
        public static List<Specialization> Specializations = new()
        {
            new Specialization()
            {
                Id = 1,
                Name = "Software Engineer"
            },
            new Specialization()
            {
                Id = 2,
                Name = "Data Analyst"
            },
            new Specialization()
            {
                Id = 3,
                Name = "QA"
            },
            new Specialization()
            {
                Id = 4,
                Name = "Database"
            },
        };
    }
}