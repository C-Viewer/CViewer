using CViewer.DataAccess.Entities;
using CViewer.DataAccess.Repositories;

namespace CViewer.Validation
{
    internal static class Validator
    {
        internal static bool ValidateTokenWithProfiles(string tokenValue, List<int> profilesIds)
        {
            using (CViewerMgrDbContext db = new CViewerMgrDbContext())
            {
                foreach (int profileId in profilesIds)
                {
                    ProfileToToken profileToToken = ProfileToTokenRepository.ProfilesToTokens.FirstOrDefault(p =>
                        p.ProfileId == profileId && p.Token != null && p.Token.Value.Equals(tokenValue));
                    if (profileToToken != null)
                    {
                        return true;
                    }
                }

                return false;
            }
        }
    }
}