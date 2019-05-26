using Microsoft.Extensions.DependencyInjection;
using SMARAPD_Componentes.Infrastructure.Model;
using SMARAPD_Componentes.Infrastructure.Repository.UsuarioContext;
using SMARAPD_Componentes.Infrastructure.UnitOfWork.Base;
using System;

namespace SMARAPD_Componentes.Infrastructure.UnitOfWork.AuthContext
{
    public class AuthUnitOfWork : GenericUnitOfWork
    {
        public UsuarioRepository UsuarioRepository => _serviceProvider.GetService<UsuarioRepository>();

        public AuthUnitOfWork(ComponenteModel context, IServiceProvider serviceProvider) : base(context, serviceProvider)
        {

        }
    }
}
