namespace CViewer.Utils
{
    internal static class TokenHelper
    {
        internal static DateTime TokenLifeTimeExpires = DateTime.UtcNow.AddMinutes(10);
        internal static DateTime TokenLifeTimeNotBefore = DateTime.UtcNow;
        internal static DateTime TokenLifeTimeForSessionWindow = DateTime.UtcNow.AddMinutes(5);

        internal static string GetToken(HttpContext context)
        {
            string applicantOrExpertToken = context.Request.Headers["Authorization"].FirstOrDefault()?.Split(" ").Last();
            return applicantOrExpertToken;
        }
    }
}
