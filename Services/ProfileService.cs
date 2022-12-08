using CViewer.DataAccess.Entities;
using CViewer.DataAccess.Repositories;
using Microsoft.IdentityModel.Tokens;
using System.IdentityModel.Tokens.Jwt;
using System.Security.Claims;
using System.Text;
using CViewer.DataAccess.DataManager;
using CViewer.Utils;

namespace CViewer.Services
{
    internal sealed class ProfileService : IProfileService
    {
        public int SignUp(UserCredentials userCredentials, out Profile newProfile, out Token token, out string errorMessage, WebApplicationBuilder builder)
        {
            errorMessage = string.Empty;
            newProfile = null;
            token = null;
            Profile existingProfile = DataManager.GetProfileFromMemory(userCredentials.EmailAddress, userCredentials.Password);
            if (existingProfile != null)
            {

                errorMessage = "Email is already used for another account";
                return ErrorCodes.Conflict;
            }

            newProfile = new Profile
            {
                Id = DataManager.GetProfilesCountFromMemory() + 1,
                EmailAddress = userCredentials.EmailAddress,
                Password = userCredentials.Password
            };

            DataManager.AddProfileToMemory(newProfile);

            JwtSecurityToken jwtToken = GenerateToken(newProfile, builder);
            string tokenValue = new JwtSecurityTokenHandler().WriteToken(jwtToken);
            token = new Token()
                { Id = DataManager.GetTokenCount() + 1, Value = tokenValue, ExpirationDateTime = jwtToken.ValidTo };

            DataManager.AddProfileAndToken(newProfile.Id, token);
            return ErrorCodes.Ok;
        }

        // ToDo: Right now we can signin only one device. Like WhatsApp
        public int SignIn(UserCredentials userCredentials, out Profile existingProfile, out Token token, out string errorMessage, WebApplicationBuilder builder)
        {
            errorMessage = string.Empty;
            existingProfile = null;
            token = null;
            if (string.IsNullOrEmpty(userCredentials.EmailAddress) ||
                string.IsNullOrEmpty(userCredentials.Password))
            {
                errorMessage = "Invalid user credentials: at least one is empty";
                return ErrorCodes.BadRequest;
            }

            existingProfile = DataManager.GetProfileFromMemory(userCredentials.EmailAddress, userCredentials.Password);
            if (existingProfile is null)
            {
                errorMessage = "User not found";
                return ErrorCodes.NotFound;
            }

            JwtSecurityToken jwtToken = GenerateToken(existingProfile, builder);
            string tokenValue = new JwtSecurityTokenHandler().WriteToken(jwtToken);
            token = new Token()
                { Id = DataManager.GetTokenCount() + 1, Value = tokenValue, ExpirationDateTime = jwtToken.ValidTo };

            DataManager.SetTokenToProfileBySignIn(existingProfile.Id, token);

            return ErrorCodes.Ok;
        }

        public Profile GetProfile(string applicantOrExpertTokenValue)
        {
            ProfileToToken profileToToken = DataManager.GetProfileAndToken(applicantOrExpertTokenValue);
            if (profileToToken == null)
            {
                return null;
            }

            Profile profile = DataManager.GetProfile(profileToToken.ProfileId);
            if (profile == null)
            {
                return null;
            }

            return profile;
        }

        public Profile GetExpertProfile(int expertId)
        {
            return DataManager.GetExpertProfile(expertId);
        }

        public Profile GetApplicantProfile(int applicantId)
        {
            return DataManager.GetApplicantProfile(applicantId);
        }

        public Profile UpdateProfile(int profileId, string firstName = null, string lastName = null, string biography = null,
            double? rating = null, string email = null, string password = null, Specialization specializationId = null)
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
                profileForUpdate.Specialization = specializationId;
            }

            return profileForUpdate;
        }

        public List<Profile> ListProfiles()
        {
            var profiles = ProfileRepository.Profiles;

            return profiles;
        }

        private JwtSecurityToken GenerateToken(Profile loggedInUser, WebApplicationBuilder builder)
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
                expires: TokenHelper.TokenLifeTimeExpires(),
                notBefore: TokenHelper.TokenLifeTimeNotBefore(),
                signingCredentials: new SigningCredentials(
                    new SymmetricSecurityKey(Encoding.UTF8.GetBytes(builder.Configuration["Jwt:Key"])),
                    SecurityAlgorithms.HmacSha256)
            );

            return token;
        }
    }
}
