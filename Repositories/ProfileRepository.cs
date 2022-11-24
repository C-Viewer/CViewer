using MinimalJwt.Models;

namespace MinimalJwt.Repositories
{
    public class ProfileRepository
    {
        public static List<Profile> Profiles = new()
        {
            new()
            {
                Id = 1,
                EmailAddress = "luke.admin@email.com",
                Password = "MyPass_w0rd", 
                FirstName = "Luke", 
                LastName = "Rogers", 
                UserRole = UserRole.Admin
            },
            new()
            {
                Id = 2,
                EmailAddress = "lydia.standard@email.com", 
                Password = "MyPass_w0rd", 
                FirstName = "Elyse",
                LastName = "Burton", 
                UserRole = UserRole.User
            },
        };
    }
}
