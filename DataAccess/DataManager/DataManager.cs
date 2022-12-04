using CViewer.DataAccess.Entities;
using CViewer.DataAccess.Repositories;

namespace CViewer.DataAccess.DataRetrieval
{
    internal static class DataManager
    {
        internal static Profile GetProfileFromMemory(string email, string password)
        {
            // ToDo: Use salt and hash for password.
            return ProfileRepository.Profiles.FirstOrDefault(u =>
                u.EmailAddress.Equals(email) && u.Password.Equals(password));
        }

        internal static int GetProfilesCountFromMemory()
        {
            return ProfileRepository.Profiles.Count;
        }

        internal static void AddProfileToMemory(Profile profile)
        {
            ProfileRepository.Profiles.Add(profile);
        }

        internal static List<CVHistory> GetCVHistories(int cvId)
        {
            return CVHistoryRepository.CVHistories.Where(h => h.CVId == cvId).ToList();
        }
    }
}