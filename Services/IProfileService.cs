using CViewer.DataAccess.Entities;

namespace CViewer.Services
{
    public interface IProfileService
    {
        public Profile SignUp(UserCredentials userCredentials);
        public Profile SignIn(UserCredentials userCredentials);
        public Profile GetProfile(int profileId);
        public Profile UpdateProfile(int profileId, string firstName = null, string lastName = null, string biography = null,
            double? rating = null, string email = null, string password = null, int? specializationId = null);
        public List<Profile> ListProfiles();
    }
}
