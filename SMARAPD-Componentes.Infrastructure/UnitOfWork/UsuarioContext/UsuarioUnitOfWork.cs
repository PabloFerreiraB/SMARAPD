using Microsoft.Extensions.DependencyInjection;
using SMARAPD_Componentes.Infrastructure.Model;
using SMARAPD_Componentes.Infrastructure.Repository.UsuarioContext;
using SMARAPD_Componentes.Infrastructure.UnitOfWork.Base;
using System;

namespace SMARAPD_Componentes.Infrastructure.UnitOfWork.UsuarioContext
{
    public class UsuarioUnitOfWork : GenericUnitOfWork
    {

        public UsuarioRepository UsuarioRepository => _serviceProvider.GetService<UsuarioRepository>();

        public UsuarioUnitOfWork(ComponenteModel context, IServiceProvider serviceProvider) : base(context, serviceProvider)
        {

        }
    }
}
