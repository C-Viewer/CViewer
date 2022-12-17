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
                EmailAddress = "y",
                Password = "y", 
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
                EmailAddress = "string", 
                Password = "string", 
                FirstName = "Олег",
                LastName = "Боров", 
                IsExpert = false,
                Specialization = SpecializationRepository.Specializations.FirstOrDefault(s => s.Name == "Software Engineer"),
                Biography = "Бакалавриат ИТМО"
            },
            new()
            {
                Id = 3,
                EmailAddress = "n", 
                Password = "n", 
                FirstName = "Нино",
                LastName = "Апакидзе", 
                IsExpert = false,
                Specialization = SpecializationRepository.Specializations.FirstOrDefault(s => s.Name == "QA"),
                Biography = "QA. Бакалавриат СПбГУ"
            },

            new()
            {
                Id = 4,
                EmailAddress = "i",
                Password = "i",
                FirstName = "Иван",
                LastName = "Протос",
                IsExpert = true,
                Rating = 4.8,
                Specialization = SpecializationRepository.Specializations.FirstOrDefault(s => s.Name == "QA"),
                Biography = "QA в Яндекс"
            },
        };
    }
}
