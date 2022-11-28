using CViewer.DataAccess.Entities;

namespace CViewer.Services
{
    public interface IProfileService
    {
        public Profile CreateProfile(UserCredentials userCredentials);
        public Profile LoginByEmailAndPassword(UserCredentials userCredentials);
        public Profile GetProfileInfo(int profileId);
        public Profile UpdateProfileInfo(Profile newProfile);
        public List<Profile> ListProfiles();
    }
}
