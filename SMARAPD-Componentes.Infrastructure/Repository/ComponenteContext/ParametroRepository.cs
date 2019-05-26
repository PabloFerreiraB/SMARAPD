using SMARAPD_Componentes.Domain.ComponenteContext;
using SMARAPD_Componentes.Infrastructure.Model;
using SMARAPD_Componentes.Infrastructure.Repository.Base;
using System.Collections.Generic;
using System.Linq;

namespace SMARAPD_Componentes.Infrastructure.Repository.ComponenteContext
{
    public class ParametroRepository : GenericRepository<Parametro, ComponenteModel>
    {
        public ParametroRepository(ComponenteModel context) : base(context)
        {
        }

        public IQueryable<Parametro> GetById(int id)
        {
            return _context.Parametros.Where(x => x.Id == id);
        }
    }
}
