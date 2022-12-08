using CViewer.Services;

namespace CViewer.Endpoints
{
    internal static class AmazonEndpoints
    {
        public static void MapAmazonEndpoints(this WebApplication app)
        {
            app.MapGet("/get_all_files",
                    (IAmazonS3Service service) => GetFiles(service))
                .Produces<List<string>>();

            app.MapPost("/add_file",
                    (FileStream stream, string path, IAmazonS3Service service) => AddFile(stream, path, service))
                .Produces<bool>();

            app.MapGet("/get_file",
                    (string path, IAmazonS3Service service) => GetFile(path, service))
                .Produces<Stream>();

            app.MapGet("/delete_file",
                    (string path, IAmazonS3Service service) => DeletetFile(path, service))
                .Produces<bool>();
        }

        private static IResult GetFiles(IAmazonS3Service service)
        {
            return Results.Ok(service.GetFiles());
        }

        private static IResult AddFile(FileStream stream, string path, IAmazonS3Service service)
        {
            bool status = service.AddFile(stream, path);
            if (!status) return Results.BadRequest("File upload failed");
            return Results.Ok();
        }

        private static IResult GetFile(string path, IAmazonS3Service service)
        {
            Stream status = service.GetFile(path);
            if (status == null) return Results.NotFound("File not found");
            return Results.Ok(status);
        }

        private static IResult DeletetFile(string path, IAmazonS3Service service)
        {
            bool status = service.DeleteFile(path);
            if (!status) return Results.NotFound("File not found");
            return Results.Ok();
        }
    }
}
