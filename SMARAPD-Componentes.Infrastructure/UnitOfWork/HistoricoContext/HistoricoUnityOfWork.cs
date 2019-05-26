using SMARAPD_Componentes.Infrastructure.Model;
using SMARAPD_Componentes.Infrastructure.Repository.HistoricoContext;
using SMARAPD_Componentes.Infrastructure.UnitOfWork.Base;
using Microsoft.Extensions.DependencyInjection;
using System;

namespace SMARAPD_Componentes.Infrastructure.UnitOfWork.HistoricoContext
{
    public class HistoricoUnityOfWork : GenericUnitOfWork
    {
        public HistoricoRepository HistoricoRepository => _serviceProvider.GetService<HistoricoRepository>();

        public HistoricoUnityOfWork(ComponenteModel context, IServiceProvider serviceProvider) : base(context, serviceProvider)
        {

        }
    }
}
