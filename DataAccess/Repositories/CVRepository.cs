using CViewer.DataAccess.Entities;

namespace CViewer.DataAccess.Repositories
{
    internal sealed class CVRepository
    {
        public static List<CV> CVs = new()
        {
            new() { 
                Id = 1, 
                Title = "My fantasies", 
                Description = "Very dark and nice.", 
                Rating = 6.8,
                DateCreation = new DateTime(2022, 12, 1, 16, 13, 33),
                PeopleCreatedId = 2,
                ExpertIds = new List<int>() { 1 },
                Specialization = SpecializationRepository.Specializations.FirstOrDefault(o => o.Name.Equals("DataAnalyst")),            
                Tags = new List<CVTag>
                {
                    CVTagRepository.CVTags.FirstOrDefault(o => o.Name.Equals("SQL")),
                    CVTagRepository.CVTags.FirstOrDefault(o => o.Name.Equals("DotNet")),
                },
            },
        };
    }
}