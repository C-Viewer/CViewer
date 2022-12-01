using System.IdentityModel.Tokens.Jwt;
using System.Security.Claims;
using System.Text;
using CViewer.DataAccess.Entities;
using CViewer.Services;
using Microsoft.IdentityModel.Tokens;

namespace CViewer.Endpoints
{
    public static class ProfileEndpoints
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
                //[Authorize(AuthenticationSchemes = JwtBearerDefaults.AuthenticationScheme, Roles = "Standard, Administrator")]
                (UserCredentials userCredentials, IProfileService service) => SignUp(userCredentials, service));

            app.MapGet("/get_profile_info",
                //[Authorize(AuthenticationSchemes = JwtBearerDefaults.AuthenticationScheme, Roles = "Standard, Administrator")]
                (int profileId, IProfileService service) => GetProfileInfo(profileId, service));

            app.MapPut("/update_profile_info",
                //[Authorize(AuthenticationSchemes = JwtBearerDefaults.AuthenticationScheme, Roles = "Standard, Administrator")]
                (int profileId, IProfileService service, string firstName, string lastName, string biography,
                double? rating, string email, string password, int? specializationId) => UpdateProfileInfo(profileId: profileId, firstName: firstName,
                    lastName: lastName, biography: biography, rating: rating, email: email, password: password, specializationId: specializationId, 
                    service: service));

            app.MapGet("/list_profiles",
                (IProfileService service) => ListProfiles(service));
        }

        private static IResult SignIn(UserCredentials user, IProfileService service)
        {
            if (!string.IsNullOrEmpty(user.EmailAddress) &&
                !string.IsNullOrEmpty(user.Password))
            {
                var loggedInUser = service.SignIn(user);
                if (loggedInUser is null) return Results.NotFound("Profile not found");

                var claims = new[]
                {
                    new Claim(ClaimTypes.NameIdentifier, loggedInUser.EmailAddress),
                    new Claim(ClaimTypes.Email, loggedInUser.EmailAddress),
                    new Claim(ClaimTypes.GivenName, loggedInUser.FirstName),
                    new Claim(ClaimTypes.Surname, loggedInUser.LastName),
                };

                var token = new JwtSecurityToken
                (
                    issuer: _builder.Configuration["Jwt:Issuer"],
                    audience: _builder.Configuration["Jwt:Audience"],
                    claims: claims,
                    expires: DateTime.UtcNow.AddDays(60),
                    notBefore: DateTime.UtcNow,
                    signingCredentials: new SigningCredentials(
                        new SymmetricSecurityKey(Encoding.UTF8.GetBytes(_builder.Configuration["Jwt:Key"])),
                        SecurityAlgorithms.HmacSha256)
                );

                var tokenString = new JwtSecurityTokenHandler().WriteToken(token);

                return Results.Ok(tokenString);
            }
            return Results.BadRequest("Invalid user credentials");
        }

        private static IResult SignUp(UserCredentials userCredentials, IProfileService service)
        {
            var profile = service.SignUp(userCredentials);
            return Results.Ok(profile);
        }

        private static IResult GetProfileInfo(int profileId, IProfileService service)
        {
            var profile = service.GetProfileInfo(profileId);
            if (profile is null) return Results.NotFound("Profile not found");

            return Results.Ok(profile);
        }

        private static IResult UpdateProfileInfo(int profileId, IProfileService service, string firstName = null, string lastName = null, string biography = null,
            double? rating = null, string email = null, string password = null, int? specializationId = null)
        {
            var updatedProfile = service.UpdateProfileInfo(profileId: profileId, firstName: firstName, lastName: lastName, 
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
