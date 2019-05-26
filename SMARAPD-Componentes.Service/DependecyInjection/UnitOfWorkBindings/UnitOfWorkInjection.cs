using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using SMARAPD_Componentes.Infrastructure.UnitOfWork.AuthContext;
using SMARAPD_Componentes.Infrastructure.UnitOfWork.CategoriaContext;
using SMARAPD_Componentes.Infrastructure.UnitOfWork.ComponenteContext;
using SMARAPD_Componentes.Infrastructure.UnitOfWork.HistoricoContext;
using SMARAPD_Componentes.Infrastructure.UnitOfWork.UsuarioContext;

namespace SMARAPD_Componentes.Service.DependecyInjection.UnitOfWorkBindings
{
    public class UnitOfWorkInjection
    {
        public static void RegisterBindings(IServiceCollection services, IConfiguration configuration)
        {
            services.AddScoped<UsuarioUnitOfWork>();
            services.AddScoped<ComponenteUnitOfWork>();
            services.AddScoped<CategoriaUnityOfWork>();
            services.AddScoped<AuthUnitOfWork>();
            services.AddScoped<HistoricoUnityOfWork>();
        }
    }
}
