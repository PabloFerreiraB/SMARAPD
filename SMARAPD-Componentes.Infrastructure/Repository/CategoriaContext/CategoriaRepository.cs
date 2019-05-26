using SMARAPD_Componentes.Domain.CategoriaContext;
using SMARAPD_Componentes.Infrastructure.Model;
using SMARAPD_Componentes.Infrastructure.Repository.Base;
using System.Linq;

namespace SMARAPD_Componentes.Infrastructure.Repository.CategoriaContext
{
    public class CategoriaRepository : GenericRepository<Categoria, ComponenteModel>
    {
        public CategoriaRepository(ComponenteModel context) : base(context)
        {

        }

        public IQueryable<Categoria> GetById(int id)
        {
            return _context.Categorias.Where(x => x.Id == id);
        }
    }
}
