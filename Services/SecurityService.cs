using CViewer.DataAccess.DataManager;
using CViewer.DataAccess.Entities;
using CViewer.Utils;

namespace CViewer.Services
{
    public class SecurityService : ISecurityService
    {
        public bool CheckAccess(string tokenValue)
        {
            ProfileToToken profileToToken = DataManager.GetProfileAndToken(tokenValue);
            if (profileToToken == null)
            {
                return false;
            }

            Token token = DataManager.GetToken(profileToToken);
            // Allow user at least 10-minutes session.
            if (TokenHelper.TokenLifeTimeForSessionWindow() <= token.ExpirationDateTime)
            {
                return true;
            }

            return false;
        }
    }
}