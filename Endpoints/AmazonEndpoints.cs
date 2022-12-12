using CViewer.Services;
using CViewer.Utils;
using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Cors;
using System.ComponentModel.DataAnnotations;

namespace CViewer.Endpoints
{
    internal static class AmazonEndpoints
    {

        public static void MapAmazonEndpoints(this WebApplication app)
        {
            app.MapGet("/list_all_files",
                    (IAmazonS3Service service) => GetFileNames(service))
                .Produces<List<string>>();

            app.MapPut("/add_file",
                //[EnableCors(Configuration.CorsPolicyName)]
            //[Authorize(AuthenticationSchemes = JwtBearerDefaults.AuthenticationScheme)]
            ([Required] IFormFile stream, [Required] string path, HttpContext context, ISecurityService securityService, IAmazonS3Service service) => AddFile(stream, path, context, securityService, service))
                .Produces<bool>();

            app.MapGet("/get_file",
            //[EnableCors(Configuration.CorsPolicyName)]
            //[Authorize(AuthenticationSchemes = JwtBearerDefaults.AuthenticationScheme)]
            ([Required] string path, HttpContext context, ISecurityService securityService, IAmazonS3Service service) => GetFile(path, context, securityService, service))
                .Produces<MemoryStream>();

            app.MapDelete("/delete_file",
                //[EnableCors(Configuration.CorsPolicyName)]
            //[Authorize(AuthenticationSchemes = JwtBearerDefaults.AuthenticationScheme)]
            ([Required] string path, HttpContext context, ISecurityService securityService, IAmazonS3Service service) => DeletetFile(path, context, securityService, service))
                .Produces<bool>();
        }

        private static IResult GetFileNames(IAmazonS3Service service)
        {
            return Results.Ok(service.GetFileNames());
        }

        private static IResult AddFile(IFormFile stream, string path, HttpContext context, ISecurityService securityService, IAmazonS3Service service)
        {
            //string token = TokenHelper.GetToken(context);
            //if (!securityService.CheckAccess(token)) { return Results.Unauthorized(); }
            bool status = service.AddFile(stream, path);
            if (!status) return Results.BadRequest("File upload failed");
            return Results.Ok(true);
        }

        private static IResult GetFile(string path, HttpContext context, ISecurityService securityService, IAmazonS3Service service)
        {
            //string token = TokenHelper.GetToken(context);
            //if (!securityService.CheckAccess(token)) { return Results.Unauthorized(); }
            MemoryStream status = service.GetFile(path);
            if (status == null) return Results.NotFound("File not found");
            return Results.Ok(status);
        }

        private static IResult DeletetFile(string path, HttpContext context, ISecurityService securityService, IAmazonS3Service service)
        {
            //string token = TokenHelper.GetToken(context);
            //if (!securityService.CheckAccess(token)) { return Results.Unauthorized(); }
            bool status = service.DeleteFile(path);
            if (!status) return Results.NotFound("File not found");
            return Results.Ok(true);
        }
    }
}
