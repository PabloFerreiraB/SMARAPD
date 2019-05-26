using SMARAPD_Componentes.Domain.ComponenteContext;
using SMARAPD_Componentes.Infrastructure.Model;
using SMARAPD_Componentes.Infrastructure.Repository.Base;
using System.Linq;

namespace SMARAPD_Componentes.Infrastructure.Repository.ComponenteContext
{
    public class TagRepository : GenericRepository<Tag, ComponenteModel>
    {
        public TagRepository(ComponenteModel context) : base(context)
        {

        }

        public IQueryable<Tag> GetByNome(string nome)
        {
            return _context.Tags.Where(x => x.Nome.ToLower() == nome.ToLower());
        }
    }
}
