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
                EmailAddress = "d",
                Password = "d", 
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
                EmailAddress = "l", 
                Password = "l", 
                FirstName = "Boy",
                LastName = "Next", 
                IsExpert = false,
                SpecializationId = 1,
                Biography = "Average IT fun"
            },
        };
    }
}
