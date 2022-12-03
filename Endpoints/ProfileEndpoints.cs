using CViewer.DataAccess.Entities;
using CViewer.Services;
using CViewer.Utils;

namespace CViewer.Endpoints
{
    internal static class ProfileEndpoints
    {
        private static WebApplicationBuilder _builder;

        public static void MapProfileEndpoints(this WebApplication app, WebApplicationBuilder builder)
        {
            _builder = builder;

            app.MapPost("/sign_in",
                    (UserCredentials user, IProfileService service) => SignIn(user, service))
                .Accepts<UserCredentials>("application/json")
                .Produces<string>();

            app.MapPost("/sign_up",
                (UserCredentials userCredentials, IProfileService service) => SignUp(userCredentials, service))
                .Produces<string>();

            app.MapPut("/update_profile",
                (int profileId, IProfileService service, string firstName, string lastName, string biography,
                double? rating, string email, string password, int? specializationId) => UpdateProfile(profileId: profileId, firstName: firstName,
                    lastName: lastName, biography: biography, rating: rating, email: email, password: password, specializationId: specializationId, 
                    service: service))
                .Produces<Profile>();

            app.MapGet("/list_profiles",
                (IProfileService service) => ListProfiles(service))
                .Produces<List<Profile>>();

            app.MapGet("/get_profile",
                    (int profileId, IProfileService service) => GetProfile(profileId, service))
                .Produces<Profile>();
        }

        private static IResult SignIn(UserCredentials user, IProfileService service)
        {
            int status = service.SignIn(user, out var tokenOrMessage, _builder);
            switch (status)
            {
                case ErrorCodes.BadRequest:
                {
                    return Results.BadRequest(tokenOrMessage);
                }
                case ErrorCodes.NotFound:
                {
                    return Results.NotFound(tokenOrMessage);
                }
                case ErrorCodes.Ok:
                {
                    return Results.Ok(tokenOrMessage);
                }
                default:
                {
                    return Results.BadRequest("Unexpected behaviour");
                }
            }
        }

        private static IResult SignUp(UserCredentials userCredentials, IProfileService service)
        {
            int status = service.SignUp(userCredentials, out string tokenOrMessage, _builder);
            switch (status)
            {
                case ErrorCodes.Conflict:
                {
                    return Results.Conflict(tokenOrMessage);
                }
                case ErrorCodes.BadRequest:
                {
                    return Results.BadRequest(tokenOrMessage);
                }
                case ErrorCodes.NotFound:
                {
                    return Results.NotFound(tokenOrMessage);
                }
                case ErrorCodes.Ok:
                {
                    return Results.Ok(tokenOrMessage);
                }
                default:
                {
                    return Results.BadRequest("Unexpected behaviour");
                }
            }
        }

        private static IResult GetProfile(int profileId, IProfileService service)
        {
            var profile = service.GetProfile(profileId);
            if (profile is null) return Results.NotFound("Profile not found");

            return Results.Ok(profile);
        }

        private static IResult UpdateProfile(int profileId, IProfileService service, string firstName = null, string lastName = null, string biography = null,
            double? rating = null, string email = null, string password = null, int? specializationId = null)
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
