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
                (HttpContext context, IProfileService service) =>
                    Logout(context, service));
            

            app.MapPut("/update_profile",
                ([Required] int profileId, string firstName, string lastName, string biography,
                double? rating, string email, string password, Specialization specializationId, IProfileService service) => UpdateProfile(profileId: profileId, firstName: firstName,
                    lastName: lastName, biography: biography, rating: rating, email: email, password: password, specializationId: specializationId, 
                    service: service))
                .Produces<Profile>();

            app.MapGet("/list_profiles",
                (IProfileService service) => ListProfiles(service))
                .Produces<List<Profile>>();

            app.MapGet("/get_profile",
                    [EnableCors(Configuration.CorsPolicyName)]
                    [Authorize(AuthenticationSchemes = JwtBearerDefaults.AuthenticationScheme)]
                    (HttpContext context, IProfileService service) => GetProfile(context, service))
                .Produces<Profile>();

            app.MapGet("/get_expert_profile",
                    [EnableCors(Configuration.CorsPolicyName)]
                    ([Required] int expertId, IProfileService service) => GetExpertProfile(expertId, service))
                .Produces<Profile>();

            app.MapGet("/get_applicant_profile",
                    [EnableCors(Configuration.CorsPolicyName)]
                    [Authorize(AuthenticationSchemes = JwtBearerDefaults.AuthenticationScheme)]
            ([Required] int applicantId, IProfileService service) => GetApplicantProfile(applicantId, service))
                .Produces<Profile>();
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

        private static IResult Logout(HttpContext context, IProfileService service)
        {
            bool profileFound = service.Logout(TokenHelper.GetToken(context));
            if (!profileFound)
            {
                return Results.Unauthorized();
            }

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

        private static IResult GetProfile(HttpContext context, IProfileService service)
        {
            string applicantOrExpertToken = TokenHelper.GetToken(context);
            Profile profile = service.GetProfile(applicantOrExpertToken);
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

        private static IResult GetApplicantProfile(int applicantId, IProfileService service)
        {
            Profile profile = service.GetApplicantProfile(applicantId);
            if (profile is null)
            {
                return Results.NotFound("Applicant profile not found");
            }

            return Results.Ok(profile);
        }

        private static IResult UpdateProfile(int profileId, IProfileService service, string firstName = null, string lastName = null, string biography = null,
            double? rating = null, string email = null, string password = null, Specialization specializationId = null)
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
    }
}
