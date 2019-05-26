using SMARAPD_Componentes.Domain.ComponenteContext;
using SMARAPD_Componentes.Infrastructure.Model;
using SMARAPD_Componentes.Infrastructure.Repository.Base;
using System.Linq;

namespace SMARAPD_Componentes.Infrastructure.Repository.ComponenteContext
{
    public class DependenciaRepository : GenericRepository<Dependencia, ComponenteModel>
    {
        public DependenciaRepository(ComponenteModel context) : base(context)
        {

        }

        /// <summary>
        /// Retorna a dependência por Id
        /// </summary>
        /// <param name="idparam"></param>
        /// <returns></returns>
        public IQueryable<Dependencia> GetById(int id)
        {
            return _context.Dependencias.Where(p => p.Id == id);
        }

    }
}
