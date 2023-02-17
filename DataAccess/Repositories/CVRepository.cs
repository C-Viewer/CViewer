using CViewer.DataAccess.Entities;

namespace CViewer.DataAccess.Repositories
{
    internal sealed class CVRepository
    {
        public static List<Cv> CVs = new()
        {
            new() {
                Status = CVStatusRepository.Statuses.Where(s => s.Name == CVStatusType.TakenToReview).FirstOrDefault(),
                Title = ".NET Software Engineer",
                Description = "2 года опыта работы на должности .NET Software Engineer. Помимо .NET владею SQL-подобными языками.",
                Grade = 3,
                DateCreation = new DateTime(2022, 12, 1, 16, 13, 33),
                PeopleCreatedId = 2,
                //Profiles = new List<Profile>{ ProfileRepository.Profiles.FirstOrDefault(o => o.Id == 4)},
                //Specialization = SpecializationRepository.Specializations.FirstOrDefault(o => o.Id == 1),
                //Tags = new List<Tag>
                //{
                //    CVTagRepository.CVTags.FirstOrDefault(o => o.Id == 4),
                //    CVTagRepository.CVTags.FirstOrDefault(o => o.Id == 1),
                //},
            },

            new() {
                Status = CVStatusRepository.Statuses.Where(s => s.Name == CVStatusType.Finished).FirstOrDefault(),
                Title = "QA",
                Description = "Тестирую программы на качество.",
                Grade = 5,
                DateCreation = new DateTime(2022, 12, 05, 17, 05, 01),
                PeopleCreatedId = 3,
                //Profiles = new List<Profile>{ ProfileRepository.Profiles.FirstOrDefault(o => o.Id == 4)},
                //Specialization = SpecializationRepository.Specializations.FirstOrDefault(o => o.Id == 3),
                //Tags = new List<Tag>
                //{
                //    CVTagRepository.CVTags.FirstOrDefault(o => o.Id == 5),
                //},
            },

            new() {
                Status = CVStatusRepository.Statuses.Where(s => s.Name == CVStatusType.Finished).FirstOrDefault(),
                Title = "Flutter developer",
                Description = "Разработка ПО.",
                Grade = 5,
                DateCreation = new DateTime(2022, 12, 07, 13, 01, 01),
                PeopleCreatedId = 2,
                //Profiles = new List<Profile>{ ProfileRepository.Profiles.FirstOrDefault(o => o.Id == 1)},
                //Specialization = SpecializationRepository.Specializations.FirstOrDefault(o => o.Id == 1),
                //Tags = new List<Tag>
                //{
                //    CVTagRepository.CVTags.FirstOrDefault(o => o.Id == 3),
                //},
                GoodCv = true,
                PinnedFileName = "my_cv_flutter.pdf",
                UrlFileForDownload = "https://da728kfevltdk.cloudfront.net/hi.txt",
            },

            new() {
                Status = CVStatusRepository.Statuses.Where(s => s.Name == CVStatusType.Finished).FirstOrDefault(),
                Title = "Database developer",
                Description = "Разработка баз данных.",
                Grade = 5,
                DateCreation = new DateTime(2022, 12, 06, 19, 15, 01),
                PeopleCreatedId = 2,
                //Profiles = new List<Profile>{ ProfileRepository.Profiles.FirstOrDefault(o => o.Id == 1)},
                //Specialization = SpecializationRepository.Specializations.FirstOrDefault(o => o.Id == 4),
                //Tags = new List<Tag>
                //{
                //    CVTagRepository.CVTags.FirstOrDefault(o => o.Id == 4),
                //},
                GoodCv = true,
                PinnedFileName = "my_cv_database.pdf",
                UrlFileForDownload = "https://da728kfevltdk.cloudfront.net/qqq.zip",
            },

            new() {
                Status = CVStatusRepository.Statuses.Where(s => s.Name == CVStatusType.SentToReview).FirstOrDefault(),
                Title = "Java",
                Description = "Разработка ПО на java.",
                DateCreation = new DateTime(2022, 12, 08, 18, 25, 01),
                PeopleCreatedId = 2,
                //Profiles = new List<Profile>{ ProfileRepository.Profiles.FirstOrDefault(o => o.Id == 1)},
                //Specialization = SpecializationRepository.Specializations.FirstOrDefault(o => o.Id == 1),
                //Tags = new List<Tag>
                //{
                //    CVTagRepository.CVTags.FirstOrDefault(o => o.Id == 2),
                //},
                OpenToReview = true,
            },
        };
    }
}