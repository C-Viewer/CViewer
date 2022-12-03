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
                Name = "SoftwareEngineer"
            },
            new Specialization()
            {
                Id = 2,
                Name = "DataAnalyst"
            },
        };
    }
}