using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using SMARAPD_Componentes.Service.ApplicationService.AuthContext;
using SMARAPD_Componentes.Service.ApplicationService.CategoriaContext;
using SMARAPD_Componentes.Service.ApplicationService.ComponenteContext;
using SMARAPD_Componentes.Service.ApplicationService.HistoricoContext;
using SMARAPD_Componentes.Service.ApplicationService.UsuarioContext;


namespace SMARAPD_Componentes.Service.DependecyInjection.ApplicationServiceBindings
{
    public class ApplicationServiceInjection
    {
        public static void RegisterBindings(IServiceCollection services, IConfiguration configuration)
        {
            services.AddScoped<ParametroApplicationService>();
            services.AddScoped<UsuarioApplicationService>();
            services.AddScoped<ComponenteApplicationService>();
            services.AddScoped<MetodoApplicationService>();
            services.AddScoped<EventoApplicationService>();
            services.AddScoped<ParametroEventoApplicationService>();
            services.AddScoped<ParametroMetodoApplicationService>();
            services.AddScoped<CategoriaApplicationService>();
            services.AddScoped<DependenciaApplicationService>();
            services.AddScoped<FrameworkApplicationService>();
            services.AddScoped<TagApplicationService>();
            services.AddScoped<TipoApplicationService>();
            services.AddScoped<AuthApplicationService>();
            services.AddScoped<HistoricoApplicationService>();
        }
    }
}
