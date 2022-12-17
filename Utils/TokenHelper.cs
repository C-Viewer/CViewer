namespace CViewer.Utils
{
    internal static class TokenHelper
    {
        internal static Func<DateTime> TokenLifeTimeExpires = () => DateTime.Now.AddMinutes(360);
        internal static Func<DateTime> TokenLifeTimeNotBefore = () => DateTime.Now;
        internal static Func<DateTime> TokenLifeTimeForSessionWindow = () => DateTime.Now.AddMinutes(10);

        internal static string GetToken(HttpContext context)
        {
            string applicantOrExpertToken = context.Request.Headers["Authorization"].FirstOrDefault()?.Split(" ").Last();
            return applicantOrExpertToken;
        }
    }
}
