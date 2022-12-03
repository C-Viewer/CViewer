using CViewer.DataAccess.Entities;
using CViewer.DataAccess.TransitObjects;
using CViewer.Services;

namespace CViewer.Endpoints
{
    internal static class CVEndpoints
    {
        public static void MapCVEndpoints(this WebApplication app)
        {
            app.MapGet("/get_cv",
                    (int cvId, ICVService service) => GetCV(cvId, service))
                .Produces<CV>();

            app.MapGet("/get_cv_history",
                    (int cvHistoryId, ICVService service) => GetCVHistory(cvHistoryId, service))
                .Produces<CVHistory>();

            app.MapGet("/get_attached_file",
                    (int attachedFileId, ICVService service) => GetAttachedFile(attachedFileId, service))
                .Produces<AttachedFile>();

            app.MapPost("/create_cv_draft",
                    (CV cv, int applicantId, ICVService service) => CreateCVDraft(cv, applicantId, service))
                .Accepts<CV>("application/json")
                .Produces<CV>(statusCode: 200, contentType: "application/json");

            // ToDo: Perhaps, we will need two or more List-parameters, but I cannot understand how to pass it yet.
            app.MapPost("/update_cv_info",
                (int cvId, ICVService service, string title, TransitObjectForUpdateCVInfo updateCVInfoParams,// Specialization specialization, List<CVTag> tags,
                        string description) =>
                    UpdateCVInfo(cvId: cvId, service: service, title: title, 
                        specialization: updateCVInfoParams.Specialization, tags: updateCVInfoParams.CVTags, description: description));
            //.Accepts<CV>("application/json")
            //.Produces<CV>(statusCode: 200, contentType: "application/json");

            app.MapGet("/add_event_to_history",
                (int cvId, string fileName, string applicantComment, string expertComment, DateTime dateTime, ICVService service) => 
                    AddEventToHistory(cvId: cvId, fileName: fileName, applicantComment: applicantComment, expertComment: expertComment, dateTime: dateTime,
                        service: service));

            app.MapGet("/list_CVs",
                    (ICVService service) => ListCVs(service))
                .Produces<List<CV>>(statusCode: 200, contentType: "application/json");

            app.MapGet("/list_CV_tags",
                (ICVService service) => ListCVTags(service));

            app.MapGet("/list_specializations",
                (ICVService service) => ListSpecializations(service));

            app.MapGet("/list_CV_histories",
                    (ICVService service) => ListCVHistories(service))
                .Produces<List<CVHistory>>(statusCode: 200, contentType: "application/json");

            app.MapGet("/list_attached_files",
                    (ICVService service) => ListAttachedFiles(service))
                .Produces<List<AttachedFile>>(statusCode: 200, contentType: "application/json");

            //app.MapDelete("/delete",
            //    [Authorize(AuthenticationSchemes = JwtBearerDefaults.AuthenticationScheme, Roles = "Administrator")]
            //    (int id, ICVService service) => Delete(id, service));
        }

        private static IResult CreateCVDraft(CV cv, int applicantId, ICVService service)
        {
            var result = service.CreateCVDraft(cv, applicantId);
            return Results.Ok(result);
        }

        private static IResult UpdateCVInfo(int cvId, ICVService service, string title = null, Specialization specialization = null, List<CVTag> tags = null, string description = null)
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

        private static IResult GetCV(int cvId, ICVService service)
        {
            CV cv = service.GetCV(cvId);

            if (cv is null) return Results.NotFound("CV not found");

            return Results.Ok(cv);
        }

        private static IResult GetCVHistory(int cvHistoryId, ICVService service)
        {
            var cvHistory = service.GetCVHistory(cvHistoryId);

            if (cvHistory is null) return Results.NotFound("CV history not found");

            return Results.Ok(cvHistory);
        }

        private static IResult GetAttachedFile(int attachedFileId, ICVService service)
        {
            var attachedFile = service.GetAttachedFile(attachedFileId);

            if (attachedFile is null) return Results.NotFound("Attached file not found");

            return Results.Ok(attachedFile);
        }

        private static IResult ListCVTags(ICVService service)
        {
            return Results.Ok(service.ListCVTags());
        }

        private static IResult ListSpecializations(ICVService service)
        {
            return Results.Ok(service.ListSpecializations());
        }

        
        private static IResult ListCVHistories(ICVService service)
        {
            var cvHistories = service.ListCVHistories();

            return Results.Ok(cvHistories);
        }

        private static IResult ListAttachedFiles(ICVService service)
        {
            var attachedFiles = service.ListAttachedFiles();

            return Results.Ok(attachedFiles);
        }

        private static IResult ListCVs(ICVService service)
        {
            var cvs = service.ListCVs();

            return Results.Ok(cvs);
        }

        //private static IResult Delete(int id, ICVService service)
        //{
        //    var result = service.Delete(id);
        //
        //    if (!result) Results.BadRequest("Something went wrong");
        //
        //    return Results.Ok(result);
        //}
    }
}