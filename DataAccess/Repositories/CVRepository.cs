using CViewer.DataAccess.Entities;

namespace CViewer.DataAccess.Repositories
{
    internal sealed class CVRepository
    {
        public static List<CV> CVs = new()
        {
            new(1) { 
                StatusId = CVStatusType.NeedFix,
                Title = ".NET Software Engineer", 
                Description = "2 года опыта работы на должности .NET Software Engineer. Помимо .NET владею SQL-подобными языками.", 
                Grade = 3,
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

            new(2) { 
                StatusId = CVStatusType.Finished,
                Title = "QA", 
                Description = "Тестирую программы на качество.", 
                Grade = 5,
                DateCreation = new DateTime(2022, 12, 05, 17, 05, 01),
                PeopleCreatedId = 3,
                ExpertIds = new List<int>() { 4 },
                Specialization = SpecializationRepository.Specializations.FirstOrDefault(o => o.Id == 3),            
                Tags = new List<CVTag>
                {
                    CVTagRepository.CVTags.FirstOrDefault(o => o.Id == 5),
                },
            },

            new(3) { 
                StatusId = CVStatusType.Finished,
                Title = "Flutter developer", 
                Description = "Разработка ПО.", 
                Grade = 5,
                DateCreation = new DateTime(2022, 12, 07, 13, 01, 01),
                PeopleCreatedId = 2,
                ExpertIds = new List<int>() { 1 },
                Specialization = SpecializationRepository.Specializations.FirstOrDefault(o => o.Id == 1),            
                Tags = new List<CVTag>
                {
                    CVTagRepository.CVTags.FirstOrDefault(o => o.Id == 3),
                },
                GoodCv = true,
                PinnedFileName = "my_cv_flutter.pdf",
                UrlFileForDownload = "https://da728kfevltdk.cloudfront.net/hi.txt",
            },

            new(4) { 
                StatusId = CVStatusType.Finished,
                Title = "Database developer", 
                Description = "Разработка баз данных.", 
                Grade = 5,
                DateCreation = new DateTime(2022, 12, 06, 19, 15, 01),
                PeopleCreatedId = 2,
                ExpertIds = new List<int>() { 1 },
                Specialization = SpecializationRepository.Specializations.FirstOrDefault(o => o.Id == 4),            
                Tags = new List<CVTag>
                {
                    CVTagRepository.CVTags.FirstOrDefault(o => o.Id == 4),
                },
                GoodCv = true,
                PinnedFileName = "my_cv_database.pdf",
                UrlFileForDownload = "https://da728kfevltdk.cloudfront.net/qqq.zip",
            },

            new(5) { 
                StatusId = CVStatusType.SentToReview,
                Title = "Java", 
                Description = "Разработка ПО на java.",            
                DateCreation = new DateTime(2022, 12, 08, 18, 25, 01),
                PeopleCreatedId = 2,
                ExpertIds = new List<int>() { 1 },
                Specialization = SpecializationRepository.Specializations.FirstOrDefault(o => o.Id == 1),            
                Tags = new List<CVTag>
                {
                    CVTagRepository.CVTags.FirstOrDefault(o => o.Id == 2),
                },
                OpenToReview = true,
            },
            
            new(6) { 
                StatusId = CVStatusType.Finished,
                Title = "Frontend Developer", 
                Description = "Разработка на React", 
                Grade = 5,
                DateCreation = new DateTime(2022, 12, 20, 18, 25, 01),
                PeopleCreatedId = 5,
                ExpertIds = new List<int>() { 4 },
                Specialization = SpecializationRepository.Specializations.FirstOrDefault(o => o.Id == 9),            
                Tags = new List<CVTag>
                {
                    CVTagRepository.CVTags.FirstOrDefault(o => o.Id == 9),
                    CVTagRepository.CVTags.FirstOrDefault(o => o.Id == 4),
                    CVTagRepository.CVTags.FirstOrDefault(o => o.Id == 6),
                },
                GoodCv = true,
            },            
        };
    }
}
