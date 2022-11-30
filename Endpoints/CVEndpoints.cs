﻿using CViewer.DataAccess.Entities;
using CViewer.Services;
using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.AspNetCore.Authorization;

namespace CViewer.Endpoints
{
    public static class CVEndpoints
    {
        public static void MapCVEndpoints(this WebApplication app)
        {
            app.MapPost("/create_cv_draft",
                    [Authorize(AuthenticationSchemes = JwtBearerDefaults.AuthenticationScheme, Roles = "Administrator")]
                    (CV cv, int applicantId, ICVService service) => CreateCVDraft(cv, applicantId, service))
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
                    (CV newCV, ICVService service) => Update(newCV, service))
                .Accepts<CV>("application/json")
                .Produces<CV>(statusCode: 200, contentType: "application/json");

            app.MapDelete("/delete",
                [Authorize(AuthenticationSchemes = JwtBearerDefaults.AuthenticationScheme, Roles = "Administrator")]
                (int id, ICVService service) => Delete(id, service));
        }

        private static IResult CreateCVDraft(CV cv, int applicantId, ICVService service)
        {
            var result = service.CreateCVDraft(cv, applicantId);
            return Results.Ok(result);
        }

        private static IResult Get(int id, ICVService service)
        {
            var movie = service.Get(id);

            if (movie is null) return Results.NotFound("CV not found");

            return Results.Ok(movie);
        }

        private static IResult List(ICVService service)
        {
            var movies = service.List();

            return Results.Ok(movies);
        }

        private static IResult Update(CV newCV, ICVService service)
        {
            var updatedMovie = service.Update(newCV);

            if (updatedMovie is null) Results.NotFound("CV not found");

            return Results.Ok(updatedMovie);
        }

        private static IResult Delete(int id, ICVService service)
        {
            var result = service.Delete(id);

            if (!result) Results.BadRequest("Something went wrong");

            return Results.Ok(result);
        }
    }
}