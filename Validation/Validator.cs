using CViewer.DataAccess.Data;
using CViewer.DataAccess.Entities;

namespace CViewer.Validation
{
    internal static class Validator
    {
        internal static bool ValidateTokenWithProfiles(string tokenValue, List<int> profilesIds)
        {
            using (CviewerContext db = new CviewerContext())
            {
                foreach (int profileId in profilesIds)
                {
                    ProfileToToken profileToToken = db.ProfileToTokens.FirstOrDefault(p =>
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