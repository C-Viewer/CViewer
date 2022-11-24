using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.AspNetCore.Authorization;
using Microsoft.IdentityModel.Tokens;
using Microsoft.OpenApi.Models;
using MinimalJwt.Models;
using MinimalJwt.Services;
using System.IdentityModel.Tokens.Jwt;
using System.Security.Claims;
using System.Text;
using Microsoft.AspNetCore.Mvc.Infrastructure;

var builder = WebApplication.CreateBuilder(args);

builder.Services.AddSwaggerGen(options =>
{
    options.AddSecurityDefinition("Bearer", new OpenApiSecurityScheme
    {
        Scheme = "Bearer",
        BearerFormat = "JWT",
        In = ParameterLocation.Header,
        Name = "Authorization",
        Description = "Bearer Authentication with JWT Token",
        Type = SecuritySchemeType.Http
    });
    options.AddSecurityRequirement(new OpenApiSecurityRequirement
    {
        {
            new OpenApiSecurityScheme
            {
                Reference = new OpenApiReference
                {
                    Id = "Bearer",
                    Type = ReferenceType.SecurityScheme
                }
            },
            new List<string>()
        }
    });
});

builder.Services.AddAuthentication(JwtBearerDefaults.AuthenticationScheme).AddJwtBearer(options =>
{
    options.TokenValidationParameters = new TokenValidationParameters()
    {
        ValidateActor = true,
        ValidateAudience = true,
        ValidateLifetime = true,
        ValidateIssuerSigningKey = true,
        ValidIssuer = builder.Configuration["Jwt:Issuer"],
        ValidAudience = builder.Configuration["Jwt:Audience"],
        IssuerSigningKey = new SymmetricSecurityKey(Encoding.UTF8.GetBytes(builder.Configuration["Jwt:Key"]))
    };
});
builder.Services.AddAuthorization();

builder.Services.AddEndpointsApiExplorer();
builder.Services.AddSingleton<ICVService, CVService>();
builder.Services.AddSingleton<IProfileService, ProfileService>();

var app = builder.Build();

app.UseSwagger();
app.UseAuthorization();
app.UseAuthentication();

app.MapGet("/", () => "Nice CV, Awesome skills!!!")
    .ExcludeFromDescription();

app.MapPost("/login",
(UserCredentials user, IProfileService service) => Login(user, service))
    .Accepts<UserCredentials>("application/json")
    .Produces<string>();

app.MapPost("/create",
[Authorize(AuthenticationSchemes = JwtBearerDefaults.AuthenticationScheme, Roles = "Administrator")]
(CV movie, ICVService service) => Create(movie, service))
    .Accepts<CV>("application/json")
    .Produces<CV>(statusCode: 200, contentType: "application/json");

app.MapGet("/get",
[Authorize(AuthenticationSchemes = JwtBearerDefaults.AuthenticationScheme, Roles = "Standard, Administrator")]
(int id, ICVService service) => Get(id, service))
    .Produces<CV>();

app.MapGet("/list",
    (ICVService service) => List(service))
    .Produces<List<CV>>(statusCode: 200, contentType: "application/json");

app.MapPut("/update",
[Authorize(AuthenticationSchemes = JwtBearerDefaults.AuthenticationScheme, Roles = "Administrator")]
(CV newMovie, ICVService service) => Update(newMovie, service))
    .Accepts<CV>("application/json")
    .Produces<CV>(statusCode: 200, contentType: "application/json");

app.MapDelete("/delete",
[Authorize(AuthenticationSchemes = JwtBearerDefaults.AuthenticationScheme, Roles = "Administrator")]
(int id, ICVService service) => Delete(id, service));

#region IProfileService

app.MapPost("/createProfile",
    //[Authorize(AuthenticationSchemes = JwtBearerDefaults.AuthenticationScheme, Roles = "Standard, Administrator")]
    (UserCredentials userCredentials, IProfileService service) => CreateProfile(userCredentials, service));

app.MapGet("/getProfileInfo",
    //[Authorize(AuthenticationSchemes = JwtBearerDefaults.AuthenticationScheme, Roles = "Standard, Administrator")]
    (int profileId, IProfileService service) => GetProfileInfo(profileId, service));

app.MapPut("/updateProfileInfo",
    //[Authorize(AuthenticationSchemes = JwtBearerDefaults.AuthenticationScheme, Roles = "Standard, Administrator")]
    (Profile profile, IProfileService service) => UpdateProfileInfo(profile, service));

app.MapGet("/listProfiles",
    (IProfileService service) => ListProfiles(service));

#endregion

IResult Login(UserCredentials user, IProfileService service)
{
    if (!string.IsNullOrEmpty(user.EmailAddress) &&
        !string.IsNullOrEmpty(user.Password))
    {
        var loggedInUser = service.LoginByEmailAndPassword(user);
        if (loggedInUser is null) return Results.NotFound("Profile not found");

        var claims = new[]
        {
            new Claim(ClaimTypes.NameIdentifier, loggedInUser.EmailAddress),
            new Claim(ClaimTypes.Email, loggedInUser.EmailAddress),
            new Claim(ClaimTypes.GivenName, loggedInUser.FirstName),
            new Claim(ClaimTypes.Surname, loggedInUser.LastName),
            new Claim(ClaimTypes.Role, loggedInUser.UserRole.ToString())
        };

        var token = new JwtSecurityToken
        (
            issuer: builder.Configuration["Jwt:Issuer"],
            audience: builder.Configuration["Jwt:Audience"],
            claims: claims,
            expires: DateTime.UtcNow.AddDays(60),
            notBefore: DateTime.UtcNow,
            signingCredentials: new SigningCredentials(
                new SymmetricSecurityKey(Encoding.UTF8.GetBytes(builder.Configuration["Jwt:Key"])),
                SecurityAlgorithms.HmacSha256)
        );

        var tokenString = new JwtSecurityTokenHandler().WriteToken(token);

        return Results.Ok(tokenString);
    }
    return Results.BadRequest("Invalid user credentials");
}

IResult Create(CV movie, ICVService service)
{
    var result = service.Create(movie);
    return Results.Ok(result);
}

IResult Get(int id, ICVService service)
{
    var movie = service.Get(id);

    if (movie is null) return Results.NotFound("CV not found");

    return Results.Ok(movie);
}

IResult List(ICVService service)
{
    var movies = service.List();

    return Results.Ok(movies);
}

IResult Update(CV newMovie, ICVService service)
{
    var updatedMovie = service.Update(newMovie);

    if (updatedMovie is null) Results.NotFound("CV not found");

    return Results.Ok(updatedMovie);
}

IResult Delete(int id, ICVService service)
{
    var result = service.Delete(id);

    if (!result) Results.BadRequest("Something went wrong");

    return Results.Ok(result);
}

#region ProfileServices

IResult CreateProfile(UserCredentials userCredentials, IProfileService service)
{
    var profile = service.CreateProfile(userCredentials);
    return Results.Ok(profile);
}

IResult GetProfileInfo(int profileId, IProfileService service)
{
    var profile = service.GetProfileInfo(profileId);
    if (profile is null) return Results.NotFound("Profile not found");

    return Results.Ok(profile);
}

IResult UpdateProfileInfo(Profile newProfile, IProfileService service)
{
    var updatedProfile = service.UpdateProfileInfo(newProfile);

    if (updatedProfile is null) Results.NotFound("Profile not found");

    return Results.Ok(updatedProfile);
}

IResult ListProfiles(IProfileService service)
{
    return Results.Ok(service.ListProfiles());
}

#endregion

app.UseSwaggerUI();

app.Run();
