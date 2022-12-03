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
                EmailAddress = "dark-fantasies.com",
                Password = "Pass", 
                FirstName = "Ven", 
                LastName = "Darkholm", 
                IsExpert = true,
                Rating = 10,
                SpecializationId = 1,
                Biography = "Dungeon master"
            },
            new()
            {
                Id = 2,
                EmailAddress = "letherman.com", 
                Password = "Pass2", 
                FirstName = "Boy",
                LastName = "Next", 
                IsExpert = false,
                SpecializationId = 1,
                Biography = "Average IT fun"
            },
        };
    }
}
