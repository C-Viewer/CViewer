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
            app.MapGet("/list_all_cv_file_names-test",
                 (IAmazonS3Service service) => ListAllCvFileNamesAsync(service))
                .Produces<List<string>>();

            app.MapPut("/store_file",
                [EnableCors(Configuration.CorsPolicyName)]
                [Authorize(AuthenticationSchemes = JwtBearerDefaults.AuthenticationScheme)]
                ([Required] IFormFile stream, [Required] string fileKeyInAmazonBucket, HttpContext context, ISecurityService securityService, IAmazonS3Service service) =>
                StoreFileAsync(stream, fileKeyInAmazonBucket, context, securityService, service));

            app.MapGet("/get_url_to_cv_file",
                ([Required] string fileKeyInAmazonBucket, IAmazonS3Service service) =>
                GetUrlToCvFile(fileKeyInAmazonBucket, service))
                .Produces<string>();

            app.MapGet("/get_serialized_file_stream-test",
                [EnableCors(Configuration.CorsPolicyName)]
                [Authorize(AuthenticationSchemes = JwtBearerDefaults.AuthenticationScheme)]
                ([Required] string fileKeyInAmazonBucket, HttpContext context, ISecurityService securityService, IAmazonS3Service service) =>
                GetSerializedFileStreamAsync(fileKeyInAmazonBucket, context, securityService, service))
                .Produces<string>();

            app.MapDelete("/delete_file-test",
                [EnableCors(Configuration.CorsPolicyName)]
                [Authorize(AuthenticationSchemes = JwtBearerDefaults.AuthenticationScheme)]
                ([Required] string fileKeyInAmazonBucket, HttpContext context, ISecurityService securityService, IAmazonS3Service service) =>
                DeletetFileAsync(fileKeyInAmazonBucket, context, securityService, service));
        }

        private static async Task<IResult> ListAllCvFileNamesAsync(IAmazonS3Service service)
        {
            List<string> allCVFileNames = await service.GetFileNamesAsync();
            return Results.Ok(allCVFileNames);
        }

        private static async Task<IResult> StoreFileAsync(IFormFile stream, string fileKeyInAmazonBucket, HttpContext context, ISecurityService securityService, IAmazonS3Service service)
        {
            string token = TokenHelper.GetToken(context);
            if (!securityService.CheckAccess(token)) return Results.Unauthorized();
            bool status = await service.AddFileAsync(stream, fileKeyInAmazonBucket);
            if (!status) return Results.BadRequest("File upload failed");
            return Results.Ok();
        }

        private static IResult GetUrlToCvFile(string fileKeyInAmazonBucket, IAmazonS3Service service)
        {
            return Results.Ok(service.GetAmazonFileURL(fileKeyInAmazonBucket));
        }

        private static async Task<IResult> GetSerializedFileStreamAsync(string fileKeyInAmazonBucket, HttpContext context, ISecurityService securityService, IAmazonS3Service service)
        {
            string token = TokenHelper.GetToken(context);
            if (!securityService.CheckAccess(token)) return Results.Unauthorized();
            string serializedFileStream = await service.GetSerializedFileStreamAsync(fileKeyInAmazonBucket);
            if (serializedFileStream == null) return Results.NotFound("File not found");
            return Results.Ok(serializedFileStream);
        }

        private static async Task<IResult> DeletetFileAsync(string fileKeyInAmazonBucket, HttpContext context, ISecurityService securityService, IAmazonS3Service service)
        {
            string token = TokenHelper.GetToken(context);
            if (!securityService.CheckAccess(token)) return Results.Unauthorized();
            bool status = await service.DeleteFileAsync(fileKeyInAmazonBucket);
            if (!status) return Results.NotFound("File not found");
            return Results.Ok();
        }
    }
}
