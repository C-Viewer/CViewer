using CViewer.Utils;

namespace CViewer.Utils
{
    internal static class TokenHelper
    {
        internal static Func<DateTime> TokenLifeTimeExpires = () => LocalTimeHelper.GetMoscowDateTime(DateTime.UtcNow.AddMinutes(360));
        internal static Func<DateTime> TokenLifeTimeNotBefore = () => LocalTimeHelper.GetMoscowDateTime(DateTime.UtcNow);
        internal static Func<DateTime> TokenLifeTimeForSessionWindow = () => LocalTimeHelper.GetMoscowDateTime(DateTime.UtcNow.AddMinutes(10));

        internal static string GetToken(HttpContext context)
        {
            string applicantOrExpertToken = context.Request.Headers["Authorization"].FirstOrDefault()?.Split(" ").Last();
            return applicantOrExpertToken;
        }
    }
}
