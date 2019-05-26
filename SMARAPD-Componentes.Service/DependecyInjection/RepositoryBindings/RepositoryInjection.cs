using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using SMARAPD_Componentes.Infrastructure.Repository.CategoriaContext;
using SMARAPD_Componentes.Infrastructure.Repository.ComponenteContext;
using SMARAPD_Componentes.Infrastructure.Repository.HistoricoContext;
using SMARAPD_Componentes.Infrastructure.Repository.UsuarioContext;

namespace SMARAPD_Componentes.Service.DependecyInjection.RepositoryBindings
{
    public class RepositoryInjection
    {
        public static void RegisterBindings(IServiceCollection services, IConfiguration configuration)
        {
            services.AddScoped<CategoriaRepository>();
            services.AddScoped<ComponenteRepository>();
            services.AddScoped<ComponenteDependenciaRepository>();
            services.AddScoped<ComponenteTagRepository>();
            services.AddScoped<DependenciaRepository>();
            services.AddScoped<EventoRepository>();
            services.AddScoped<FrameworkRepository>();
            services.AddScoped<MetodoRepository>();
            services.AddScoped<ParametroRepository>();
            services.AddScoped<ParametroEventoRepository>();
            services.AddScoped<ParametroMetodoRepository>();
            services.AddScoped<TagRepository>();
            services.AddScoped<TipoRepository>();
            services.AddScoped<UsuarioRepository>();
            services.AddScoped<HistoricoRepository>();
        }
    }
}
