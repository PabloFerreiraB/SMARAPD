using SMARAPD_Componentes.Domain.ComponenteContext;
using SMARAPD_Componentes.Infrastructure.Model;
using SMARAPD_Componentes.Infrastructure.Repository.Base;
using System.Linq;

namespace SMARAPD_Componentes.Infrastructure.Repository.ComponenteContext
{
    public class MetodoRepository : GenericRepository<Metodo, ComponenteModel>
    {
        public MetodoRepository(ComponenteModel context) : base(context)
        {

        }

        public IQueryable<Metodo> GetByIdComponente(int componenteId)
        {
            return _context.Metodos.Where(x => x.ComponenteId.Equals(componenteId));
        }

        public IQueryable<Metodo> GetById(int id)
        {
            return _context.Metodos.Where(x => x.Id == id);
        }
    }
}
