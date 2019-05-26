using SMARAPD_Componentes.Domain.ComponenteContext;
using SMARAPD_Componentes.Infrastructure.Model;
using SMARAPD_Componentes.Infrastructure.Repository.Base;
using System.Linq;

namespace SMARAPD_Componentes.Infrastructure.Repository.ComponenteContext
{
    public class FrameworkRepository : GenericRepository<Framework, ComponenteModel>
    {
        public FrameworkRepository(ComponenteModel context) : base(context)
        {

        }

        public IQueryable<Framework> GetById(int id)
        {
            return _context.Frameworks.Where(x => x.Id == id);
        }
    }
}
