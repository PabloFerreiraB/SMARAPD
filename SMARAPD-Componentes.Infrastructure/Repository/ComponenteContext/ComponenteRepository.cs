using SMARAPD_Componentes.Domain.ComponenteContext;
using SMARAPD_Componentes.Infrastructure.Model;
using SMARAPD_Componentes.Infrastructure.Repository.Base;
using System.Linq;

namespace SMARAPD_Componentes.Infrastructure.Repository.ComponenteContext
{
    public class ComponenteRepository : GenericRepository<Componente, ComponenteModel>
    {
        public ComponenteRepository(ComponenteModel context) : base(context)
        {

        }

        public IQueryable<Componente> GetById(int id)
        {
            return _context.Componentes.Where(x => x.Id == id);
        }
    }
}
