namespace CViewer.Utils
{
    internal static class TokenHelper
    {
        internal static string GetToken(HttpContext context)
        {
            string applicantOrExpertToken = context.Request.Headers["Authorization"].FirstOrDefault()?.Split(" ").Last();
            return applicantOrExpertToken;
        }
    }
}
