using CViewer.DataAccess.Entities;

namespace CViewer.DataAccess.Repositories
{
    internal sealed class ProfileRepository
    {
        public static List<Profile> Profiles = new()
        {
            new()
            {
                Id = 1,
                EmailAddress = "ivanov@mail.ru",
                Password = "12345", 
                FirstName = "Юрий", 
                LastName = "Иванов", 
                IsExpert = true,
                Rating = 5,
                Specialization = SpecializationRepository.Specializations.FirstOrDefault(s => s.Name == "Software Engineer"),
                Biography = "Магистратура МФТИ"
            },
            
            new()
            {
                Id = 2,
                EmailAddress = "borov@mail.ru", 
                Password = "p123", 
                FirstName = "Олег",
                LastName = "Боров", 
                IsExpert = false,
                Specialization = SpecializationRepository.Specializations.FirstOrDefault(s => s.Name == "Software Engineer"),
                Biography = "Бакалавриат ИТМО"
            },
            
            new()
            {
                Id = 3,
                EmailAddress = "apalidze@mail.ru", 
                Password = "123", 
                FirstName = "Нино",
                LastName = "Апакидзе", 
                IsExpert = false,
                Specialization = SpecializationRepository.Specializations.FirstOrDefault(s => s.Name == "QA"),
                Biography = "QA. Бакалавриат СПбГУ"
            },
            new()
            {
                Id = 4,
                EmailAddress = "ivan.p@mail.ru",
                Password = "pass123",
                FirstName = "Иван",
                LastName = "Протос",
                IsExpert = true,
                Rating = 4.5,
                Specialization = SpecializationRepository.Specializations.FirstOrDefault(s => s.Name == "QA"),
                Biography = "QA в Яндекс"
            },    
            
            new()
            {
                Id = 5,
                EmailAddress = "petrova123@gmail.com",
                Password = "pass123",
                FirstName = "Мария",
                LastName = "Петрова",
                IsExpert = false,
                Specialization = SpecializationRepository.Specializations.FirstOrDefault(s => s.Name == "Frontend Developer"),
                Biography = "Санкт-Петербургский государственный электротехнический университет имени В.И. Ленина"
            },
            
            new()
            {
                Id = 6,
                EmailAddress = "podorojniy@gmail.com",
                Password = "pass123",
                FirstName = "Олег",
                LastName = "Подорожный",
                IsExpert = false,
                Specialization = SpecializationRepository.Specializations.FirstOrDefault(s => s.Name == "UX/UI Designer"),
                Biography = "Бакалавр БГТУ им. В.Г. Шухова. UX/UI Designer в Lamoda"
            },
            new()
            {
                Id = 7,
                EmailAddress = "stepanov@gmail.com",
                Password = "5432",
                FirstName = "Федор",
                LastName = "Степанов",
                IsExpert = false,
                Specialization = SpecializationRepository.Specializations.FirstOrDefault(s => s.Name == "Data Science"),
                Biography = "Бакалавр СибГУ им. М.Ф. Решетнева"
            },
            
            new()
            {
                Id = 8,
                EmailAddress = "voronova@gmail.com",
                Password = "5656",
                FirstName = "Ольга",
                LastName = "Воронова",
                IsExpert = false,
                Specialization = SpecializationRepository.Specializations.FirstOrDefault(s => s.Name == "Backend Developer"),
                Biography = "Бакалавриат ИТМО, Информационные системы и технологии"
            },
            
           new()
           {
                Id = 9,
                EmailAddress = "saveliev@gmail.com",
                Password = "pass123",
                FirstName = "Дмитрий",
                LastName = "Савельев",
                IsExpert = true,
                Rating = 4.5,
                Specialization = SpecializationRepository.Specializations.FirstOrDefault(s => s.Name == "Backend Developer"),
                Biography = "Backend Developer в ВКонтакте"
            },
        };
    }
}
