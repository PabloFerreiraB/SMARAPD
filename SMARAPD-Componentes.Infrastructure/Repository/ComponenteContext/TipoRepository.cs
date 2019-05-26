using SMARAPD_Componentes.Domain.ComponenteContext;
using SMARAPD_Componentes.Infrastructure.Model;
using SMARAPD_Componentes.Infrastructure.Repository.Base;
using System.Linq;

namespace SMARAPD_Componentes.Infrastructure.Repository.ComponenteContext
{
    public class TipoRepository : GenericRepository<Tipo, ComponenteModel>
    {

        public TipoRepository(ComponenteModel context) : base(context)
        {

        }

        public IQueryable<Tipo> GetById(int tipoId)
        {
            return _context.Tipos.Where(x => x.Id == tipoId);
        }
    }
}
