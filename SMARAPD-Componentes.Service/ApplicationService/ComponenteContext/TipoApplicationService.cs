using SMARAPD_Componentes.Common.DTO.ComponenteContext;
using SMARAPD_Componentes.Infrastructure.UnitOfWork.ComponenteContext;
using SMARAPD_Componentes.Service.ApplicationService.Base;
using System.Collections.Generic;
using System.Linq;

namespace SMARAPD_Componentes.Service.ApplicationService.ComponenteContext
{
    public class TipoApplicationService : BaseApplicationService
    {
        private readonly ComponenteUnitOfWork _uow;

        private readonly string funcNome = "Tipo de dado";

        public TipoApplicationService(ComponenteUnitOfWork uow)
        {
            _uow = uow;
        }

        public List<TipoGetDTO> GetTiposParametro()
        {
            var tipos = _uow.TipoRepository.GetAllReadOnly()
                .Where(x => x.TipoParametro)
                .Select(t => new TipoGetDTO
                {
                    Id = t.Id,
                    Nome = t.Nome
                })
                .ToList();

            VerifyExists(tipos, funcNome);
            return tipos;
        }

        public List<TipoGetDTO> GetTiposRetorno()
        {
            var tipos = _uow.TipoRepository.GetAllReadOnly()
                .Where(x => x.TipoRetorno)
                .Select(t => new TipoGetDTO
                {
                    Id = t.Id,
                    Nome = t.Nome
                }).ToList();

            VerifyExists(tipos, funcNome);
            return tipos;
        }
    }
}
