using CViewer.DataAccess.Entities;

namespace CViewer.DataAccess.Repositories
{
    internal sealed class CVRepository
    {
        public static List<CV> CVs = new()
        {
            new() { 
                Id = 1, 
                StatusId = CVStatusType.NeedFix,
                Title = ".NET Software Engineer", 
                Description = "2 года опыта работы на должности .NET Software Engineer. Помимо .NET владею SQL-подобными языками.", 
                Rating = 6.8,
                DateCreation = new DateTime(2022, 12, 1, 16, 13, 33),
                PeopleCreatedId = 2,
                ExpertIds = new List<int>() { 1 },
                Specialization = SpecializationRepository.Specializations.FirstOrDefault(o => o.Id == 1),            
                Tags = new List<CVTag>
                {
                    CVTagRepository.CVTags.FirstOrDefault(o => o.Id == 4),
                    CVTagRepository.CVTags.FirstOrDefault(o => o.Id == 1),
                },
            },

            new() { 
                Id = 2, 
                StatusId = CVStatusType.Finished,
                Title = "QA", 
                Description = "Тестирую программы на качество.", 
                Rating = 10.0,
                DateCreation = new DateTime(2022, 12, 05, 17, 05, 01),
                PeopleCreatedId = 3,
                ExpertIds = new List<int>() { 4 },
                Specialization = SpecializationRepository.Specializations.FirstOrDefault(o => o.Id == 3),            
                Tags = new List<CVTag>
                {
                    CVTagRepository.CVTags.FirstOrDefault(o => o.Id == 5),
                },
            },
        };
    }
}