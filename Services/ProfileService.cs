using CViewer.DataAccess.Entities;
using CViewer.DataAccess.Repositories;

namespace CViewer.Services
{
    public class ProfileService : IProfileService
    {
        public Profile SignUp(UserCredentials userCredentials)
        {
            Profile existingProfile = ProfileRepository.Profiles.FirstOrDefault(
                o => o.EmailAddress.Equals(userCredentials.EmailAddress)
                     && o.Password.Equals(userCredentials.Password));
            if (existingProfile != null)
            {
                return existingProfile;
            }

            Profile newProfile = new Profile
            {
                Id = ProfileRepository.Profiles.Count + 1,
                EmailAddress = userCredentials.EmailAddress,
                Password = userCredentials.Password
            };

            ProfileRepository.Profiles.Add(newProfile);

            return newProfile;
        }

        public Profile SignIn(UserCredentials userCredentials)
        {
            Profile profile = ProfileRepository.Profiles.FirstOrDefault(o => o.EmailAddress.Equals(userCredentials.EmailAddress, StringComparison.OrdinalIgnoreCase) && o.Password.Equals(userCredentials.Password));

            return profile;
        }

        public Profile GetProfile(int profileId)
        {
            var profile = ProfileRepository.Profiles.FirstOrDefault(o => o.Id == profileId);

            if (profile is null) return null;

            return profile;
        }

        public Profile UpdateProfile(int profileId, string firstName = null, string lastName = null, string biography = null,
            double? rating = null, string email = null, string password = null, int? specializationId = null)
        {
            var profileForUpdate = ProfileRepository.Profiles.FirstOrDefault(o => o.Id == profileId);

            if (profileForUpdate is null) return null;

            if (firstName != null)
            {
                profileForUpdate.FirstName = firstName;
            }

            if (lastName != null)
            {
                profileForUpdate.LastName = lastName;
            }

            if (biography != null)
            {
                profileForUpdate.Biography = biography;
            }

            if (rating != null)
            {
                profileForUpdate.Rating = (double)rating;
            }

            if (email != null)
            {
                profileForUpdate.EmailAddress = email;
            }

            if (password != null)
            {
                profileForUpdate.Password = password;
            }

            if (specializationId != null)
            {
                profileForUpdate.SpecializationId = (int)specializationId;
            }

            return profileForUpdate;
        }

        public List<Profile> ListProfiles()
        {
            var profiles = ProfileRepository.Profiles;

            return profiles;
        }
    }
}
