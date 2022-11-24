using Microsoft.EntityFrameworkCore.Metadata.Conventions;
using MinimalJwt.Models;
using MinimalJwt.Repositories;

namespace MinimalJwt.Services
{
    public class ProfileService : IProfileService
    {
        public Profile CreateProfile(UserCredentials userCredentials)
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

        public Profile LoginByEmailAndPassword(UserCredentials userCredentials)
        {
            Profile profile = ProfileRepository.Profiles.FirstOrDefault(o => o.EmailAddress.Equals(userCredentials.EmailAddress, StringComparison.OrdinalIgnoreCase) && o.Password.Equals(userCredentials.Password));

            return profile;
        }

        public Profile GetProfileInfo(int profileId)
        {
            var profile = ProfileRepository.Profiles.FirstOrDefault(o => o.Id == profileId);

            if (profile is null) return null;

            return profile;
        }

        public Profile UpdateProfileInfo(Profile newProfile)
        {
            var oldProfile = ProfileRepository.Profiles.FirstOrDefault(o => o.Id == newProfile.Id);

            if (oldProfile is null) return null;

            oldProfile.FirstName = newProfile.FirstName;
            oldProfile.Biography = newProfile.Biography;
            oldProfile.Rating = newProfile.Rating;

            return oldProfile;
        }

        public List<Profile> ListProfiles()
        {
            var profiles = ProfileRepository.Profiles;

            return profiles;
        }
    }
}
