using SMARAPD_Componentes.Infrastructure.Repository.CategoriaContext;
using SMARAPD_Componentes.Infrastructure.UnitOfWork.Base;
using Microsoft.Extensions.DependencyInjection;
using System;
using SMARAPD_Componentes.Infrastructure.Model;

namespace SMARAPD_Componentes.Infrastructure.UnitOfWork.CategoriaContext
{
    public class CategoriaUnityOfWork : GenericUnitOfWork
    {
        public CategoriaRepository CategoriaRepository => _serviceProvider.GetService<CategoriaRepository>();

        public CategoriaUnityOfWork(ComponenteModel context, IServiceProvider serviceProvider) : base(context, serviceProvider)
        {

        }
    }
}
