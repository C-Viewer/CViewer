using CViewer.DataAccess.Entities;
using CViewer.DataAccess.Repositories;

namespace CViewer.DataAccess.DataRetrieval
{
    internal static class DataManager
    {
        internal static Profile GetProfile(string email, string password)
        {
            // ToDo: Use salt and hash for password.
            return ProfileRepository.Profiles.FirstOrDefault(u =>
                u.EmailAddress.Equals(email) && u.Password.Equals(password));
        }

        internal static int GetProfilesCount()
        {
            return ProfileRepository.Profiles.Count;
        }

        internal static void AddProfile(Profile profile)
        {
            ProfileRepository.Profiles.Add(profile);
        }
    }
}