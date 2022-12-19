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
             new Specialization()
            {
                Id = 5,
                Name = "DevOps engineer"
            },
            new Specialization()
            {
                Id = 6,
                Name = "UX/UI Designer"
            },
            new Specialization()
            {
                Id = 7,
                Name = "Data Science"
            },
            new Specialization()
            {
                Id = 8,
                Name = "SMM Manager"
            },
            new Specialization()
            {
                Id = 9,
                Name = "Frontend Developer"
            },
            new Specialization()
            {
                Id = 10,
                Name = "Backend Developer"
            },
        };
    }
}
