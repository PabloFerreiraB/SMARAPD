using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using SMARAPD_Componentes.Infrastructure.Model;
using Microsoft.EntityFrameworkCore;

namespace SMARAPD_Componentes.Service.DependecyInjection
{
    public class ConfigureBindingsDatabaseContext
    {
        public static void RegisterBindings(IServiceCollection services, IConfiguration configuration)
        {
            services
                .AddEntityFrameworkSqlServer()
                .AddDbContext<ComponenteModel>(
                        options => options.UseSqlServer(configuration.GetConnectionString("componenteDB"),
                        providerOptions => providerOptions.EnableRetryOnFailure())
                );
        }
    }
}
