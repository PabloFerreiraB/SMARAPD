using SMARAPD_Componentes.Domain.ComponenteContext;
using SMARAPD_Componentes.Infrastructure.Model;
using SMARAPD_Componentes.Infrastructure.Repository.Base;
using System.Linq;

namespace SMARAPD_Componentes.Infrastructure.Repository.ComponenteContext
{
    public class EventoRepository : GenericRepository<Evento, ComponenteModel>
    {
        public EventoRepository(ComponenteModel context) : base(context)
        {

        }

        public IQueryable<Evento> GetByIdComponente(int componenteId)
        {
            return _context.Eventos.Where(x => x.ComponenteId.Equals(componenteId));
        }

        public IQueryable<Evento> GetById(int id)
        {
            return _context.Eventos.Where(x => x.Id == id);
        }

    }
}
