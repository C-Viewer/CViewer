
using CViewer.DataAccess.Entities;
using CViewer.DataAccess.Repositories;
using CViewer.Utils;

namespace CViewer.DataAccess.DataManager
{
    // ToDo: Add preprocess directive for Memory/Db data extraction.
    internal static class DataManager
    {
        internal const int EntityNotFound = -1;

        internal static void SetTokenToProfile(int profileId, string token)
        { 
            ProfileToToken profileToToken = GetProfileToTokenFromMemory(profileId);
            if (profileToToken == null)
            {
                AddProfileToTokenInMemory(profileId, token);
                return;
            }

            profileToToken.Token = token;
        }

        internal static void AddProfileToTokenInMemory(int profileId, string token)
        {
            ProfileToTokenRepository.ProfilesToTokens.Add(new() { ProfileId = profileId, Token = token});
        }

        internal static ProfileToToken GetProfileToTokenFromMemory(int profileId)
        {
            return ProfileToTokenRepository.ProfilesToTokens.FirstOrDefault(p => p.ProfileId == profileId);
        }

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

        internal static List<int> GetProfilesIdsForCv(int cvId)
        {
            if (TemporaryConfiguration.UseDb)
            {
                // ToDo
            }
            else
            {
                CV cv = CVRepository.CVs.FirstOrDefault(cv => cv.Id == cvId);
                if (cv == null)
                {
                    return new List<int> { EntityNotFound };
                }

                List<int> peopleIds = new List<int> { cv.PeopleCreatedId };
                List<int> expertsIds = cv.ExpertIds;
                if (expertsIds != null && expertsIds.Any())
                {
                    peopleIds.AddRange(expertsIds);
                }

                return peopleIds;
            }
        }

        internal static List<CVHistory> GetCVHistories(int cvId)
        {
            return CVHistoryRepository.CVHistories.Where(h => h.CVId == cvId).ToList();
        }
    }
}