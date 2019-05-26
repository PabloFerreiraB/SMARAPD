using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Options;
using SMARAPD_Componentes.Common.Helper;
using SMARAPD_Componentes.Service.DependecyInjection.ApplicationServiceBindings;
using SMARAPD_Componentes.Service.DependecyInjection.RepositoryBindings;
using SMARAPD_Componentes.Service.DependecyInjection.UnitOfWorkBindings;

namespace SMARAPD_Componentes.Service.DependecyInjection
{
    public class ConfigureBindingsDependencyInjection
    {
        public static void RegisterBindings(IServiceCollection services, IConfiguration configuration)
        {
            ConfigureBindingsDatabaseContext.RegisterBindings(services, configuration);
            services.AddScoped(s => s.GetService<IOptions<ImageConfig>>().Value);
            services.AddScoped(s => s.GetService<IOptions<EmailConfig>>().Value);
            services.AddScoped<ImageUpload>();
            services.AddScoped<EmailService>();

            #region ApplicationService
            ApplicationServiceInjection.RegisterBindings(services, configuration);            
            #endregion



            #region Repository
            RepositoryInjection.RegisterBindings(services, configuration);            
            #endregion



            #region UnitOfWork
            UnitOfWorkInjection.RegisterBindings(services, configuration);                        
            #endregion
        }
    }
}