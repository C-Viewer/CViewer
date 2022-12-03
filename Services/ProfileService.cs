using CViewer.DataAccess.Entities;
using CViewer.DataAccess.Repositories;
using Microsoft.IdentityModel.Tokens;
using System.IdentityModel.Tokens.Jwt;
using System.Security.Claims;
using System.Text;
using CViewer.DataAccess.DataRetrieval;
using CViewer.Utils;

namespace CViewer.Services
{
    internal sealed class ProfileService : IProfileService
    {
        public int SignUp(UserCredentials userCredentials, out string tokenOrMessage, WebApplicationBuilder builder)
        {
            Profile existingProfile = DataManager.GetProfileFromMemory(userCredentials.EmailAddress, userCredentials.Password);
            if (existingProfile != null)
            {

                tokenOrMessage = "Email is already used for another account";
                return ErrorCodes.Conflict;
            }

            Profile newProfile = new Profile
            {
                Id = DataManager.GetProfilesCountFromMemory() + 1,
                EmailAddress = userCredentials.EmailAddress,
                Password = userCredentials.Password
            };

            DataManager.AddProfileToMemory(newProfile);

            tokenOrMessage = GenerateToken(newProfile, builder);
            return ErrorCodes.Ok;
        }

        public int SignIn(UserCredentials userCredentials, out string tokenOrMessage, WebApplicationBuilder builder)
        {
            if (string.IsNullOrEmpty(userCredentials.EmailAddress) ||
                string.IsNullOrEmpty(userCredentials.Password))
            {
                tokenOrMessage = "Invalid user credentials: at least one is empty";
                return ErrorCodes.BadRequest;
            }

            Profile loggedInUser = DataManager.GetProfileFromMemory(userCredentials.EmailAddress, userCredentials.Password);
            if (loggedInUser is null)
            {
                tokenOrMessage = "User not found";
                return ErrorCodes.NotFound;
            }

            tokenOrMessage = GenerateToken(loggedInUser, builder);
            return ErrorCodes.Ok;
        }

        public Profile GetProfile(int profileId)
        {
            var profile = ProfileRepository.Profiles.FirstOrDefault(o => o.Id == profileId);

            if (profile is null) return null;

            return profile;
        }

        public Profile UpdateProfile(int profileId, string firstName = null, string lastName = null, string biography = null,
            double? rating = null, string email = null, string password = null, int? specializationId = null)
        {
            var profileForUpdate = ProfileRepository.Profiles.FirstOrDefault(o => o.Id == profileId);

            if (profileForUpdate is null) return null;

            if (firstName != null)
            {
                profileForUpdate.FirstName = firstName;
            }

            if (lastName != null)
            {
                profileForUpdate.LastName = lastName;
            }

            if (biography != null)
            {
                profileForUpdate.Biography = biography;
            }

            if (rating != null)
            {
                profileForUpdate.Rating = (double)rating;
            }

            if (email != null)
            {
                profileForUpdate.EmailAddress = email;
            }

            if (password != null)
            {
                profileForUpdate.Password = password;
            }

            if (specializationId != null)
            {
                profileForUpdate.SpecializationId = (int)specializationId;
            }

            return profileForUpdate;
        }

        public List<Profile> ListProfiles()
        {
            var profiles = ProfileRepository.Profiles;

            return profiles;
        }

        private string GenerateToken(Profile loggedInUser, WebApplicationBuilder builder)
        {
            Claim[] claims = new[]
            {
                // ToDo: Perhaps, we need change chosen properties for Claim.
                new Claim(ClaimTypes.NameIdentifier, $"{loggedInUser.Id.ToString()}:{loggedInUser.EmailAddress}"),
                new Claim(ClaimTypes.Email, loggedInUser.EmailAddress),
                new Claim(ClaimTypes.Name, loggedInUser.FirstName ?? string.Empty),
                new Claim(ClaimTypes.Surname, loggedInUser.LastName ?? string.Empty),
                new Claim(ClaimTypes.Role, loggedInUser.IsExpert == null 
                    ? Role.WithoutRole.ToString() : (bool)loggedInUser.IsExpert ? Role.Expert.ToString() : Role.Applicant.ToString()),
            };

            JwtSecurityToken token = new JwtSecurityToken
            (
                issuer: builder.Configuration["Jwt:Issuer"],
                audience: builder.Configuration["Jwt:Audience"],
                claims: claims,
                expires: DateTime.UtcNow.AddDays(14),
                notBefore: DateTime.UtcNow,
                signingCredentials: new SigningCredentials(
                    new SymmetricSecurityKey(Encoding.UTF8.GetBytes(builder.Configuration["Jwt:Key"])),
                    SecurityAlgorithms.HmacSha256)
            );

            return new JwtSecurityTokenHandler().WriteToken(token);
        }
    }
}
