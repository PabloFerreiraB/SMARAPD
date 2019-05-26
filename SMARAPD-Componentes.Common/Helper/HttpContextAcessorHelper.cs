using Microsoft.AspNetCore.Http;
using Microsoft.Extensions.DependencyInjection;
using System;

namespace SMARAPD_Componentes.Common.Helper
{
    public class HttpContextAcessorHelper
    {

        public static IHttpContextAccessor ContextAcessor;

        public static void Init(IServiceProvider serviceProvider)
        {
            ContextAcessor = serviceProvider.GetService<IHttpContextAccessor>();
        }
    }
}
