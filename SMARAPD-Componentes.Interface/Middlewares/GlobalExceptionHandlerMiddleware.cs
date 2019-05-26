using DemoGlobalExceptionHandling.Api.Extensions;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Server.Kestrel.Core;
using Microsoft.Extensions.Logging;
using Newtonsoft.Json;
using SMARAPD_Componentes.Common.Exceptions;
using System;
using System.Threading.Tasks;

namespace DemoGlobalExceptionHandling.Api.Middlewares
{
    public class GlobalExceptionHandlerMiddleware : IMiddleware
    {
        private readonly ILogger<GlobalExceptionHandlerMiddleware> _logger;

        public GlobalExceptionHandlerMiddleware(ILogger<GlobalExceptionHandlerMiddleware> logger)
        {
            _logger = logger;
        }

        public async Task InvokeAsync(HttpContext context, RequestDelegate next)
        {
            try
            {
                await next(context);
            }
            catch (Exception ex)
            {
                _logger.LogError($"Unexpected error: {ex}");
                await HandleExceptionAsync(context, ex);
            }
        }

        private static Task HandleExceptionAsync(HttpContext context, Exception exception)
        {
            var problemDetails = new ProblemDetails
            {
                Instance = context.Request.HttpContext.Request.Path
            };

            if (exception is DomainException domaintException)
            {
                problemDetails.Title = "DomainException";
                problemDetails.Status = StatusCodes.Status409Conflict;
                problemDetails.Detail = exception.Message;
            }
            else
            {
                problemDetails.Title = "Houve um erro inesperado no servidor.";
                problemDetails.Status = StatusCodes.Status500InternalServerError;
                problemDetails.Detail = exception.Message;
            }

            context.Response.StatusCode = problemDetails.Status.Value;
            context.Response.ContentType = "application/problem+json";

            var json = JsonConvert.SerializeObject(problemDetails, SerializerSettings.JsonSerializerSettings);

            return context.Response.WriteAsync(json);
        }
    }
}
