using SMARAPD_Componentes.Domain.HistoricoContext;
using SMARAPD_Componentes.Infrastructure.Model;
using SMARAPD_Componentes.Infrastructure.Repository.Base;
using System.Linq;

namespace SMARAPD_Componentes.Infrastructure.Repository.HistoricoContext
{
    public class HistoricoRepository : GenericRepository<Historico, ComponenteModel>
    {
        public HistoricoRepository(ComponenteModel context) : base(context)
        {

        }

        public IQueryable<Historico> GetByIdComponente(int idComponente)
        {
            return _context.Historico.Where(x => x.ComponenteId == idComponente);
        }
    }
}
