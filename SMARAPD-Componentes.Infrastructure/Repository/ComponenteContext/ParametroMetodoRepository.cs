using SMARAPD_Componentes.Domain.ComponenteContext;
using SMARAPD_Componentes.Infrastructure.Model;
using SMARAPD_Componentes.Infrastructure.Repository.Base;
using System.Linq;

namespace SMARAPD_Componentes.Infrastructure.Repository.ComponenteContext
{
    public class ParametroMetodoRepository : GenericRepository<ParametroMetodo, ComponenteModel>
    {
        public ParametroMetodoRepository(ComponenteModel context) : base(context)
        {

        }

        public IQueryable<ParametroMetodo> GetById(int metodoId)
        {
            return _context.ParametrosMetodo.Where(x => x.Id == metodoId);
        }

        public IQueryable<ParametroMetodo> GetByIdMetodo(int metodoId)
        {
            return _context.ParametrosMetodo.Where(x => x.MetodoId.Equals(metodoId));
        }

    }
}
