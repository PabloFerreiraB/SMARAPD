using SMARAPD_Componentes.Common.DTO.ComponenteContext;
using SMARAPD_Componentes.Infrastructure.UnitOfWork.ComponenteContext;
using SMARAPD_Componentes.Service.ApplicationService.Base;
using System.Collections.Generic;
using System.Linq;

namespace SMARAPD_Componentes.Service.ApplicationService.ComponenteContext
{
    public class TagApplicationService : BaseApplicationService
    {
        private readonly ComponenteUnitOfWork _uow;

        private readonly string funcNome = "Tag";

        public TagApplicationService(ComponenteUnitOfWork uow)
        {
            _uow = uow;
        }

        public List<TagGetDTO> GetAll()
        {
            var query = _uow.TagRepository.GetAll().Select(x => new TagGetDTO
            {
                Id = x.Id,
                Nome = x.Nome
            }).ToList();

            VerifyExists(query, funcNome);
            return query;
        }
    }
}
