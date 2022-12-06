using CViewer.DataAccess.Entities;
using CViewer.Services;
using CViewer.Utils;

namespace CViewer.Endpoints
{
    internal static class SecurityEndpoints
    {
        internal static void MapSecurityEndpoints(this WebApplication app)
        {
            app.MapGet("/check_access",
                (HttpContext context, ISecurityService service) => CheckAccess(context, service));
        }

        private static IResult CheckAccess(HttpContext context, ISecurityService service)
        {
            var tokenValue = TokenHelper.GetToken(context);
            bool isExistAndAlive = service.CheckAccess(tokenValue);
            if (isExistAndAlive)
            {
                return Results.Ok();
            }

            return Results.Unauthorized();
        }
    }
}