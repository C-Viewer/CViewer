using CViewer.DataAccess.Entities;

namespace CViewer.Services
{
    public interface IProfileService
    {
        public int SignUp(UserCredentials userCredentials, out string tokenOrMessage, WebApplicationBuilder builder);
        public int SignIn(UserCredentials userCredentials, out string tokenOrMessage, WebApplicationBuilder builder);
        public Profile GetProfile(string applicantOrExpertToken);
        public Profile UpdateProfile(int profileId, string firstName = null, string lastName = null, string biography = null,
            double? rating = null, string email = null, string password = null, int? specializationId = null);
        public List<Profile> ListProfiles();
    }
}
