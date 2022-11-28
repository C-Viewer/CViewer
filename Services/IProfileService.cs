using CViewer.DataAccess.Entities;

namespace CViewer.Services
{
    public interface IProfileService
    {
        public Profile SignUp(UserCredentials userCredentials);
        public Profile SignIn(UserCredentials userCredentials);
        public Profile GetProfileInfo(int profileId);
        public Profile UpdateProfileInfo(Profile newProfile);
        public List<Profile> ListProfiles();
    }
}
