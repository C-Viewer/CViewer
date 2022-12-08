using CViewer.DataAccess.Entities;

namespace CViewer.Services
{
    public interface IProfileService
    {
        public int SignUp(UserCredentials userCredentials, out Profile newProfile, out Token token, out string errorMessage, WebApplicationBuilder builder);
        public int SignIn(UserCredentials userCredentials, out Profile existingProfile, out Token token, out string errorMessage, WebApplicationBuilder builder);
        public Profile GetProfile(string applicantOrExpertTokenValue);
        public Profile UpdateProfile(int profileId, string firstName = null, string lastName = null, string biography = null,
            double? rating = null, string email = null, string password = null, Specialization specializationId = null);
        public List<Profile> ListProfiles();
    }
}
