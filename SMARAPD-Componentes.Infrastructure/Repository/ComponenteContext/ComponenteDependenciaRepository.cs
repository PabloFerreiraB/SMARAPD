using SMARAPD_Componentes.Domain.ComponenteContext;
using SMARAPD_Componentes.Infrastructure.Model;
using SMARAPD_Componentes.Infrastructure.Repository.Base;
using System.Linq;

namespace SMARAPD_Componentes.Infrastructure.Repository.ComponenteContext
{
    public class ComponenteDependenciaRepository : GenericRepository<ComponenteDependencia, ComponenteModel>
    {
        public ComponenteDependenciaRepository(ComponenteModel context) : base(context)
        {

        }

        /// <summary>
        /// Retorna a dependência por Id
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        public IQueryable<ComponenteDependencia> GetById(int id)
        {
            return _context.ComponenteDependencias.Where(p => p.Id == id);
        }

        public IQueryable<ComponenteDependencia> GetByIdCompoenenteAndIdDependencia(int idComponente, int idDepenpendencia)
        {
            return _context.ComponenteDependencias.Where(p => p.ComponenteId == idComponente && p.DependenciaId == idDepenpendencia);
        }
    }
}
