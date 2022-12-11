using CViewer.DataAccess.Entities;
using CViewer.DataAccess.Repositories;
using CViewer.Utils;

namespace CViewer.Validation
{
    internal static class Validator
    {
        internal static bool ValidateTokenWithProfiles(string tokenValue, List<int> profilesIds)
        {
            if (TemporaryConfiguration.UseDb)
            {
                // ToDo add db usage
            }
            else
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