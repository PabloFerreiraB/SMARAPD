using SMARAPD_Componentes.Common.DTO.ComponenteContext;
using SMARAPD_Componentes.Common.Exceptions;
using SMARAPD_Componentes.Common.Resource;
using SMARAPD_Componentes.Domain.ComponenteContext;
using SMARAPD_Componentes.Infrastructure.UnitOfWork.ComponenteContext;
using SMARAPD_Componentes.Service.ApplicationService.Base;
using System.Collections.Generic;
using System.Linq;

namespace SMARAPD_Componentes.Service.ApplicationService.ComponenteContext
{
    public class FrameworkApplicationService : BaseApplicationService
    {
        private readonly ComponenteUnitOfWork _uow;

        private readonly string funcNome = "Framework";

        public FrameworkApplicationService(ComponenteUnitOfWork uow)
        {
            _uow = uow;
        }

        private Framework GetById(int frameworkId)
        {
            return _uow.FrameworkRepository.GetById(frameworkId).FirstOrDefault();
        }

        public List<FrameworkGetDTO> GetAll()
        {
            var frameworks = _uow.FrameworkRepository.GetAllReadOnly().Select(f => new FrameworkGetDTO
            {
                Id = f.Id,
                Nome = f.Nome,
                Icone = f.Icone
            }).ToList();

            VerifyExists(frameworks, funcNome);
            return frameworks;
        }

        public void Save(FrameworkPostDTO frameworkDto)
        {
            VerifyExists(frameworkDto, CommonMessages.InformacoesEntrada);
            var framework = new Framework
            {
                Nome = frameworkDto.Nome,
                Icone = frameworkDto.Icone
            };

            Validate(framework);

            _uow.FrameworkRepository.Add(framework);
            _uow.Commit();
        }

        public void Update(int frameworkId, FrameworkPutDTO frameworkDto)
        {
            VerifyExists(frameworkDto, CommonMessages.InformacoesEntrada);

            var framework = GetById(frameworkId);
            VerifyExists(framework, funcNome);

            framework.Nome = frameworkDto.Nome;
            framework.Icone = frameworkDto.Icone;

            Validate(framework);
            
            _uow.Commit();
        }

        public void Delete(int frameworkId)
        {
            var framework = GetById(frameworkId);
            VerifyExists(framework, funcNome);

            _uow.FrameworkRepository.Delete(framework);
            _uow.Commit();
        }

        private bool Validate(Framework framework)
        {
            if (string.IsNullOrWhiteSpace(framework.Nome))
                throw new DomainException(string.Format(CommonMessages.Required, "Nome"));
            if (string.IsNullOrWhiteSpace(framework.Icone))
                throw new DomainException(string.Format(CommonMessages.Required, "Ícone"));
            return true;
        }
    }
}
