
using CViewer.DataAccess.Entities;
using CViewer.DataAccess.Repositories;
using CViewer.Utils;

namespace CViewer.DataAccess.DataManager
{
    // ToDo: Remove this bullshit. Need to add interface for data access.
    internal static class DataManager
    {
        internal const int EntityNotFound = -1;

        internal static void SetTokenToProfileBySignIn(int profileId, Token token)
        { 
            ProfileToToken profileToToken = GetProfileAndToken(profileId);
            if (profileToToken == null)
            {
                AddProfileAndToken(profileId, token);
                return;
            }

            profileToToken.Token = token;
        }

        internal static void AddProfileAndToken(int profileId, Token token)
        {
            if (TemporaryConfiguration.UseDb)
            {

            }
            else
            {
                ProfileToToken profileToToken = new ProfileToToken { ProfileId = profileId, Token = token };
                ProfileToTokenRepository.ProfilesToTokens.Add(profileToToken);
            }
        }

        internal static ProfileToToken GetProfileAndToken(int profileId)
        {
            if (TemporaryConfiguration.UseDb)
            {

            }
            else
            {
                return ProfileToTokenRepository.ProfilesToTokens.FirstOrDefault(p => p.ProfileId == profileId);
            }
        }

        internal static ProfileToToken GetProfileAndToken(string applicantOrExpertTokenValue)
        {
            if (TemporaryConfiguration.UseDb)
            {

            }
            else
            {
                return ProfileToTokenRepository.ProfilesToTokens.FirstOrDefault(p => p.Token != null && p.Token.Value.Equals(applicantOrExpertTokenValue));
            }
        }

        internal static Profile GetProfile(int profileId)
        {
            if (TemporaryConfiguration.UseDb)
            {

            }
            else
            {
                return ProfileRepository.Profiles.FirstOrDefault(u => u.Id == profileId);
            }
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

        internal static List<CV> GetCvsForProfile(int profileId)
        {
            if (TemporaryConfiguration.UseDb)
            {

            }
            else
            {
                return CVRepository.CVs.Where(cv => cv.PeopleCreatedId == profileId || cv.ExpertIds.Contains(profileId)).ToList();
            }
        }

        internal static CV GetCv(int cvId)
        {
            if (TemporaryConfiguration.UseDb)
            {

            }
            else
            {
                return CVRepository.CVs.FirstOrDefault(cv => cv.Id == cvId);
            }
        }

        internal static int GetTokenCount()
        {
            if (TemporaryConfiguration.UseDb)
            {

            }
            else
            {
                return TokenRepository.Tokens.Count;
            }
        }

        internal static List<CVStatusType> GetCVStatuses()
        {
            if (TemporaryConfiguration.UseDb)
            {

            }
            else
            {
                return CVStatusRepository.CvStatuses;
            }
        }

        public static Profile GetExpertProfile(int expertId)
        {
            if (TemporaryConfiguration.UseDb)
            {

            }
            else
            {
                return ProfileRepository.Profiles.FirstOrDefault(p => p.Id == expertId && p.IsExpert);
            }
        }

        public static Profile GetApplicantProfile(int applicantId)
        {
            if (TemporaryConfiguration.UseDb)
            {

            }
            else
            {
                return ProfileRepository.Profiles.FirstOrDefault(p => p.Id == applicantId && !p.IsExpert);
            }
        }

        public static void RemoveProfileAndToken(string applicantOrExpertTokenValue)
        {
            if (TemporaryConfiguration.UseDb)
            {

            }
            else
            {
                 ProfileToToken profileToToken = ProfileToTokenRepository.ProfilesToTokens.FirstOrDefault(p => p.Token.Value == applicantOrExpertTokenValue);
                 if (profileToToken != null)
                 {
                     ProfileToTokenRepository.ProfilesToTokens.Remove(profileToToken);
                 }
            }
        }

        public static int GetCVHistoriesCount()
        {
            if (TemporaryConfiguration.UseDb)
            {

            }
            else
            {
                return CVHistoryRepository.CVHistories.Count;
            }
        }
    }
}