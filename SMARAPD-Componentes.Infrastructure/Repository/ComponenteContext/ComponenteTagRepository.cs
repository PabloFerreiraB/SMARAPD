using SMARAPD_Componentes.Domain.ComponenteContext;
using SMARAPD_Componentes.Infrastructure.Model;
using SMARAPD_Componentes.Infrastructure.Repository.Base;
using System.Linq;

namespace SMARAPD_Componentes.Infrastructure.Repository.ComponenteContext
{
    public class ComponenteTagRepository : GenericRepository<ComponenteTag, ComponenteModel>
    {
        public ComponenteTagRepository(ComponenteModel context) : base(context)
        {

        }
    }
}
