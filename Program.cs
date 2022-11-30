using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.AspNetCore.Authorization;
using Microsoft.IdentityModel.Tokens;
using Microsoft.OpenApi.Models;
using CViewer.Services;
using System.Text;
using CViewer.DataAccess.Entities;
using CViewer.Endpoints;

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

app.MapProfileEndpoints(builder);

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

app.UseSwaggerUI();

app.Run();
