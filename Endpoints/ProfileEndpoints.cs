using CViewer.DataAccess.Entities;
using CViewer.DataAccess.TransitObjects;
using CViewer.Services;
using CViewer.Utils;
using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Cors;
using System.ComponentModel.DataAnnotations;

namespace CViewer.Endpoints
{
    internal static class ProfileEndpoints
    {
        private static WebApplicationBuilder _builder;

        public static void MapProfileEndpoints(this WebApplication app, WebApplicationBuilder builder)
        {
            _builder = builder;

            app.MapPost("/sign_in",
                    ([Required] UserCredentials user, IProfileService service) => SignIn(user, service))
                .Accepts<UserCredentials>("application/json")
                .Produces<ComplexObjectProfileAndToken>();

            app.MapPost("/sign_up",
                ([Required] UserCredentials userCredentials, IProfileService service) => SignUp(userCredentials, service))
                .Produces<ComplexObjectProfileAndToken>();

            app.MapPost("/logout",
                [EnableCors(Configuration.CorsPolicyName)]
                [Authorize(AuthenticationSchemes = JwtBearerDefaults.AuthenticationScheme)]
                (HttpContext context, ISecurityService securityService, IProfileService service) =>
                    Logout(context, securityService, service));
            

            app.MapPut("/update_profile",
                ([Required] int profileId, string firstName, string lastName, string biography,
                int? rating, string email, string password, Specialization specializationId, IProfileService service) => UpdateProfile(profileId: profileId, firstName: firstName,
                    lastName: lastName, biography: biography, rating: rating, email: email, password: password, specializationId: specializationId, 
                    service: service))
                .Produces<Profile>();

            app.MapGet("/list_profiles",
                (IProfileService service) => ListProfiles(service))
                .Produces<List<Profile>>();

            app.MapGet("/get_profile",
                    [EnableCors(Configuration.CorsPolicyName)]
                    [Authorize(AuthenticationSchemes = JwtBearerDefaults.AuthenticationScheme)]
                    (HttpContext context, ISecurityService securityService, IProfileService service) => GetProfile(context, securityService, service))
                .Produces<Profile>();

            app.MapGet("/get_profile_by_id",
                    [EnableCors(Configuration.CorsPolicyName)]
                    [Authorize(AuthenticationSchemes = JwtBearerDefaults.AuthenticationScheme)]
                    (int profileId, HttpContext context, ISecurityService securityService, IProfileService service) =>
                        GetProfile(profileId, context, securityService, service))
                .Produces<Profile>();

            app.MapPost("/add_report_to_profile",
                [EnableCors(Configuration.CorsPolicyName)]
                [Authorize(AuthenticationSchemes = JwtBearerDefaults.AuthenticationScheme)]
                (string? comment, [Required] int peopleId, [Required] int authorId, [Required] int mark, HttpContext context, ISecurityService securityService, IProfileService service) => 
                AddReportToProfile(comment, peopleId, authorId, mark, context, securityService, service));

            //app.MapGet("/get_expert_profile",
            //        [EnableCors(Configuration.CorsPolicyName)]
            //        ([Required] int expertId, IProfileService service) => GetExpertProfile(expertId, service))
            //    .Produces<Profile>();
            //
            //app.MapGet("/get_applicant_profile",
            //        [EnableCors(Configuration.CorsPolicyName)]
            //        [Authorize(AuthenticationSchemes = JwtBearerDefaults.AuthenticationScheme)]
            //([Required] int applicantId, HttpContext context, ISecurityService securityService, IProfileService service) => 
            //    GetApplicantProfile(applicantId, context, securityService, service))
            //    .Produces<Profile>();
        }

        private static IResult SignIn(UserCredentials user, IProfileService service)
        {
            int status = service.SignIn(user, out Profile profile, out Token token, out string errorMessage, _builder);
            switch (status)
            {
                case ErrorCodes.BadRequest:
                {
                    return Results.BadRequest(errorMessage);
                }
                case ErrorCodes.NotFound:
                {
                    return Results.NotFound(errorMessage);
                }
                case ErrorCodes.Ok:
                {
                    return Results.Ok(new ComplexObjectProfileAndToken { Profile = profile, Token = token });
                }
                default:
                {
                    return Results.BadRequest("Unexpected behaviour");
                }
            }
        }

        private static IResult Logout(HttpContext context, ISecurityService securityService, IProfileService service)
        {
            string token = TokenHelper.GetToken(context);
            if (!securityService.CheckAccess(token))
            {
                return Results.Unauthorized();
            }

            service.Logout(token);

            return Results.Ok("Logout success");
        }

        private static IResult SignUp(UserCredentials userCredentials, IProfileService service)
        {
            int status = service.SignUp(userCredentials, out Profile profile, out Token token, out string errorMessage, _builder);
            switch (status)
            {
                case ErrorCodes.Conflict:
                {
                    return Results.Conflict(errorMessage);
                }
                case ErrorCodes.BadRequest:
                {
                    return Results.BadRequest(errorMessage);
                }
                case ErrorCodes.NotFound:
                {
                    return Results.NotFound(errorMessage);
                }
                case ErrorCodes.Ok:
                {
                    return Results.Ok(new ComplexObjectProfileAndToken { Profile = profile, Token = token });
                }
                default:
                {
                    return Results.BadRequest("Unexpected behaviour");
                }
            }
        }

        private static IResult GetProfile(HttpContext context, ISecurityService securityService, IProfileService service)
        {
            string applicantOrExpertToken = TokenHelper.GetToken(context);
            if (!securityService.CheckAccess(applicantOrExpertToken))
            {
                return Results.Unauthorized();
            }

            Profile profile = service.GetProfile(applicantOrExpertToken);
            if (profile is null)
            {
                return Results.NotFound("Profile not found");
            }

            return Results.Ok(profile);
        }

        private static IResult GetProfile(int profileId, HttpContext context, ISecurityService securityService, IProfileService service)
        {
            string token = TokenHelper.GetToken(context);
            if (!securityService.CheckAccess(token))
            {
                return Results.Unauthorized();
            }

            Profile profile = service.GetProfile(profileId);
            if (profile is null)
            {
                return Results.NotFound("Profile not found");
            }

            return Results.Ok(profile);
        }

        private static IResult GetExpertProfile(int expertId, IProfileService service)
        {
            Profile profile = service.GetExpertProfile(expertId);
            if (profile is null)
            {
                return Results.NotFound("Expert profile not found");
            }

            return Results.Ok(profile);
        }

        private static IResult GetApplicantProfile(int applicantId, HttpContext context, ISecurityService securityService, IProfileService service)
        {
            if (!securityService.CheckAccess(TokenHelper.GetToken(context)))
            {
                return Results.Unauthorized();
            }

            Profile profile = service.GetApplicantProfile(applicantId);
            if (profile is null)
            {
                return Results.NotFound("Applicant profile not found");
            }

            return Results.Ok(profile);
        }

        private static IResult UpdateProfile(int profileId, IProfileService service, string firstName = null, string lastName = null, string biography = null,
            int? rating = null, string email = null, string password = null, Specialization specializationId = null)
        {
            var updatedProfile = service.UpdateProfile(profileId: profileId, firstName: firstName, lastName: lastName, 
                biography: biography, rating: rating, email: email, password: password, specializationId: specializationId);

            if (updatedProfile is null) Results.NotFound("Profile not found");

            return Results.Ok(updatedProfile);
        }

        private static IResult ListProfiles(IProfileService service)
        {
            return Results.Ok(service.ListProfiles());
        }

        private static IResult AddReportToProfile(string? comment, int peopleId, int authorId, int mark, HttpContext context, ISecurityService securityService, IProfileService service)
        {
            string token = TokenHelper.GetToken(context);
            if (!securityService.CheckAccess(token)) return Results.Unauthorized();
            service.AddReportToProfile(comment, peopleId, authorId, mark);
            return Results.Ok();
        }
    }
}
