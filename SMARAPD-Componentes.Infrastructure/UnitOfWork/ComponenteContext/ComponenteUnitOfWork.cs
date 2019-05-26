using Microsoft.Extensions.DependencyInjection;
using SMARAPD_Componentes.Infrastructure.Model;
using SMARAPD_Componentes.Infrastructure.Repository.CategoriaContext;
using SMARAPD_Componentes.Infrastructure.Repository.ComponenteContext;
using SMARAPD_Componentes.Infrastructure.Repository.HistoricoContext;
using SMARAPD_Componentes.Infrastructure.UnitOfWork.Base;
using System;

namespace SMARAPD_Componentes.Infrastructure.UnitOfWork.ComponenteContext
{
    public class ComponenteUnitOfWork : GenericUnitOfWork
    {
        public ComponenteRepository ComponenteRepository => _serviceProvider.GetService<ComponenteRepository>();

        public CategoriaRepository CategoriaRepository => _serviceProvider.GetService<CategoriaRepository>();

        public FrameworkRepository FrameworkRepository => _serviceProvider.GetService<FrameworkRepository>();

        public TagRepository TagRepository => _serviceProvider.GetService<TagRepository>();

        public TipoRepository TipoRepository => _serviceProvider.GetService<TipoRepository>();

        public MetodoRepository MetodoRepository => _serviceProvider.GetService<MetodoRepository>();

        public EventoRepository EventoRepository => _serviceProvider.GetService<EventoRepository>();

        public ComponenteTagRepository ComponenteTagRepository => _serviceProvider.GetService<ComponenteTagRepository>();

        public DependenciaRepository DependenciaRepository => _serviceProvider.GetService<DependenciaRepository>();

        public ParametroRepository ParametroRepository => _serviceProvider.GetService<ParametroRepository>();

        public ParametroEventoRepository ParametroEventoRepository => _serviceProvider.GetService<ParametroEventoRepository>();

        public ParametroMetodoRepository ParametroMetodoRepository => _serviceProvider.GetService<ParametroMetodoRepository>();

        public ComponenteDependenciaRepository ComponenteDependenciaRepository => _serviceProvider.GetService<ComponenteDependenciaRepository>();

        public HistoricoRepository HistoricoRepository => _serviceProvider.GetService<HistoricoRepository>();

        public ComponenteUnitOfWork(ComponenteModel context, IServiceProvider serviceProvider) : base(context, serviceProvider)
        {

        }
    }
}
