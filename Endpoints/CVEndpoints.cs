using CViewer.DataAccess.Entities;
using CViewer.Services;
using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Routing.Constraints;

namespace CViewer.Endpoints
{
    public static class CVEndpoints
    {
        public static void MapCVEndpoints(this WebApplication app)
        {
            app.MapPost("/create_cv_draft",
                //[Authorize(AuthenticationSchemes = JwtBearerDefaults.AuthenticationScheme, Roles = "Administrator")]
                    (CV cv, int applicantId, ICVService service) => CreateCVDraft(cv, applicantId, service))
                .Accepts<CV>("application/json")
                .Produces<CV>(statusCode: 200, contentType: "application/json");

            // ToDo: Perhaps, we will need two or more List-parameters, but I cannot understand how to pass it yet.
            app.MapPost("/update_cv_info",
                //[Authorize(AuthenticationSchemes = JwtBearerDefaults.AuthenticationScheme, Roles = "Administrator")]
                (int cvId, ICVService service, string title, Specialization? specialization, List<CVTag> tags,
                        string description) =>
                    UpdateCVInfo(cvId: cvId, service: service, title: title, specialization: specialization, tags: tags, description: description));
            //.Accepts<CV>("application/json")
            //.Produces<CV>(statusCode: 200, contentType: "application/json");

            app.MapGet("/add_event_to_history",
                (int cvId, string fileName, string applicantComment, string expertComment, DateTime dateTime, ICVService service) => 
                    AddEventToHistory(cvId: cvId, fileName: fileName, applicantComment: applicantComment, expertComment: expertComment, dateTime: dateTime,
                        service: service));

            // ToDo: change the following methods
            app.MapGet("/get",
                    //[Authorize(AuthenticationSchemes = JwtBearerDefaults.AuthenticationScheme, Roles = "Standard, Administrator")]
                    (int id, ICVService service) => Get(id, service))
                .Produces<CV>();

            app.MapGet("/list",
                    (ICVService service) => List(service))
                .Produces<List<CV>>(statusCode: 200, contentType: "application/json");

            app.MapPut("/update",
                    //[Authorize(AuthenticationSchemes = JwtBearerDefaults.AuthenticationScheme, Roles = "Administrator")]
                    (CV newCV, ICVService service) => Update(newCV, service))
                .Accepts<CV>("application/json")
                .Produces<CV>(statusCode: 200, contentType: "application/json");

            app.MapDelete("/delete",
                [Authorize(AuthenticationSchemes = JwtBearerDefaults.AuthenticationScheme, Roles = "Administrator")]
                (int id, ICVService service) => Delete(id, service));
        }

        private static IResult CreateCVDraft(CV cv, int applicantId, ICVService service)
        {
            var result = service.CreateCVDraft(cv, applicantId);
            return Results.Ok(result);
        }

        private static IResult UpdateCVInfo(int cvId, ICVService service, string title = null, Specialization? specialization = null, List<CVTag> tags = null, string description = null)
        {
            var updatedCV = service.UpdateCVInfo(cvId: cvId, title: title, specialization: specialization, tags: tags, 
                description: description);

            if (updatedCV is null) Results.NotFound("CV not found");

            return Results.Ok(updatedCV);
        }

        private static IResult AddEventToHistory(int cvId, string fileName, string applicantComment,
            string expertComment, DateTime dateTime, ICVService service)
        {
            CVHistory cvHistory = service.AddEventToHistory(cvId: cvId, fileName: fileName, applicantComment: applicantComment,
                expertComment: expertComment, dateTime: dateTime,
                service: service);

            return Results.Ok(cvHistory);
        }

        private static IResult Get(int id, ICVService service)
        {
            var movie = service.Get(id);

            if (movie is null) return Results.NotFound("CV not found");

            return Results.Ok(movie);
        }

        private static IResult List(ICVService service)
        {
            var movies = service.List();

            return Results.Ok(movies);
        }

        private static IResult Update(CV newCV, ICVService service)
        {
            var updatedMovie = service.Update(newCV);

            if (updatedMovie is null) Results.NotFound("CV not found");

            return Results.Ok(updatedMovie);
        }

        private static IResult Delete(int id, ICVService service)
        {
            var result = service.Delete(id);

            if (!result) Results.BadRequest("Something went wrong");

            return Results.Ok(result);
        }
    }
}