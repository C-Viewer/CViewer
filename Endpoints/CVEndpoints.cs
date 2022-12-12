using System.ComponentModel.DataAnnotations;
using CViewer.DataAccess;
using CViewer.DataAccess.DataManager;
using CViewer.DataAccess.Entities;
using CViewer.DataAccess.InnerEntities;
using CViewer.DataAccess.Repositories;
using CViewer.DataAccess.TransitObjects;
using CViewer.Services;
using CViewer.Utils;
using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Cors;
using Microsoft.AspNetCore.Mvc;
using Validator = CViewer.Validation.Validator;

namespace CViewer.Endpoints
{
    internal static class CVEndpoints
    {
        public static void MapCVEndpoints(this WebApplication app)
        {
            app.MapGet("/get_cv",
                    ([Required] int cvId, ICVService service) => GetCV(cvId, service))
                .Produces<CV>();

            //app.MapGet("/get_cv_history",
            //        ([Required] int cvHistoryId, ICVService service) => GetCVHistory(cvHistoryId, service))
            //    .Produces<CVHistory>();

            //app.MapGet("/get_attached_file",
            //        ([Required] int attachedFileId, ICVService service) => GetAttachedFile(attachedFileId, service))
            //    .Produces<AttachedFile>();

            app.MapPost("/pin_file_to_draft",
                [EnableCors(Configuration.CorsPolicyName)]
                [Authorize(AuthenticationSchemes = JwtBearerDefaults.AuthenticationScheme)]
                ([Required] IFormFile fileData, [Required] string fileName,
                    HttpContext context, ISecurityService securityService, ICVService service) => Results.Ok());
                    //PinFileToDraft(fileData, fileName, context, securityService, service));

            app.MapPost("/create_cv_draft",
                    [EnableCors(Configuration.CorsPolicyName)]
                    [Authorize(AuthenticationSchemes = JwtBearerDefaults.AuthenticationScheme)]
                    ([Required] CV cv, [Required] int applicantId,
                            HttpContext context, ISecurityService securityService, ICVService service) =>
                        CreateCVDraft(cv, applicantId, context, securityService, service))
                .Accepts<CV>("application/json")
                .Produces<CV>(statusCode: 200, contentType: "application/json");

            app.MapPost("/update_cv_info",
                ([Required] int cvId, string title, TransitObjectSpecializationAndCVTags updateCVInfoParams,
                        string description, ICVService service) =>
                    UpdateCVInfo(cvId: cvId, service: service, title: title, 
                        specialization: updateCVInfoParams.Specialization, tags: updateCVInfoParams.CVTags, description: description));

            app.MapGet("/add_event_to_history",
                [EnableCors(Configuration.CorsPolicyName)]
                [Authorize(AuthenticationSchemes = JwtBearerDefaults.AuthenticationScheme)]
                ([Required] [FromBody] CVHistoryParameter cvHistoryParameter, HttpContext context, ISecurityService securityService, ICVService service) =>
                    AddEventToHistory(cvHistoryParameter: cvHistoryParameter, service: service, context: context, securityService: securityService));

            app.MapGet("/list_CVs",
                    [EnableCors(Configuration.CorsPolicyName)]
                    [Authorize(AuthenticationSchemes = JwtBearerDefaults.AuthenticationScheme)]
                    (HttpContext context, ISecurityService securityService, ICVService service) => ListCVs(context, securityService, service))
                .Produces<List<CV>>(statusCode: 200, contentType: "application/json");

            app.MapGet("/get_cv_status",
                    [EnableCors(Configuration.CorsPolicyName)]
                    ([Required] int cvId, ICVService service) => GetCVStatus(cvId, service))
                .Produces<CVStatusType>();
            
            app.MapGet("/list_CVs_for_profile",
                    [EnableCors(Configuration.CorsPolicyName)]
                    [Authorize(AuthenticationSchemes = JwtBearerDefaults.AuthenticationScheme)]
                    (HttpContext context, ISecurityService securityService, ICVService service) => ListCVsForProfile(context, securityService, service))
                .Produces<List<CV>>(statusCode: 200, contentType: "application/json");

            app.MapGet("/list_CV_tags",
                (ICVService service) => ListCVTags(service))
                .Produces<List<CVTag>>();

            app.MapGet("/list_CV_statuses",
                (ICVService service) => ListCVStatusesTags(service))
                .Produces<List<EntitiesHelper.CVStatusTypeObject>>();

            app.MapGet("/list_specializations",
                (ICVService service) => ListSpecializations(service));

            //app.MapGet("/list_CV_histories",
            //        (ICVService service) => ListCVHistories(service))
            //    .Produces<List<CVHistory>>(statusCode: 200, contentType: "application/json");

            app.MapGet("/list_concrete_CV_histories",
                    [EnableCors(Configuration.CorsPolicyName)]
                    [Authorize(AuthenticationSchemes = JwtBearerDefaults.AuthenticationScheme)]
                    ([Required] int cvId, HttpContext context, ISecurityService securityService, ICVService service) => ListCVHistories(cvId, context, securityService, service))
                .Produces<List<CVHistory>>(statusCode: 200, contentType: "application/json");

            //app.MapGet("/list_attached_files",
            //        (ICVService service) => ListAttachedFiles(service))
            //    .Produces<List<AttachedFile>>(statusCode: 200, contentType: "application/json");

            //app.MapDelete("/delete",
            //    [Authorize(AuthenticationSchemes = JwtBearerDefaults.AuthenticationScheme, Roles = "Administrator")]
            //    (int id, ICVService service) => Delete(id, service));
        }

        private static IResult CreateCVDraft(CV cv, int applicantId, HttpContext context, ISecurityService securityService, 
            ICVService service)
        {
            if (!securityService.CheckAccess(TokenHelper.GetToken(context)))
            {
                return Results.Unauthorized();
            }

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

        private static IResult AddEventToHistory(CVHistoryParameter cvHistoryParameter, HttpContext context, ISecurityService securityService, 
            ICVService service)
        {
            if (!securityService.CheckAccess(TokenHelper.GetToken(context)))
            {
                return Results.Unauthorized();
            }

            CVHistory cvHistory = service.AddEventToHistory(cvHistoryParameter);

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

        private static IResult ListCVStatusesTags(ICVService service)
        {
            return Results.Ok(service.ListCVStatuses());
        }
        
        private static IResult ListSpecializations(ICVService service)
        {
            return Results.Ok(service.ListSpecializations());
        }

        private static IResult ListCVHistories(int cvId, HttpContext context, ISecurityService securityService, ICVService service)
        {
            if (!securityService.CheckAccess(TokenHelper.GetToken(context)))
            {
                return Results.Unauthorized();
            }

            string applicantOrExpertToken = TokenHelper.GetToken(context);
            List<int> profilesIds = DataManager.GetProfilesIdsForCv(cvId);
            if (profilesIds.Count == 1 && profilesIds[0] == DataManager.EntityNotFound)
            {
                return Results.BadRequest($"Cannot find CV corresponding current `{nameof(cvId)}`");
            }

            if (!Validator.ValidateTokenWithProfiles(applicantOrExpertToken, profilesIds))
            {
                return Results.BadRequest("You have not access to this CV history");
            }

            List<CVHistory> concreteCvHistories = service.ListCVHistories(cvId);
            return Results.Ok(concreteCvHistories);
        }

        private static IResult ListCVHistories(ICVService service)
        {
            List<CVHistory> cvHistories = service.ListCVHistories();

            return Results.Ok(cvHistories);
        }

        private static IResult ListAttachedFiles(ICVService service)
        {
            var attachedFiles = service.ListAttachedFiles();

            return Results.Ok(attachedFiles);
        }

        private static IResult ListCVs(HttpContext context, ISecurityService securityService, ICVService service)
        {
            if (!securityService.CheckAccess(TokenHelper.GetToken(context)))
            {
                return Results.Unauthorized();
            }

            var cvs = service.ListCVs();

            return Results.Ok(cvs);
        }

        private static IResult GetCVStatus(int cvId, ICVService service)
        {
            CVStatusType cvStatus = service.GetCVStatus(cvId);
            return Results.Ok(cvStatus);
        }
        
        private static IResult ListCVsForProfile(HttpContext context, ISecurityService securityService, ICVService service)
        {
            if (!securityService.CheckAccess(TokenHelper.GetToken(context)))
            {
                return Results.Unauthorized();
            }

            string applicantOrExpertToken = TokenHelper.GetToken(context);
            List<CV> profileCVs = service.ListCVsForProfile(applicantOrExpertToken);

            return Results.Ok(profileCVs);
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