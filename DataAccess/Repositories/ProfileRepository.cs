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
                EmailAddress = "yuriIvanov1812g@gmail.com",
                Password = "Ghbdtn_!5", 
                FirstName = "Юрий", 
                LastName = "Иванов", 
                IsExpert = true,
                Rating = 10,
                Specialization = SpecializationRepository.Specializations.FirstOrDefault(s => s.Name == "Software Engineer"),
                Biography = "Магистратура МФТИ"
            },
            new()
            {
                Id = 2,
                EmailAddress = "olegBorov136y@gmail.com", 
                Password = "Gjrf_!2g", 
                FirstName = "Олег",
                LastName = "Боров", 
                IsExpert = false,
                Specialization = SpecializationRepository.Specializations.FirstOrDefault(s => s.Name == "Software Engineer"),
                Biography = "Бакалавриат ИТМО"
            },
            new()
            {
                Id = 3,
                EmailAddress = "ninoApakidzeG3@gmail.com", 
                Password = "Gjrf_!2g", 
                FirstName = "Нино",
                LastName = "Апакидзе", 
                IsExpert = false,
                Specialization = SpecializationRepository.Specializations.FirstOrDefault(s => s.Name == "QA"),
                Biography = "QA. Бакалавриат СПбГУ"
            },

            new()
            {
                Id = 4,
                EmailAddress = "ivanchikPrototos@gmail.com",
                Password = "Ghbdtn_!5",
                FirstName = "Иван",
                LastName = "Протос",
                IsExpert = true,
                Rating = 9.7,
                Specialization = SpecializationRepository.Specializations.FirstOrDefault(s => s.Name == "QA"),
                Biography = "QA в Яндекс"
            },
        };
    }
}
