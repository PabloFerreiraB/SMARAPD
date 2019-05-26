using SMARAPD_Componentes.Domain.ComponenteContext;
using SMARAPD_Componentes.Infrastructure.Model;
using SMARAPD_Componentes.Infrastructure.Repository.Base;
using System.Linq;

namespace SMARAPD_Componentes.Infrastructure.Repository.ComponenteContext
{
    public class ParametroEventoRepository : GenericRepository<ParametroEvento, ComponenteModel>
    {
        public ParametroEventoRepository(ComponenteModel context) : base(context)
        {

        }

        public IQueryable<ParametroEvento> GetById(int eventoId)
        {
            return _context.ParametrosEvento.Where(x => x.Id == eventoId);
        }

        public IQueryable<ParametroEvento> GetByIdEvento(int eventoId)
        {
            return _context.ParametrosEvento.Where(x => x.EventoId.Equals(eventoId));
        }
    }
}
