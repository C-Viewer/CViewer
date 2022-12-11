namespace CViewer.Utils
{
    internal static class TokenHelper
    {
        internal static Func<DateTime> TokenLifeTimeExpires = () => DateTime.UtcNow.AddMinutes(10);
        internal static Func<DateTime> TokenLifeTimeNotBefore = () => DateTime.UtcNow;
        internal static Func<DateTime> TokenLifeTimeForSessionWindow = () => DateTime.UtcNow.AddMinutes(5);

        internal static string GetToken(HttpContext context)
        {
            string applicantOrExpertToken = context.Request.Headers["Authorization"].FirstOrDefault()?.Split(" ").Last();
            return applicantOrExpertToken;
        }
    }
}
