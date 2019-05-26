using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.AspNetCore.Builder;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.IdentityModel.Tokens;
using SMARAPD_Componentes.Interface.Auth.Filter;
using System;
using System.Text;

namespace SMARAPD_Componentes.Interface.Auth.Extension
{
    public static class JwtExtension
    {

        public static void AddJwtService(this IServiceCollection services, IConfiguration configuration)
        {
            var setAuth = Convert.ToBoolean(configuration["SetAuth"]);

            if (setAuth)
            {
                #region JWT
                services.AddAuthentication(JwtBearerDefaults.AuthenticationScheme)
                    .AddJwtBearer(options =>
                    {
                        options.TokenValidationParameters = new TokenValidationParameters
                        {
                            ValidateIssuer = true,
                            ValidateAudience = true,
                            ValidateLifetime = true,
                            ValidateIssuerSigningKey = true,
                            
                            ClockSkew = TimeSpan.Zero,                            
                            ValidIssuer = configuration["Jwt:Issuer"],
                            ValidAudience = configuration["Jwt:Audience"],
                            IssuerSigningKey = new SymmetricSecurityKey(Encoding.UTF8.GetBytes(configuration["Jwt:Key"]))
                        };
                    });
                #endregion

                #region To require authorization in all controllers

                services.AddMvc(config =>
                {
                    config.Filters.Add<AuthorizeAdminFilter>();
                });

                #endregion
            }
        }       

        public static void AddJwtApplication(this IApplicationBuilder app, IConfiguration configuration)
        {
            var setAuth = Convert.ToBoolean(configuration["SetAuth"]);

            if (setAuth)
            {
                app.UseAuthentication();                
            }            
        }
    }
}
