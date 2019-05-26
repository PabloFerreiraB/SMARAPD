using SMARAPD_Componentes.Common.DTO.ComponenteContext;
using SMARAPD_Componentes.Common.Exceptions;
using SMARAPD_Componentes.Common.Resource;
using SMARAPD_Componentes.Domain.ComponenteContext;
using SMARAPD_Componentes.Infrastructure.UnitOfWork.ComponenteContext;
using SMARAPD_Componentes.Service.ApplicationService.Base;
using System;
using System.Collections.Generic;
using System.Linq;

namespace SMARAPD_Componentes.Service.ApplicationService.ComponenteContext
{
    public class DependenciaApplicationService : BaseApplicationService
    {
        private readonly ComponenteUnitOfWork _uow;

        private readonly string funcNome = "Dependência";

        public DependenciaApplicationService(ComponenteUnitOfWork uow)
        {
            _uow = uow;
        }

        public List<DependenciaGetDTO> GetAll()
        {
            var query = _uow.DependenciaRepository.GetAll().Select(p => new DependenciaGetDTO
            {
                Id = p.Id,
                Nome = p.Nome,
                Status = p.Status,
                Versao = p.Versao,
                Url = p.Url
            })
            .ToList();

            return query;
        }

        public DependenciaGetDTO GetById(int id)
        {
            var dto = _uow.DependenciaRepository.GetById(id).Select(p => new DependenciaGetDTO
            {
                Id = p.Id,
                Nome = p.Nome,
                Versao = p.Versao,
                Status = p.Status,
                Url = p.Url

            }).FirstOrDefault();

            VerifyExists(dto, funcNome);

            return dto;
        }

        public void Save(DependenciaPostDTO dto)
        {
            VerifyExists(dto, CommonMessages.InformacoesEntrada);

            var dependencia = new Dependencia
            {
                Nome = dto.Nome,
                Versao = dto.Versao,
                Status = dto.Status,
                Url = dto.Url
            };

            Validate(dependencia);

            _uow.DependenciaRepository.Add(dependencia);
            _uow.Commit();
        }

        public void Associar(ComponenteDependenciaPostDTO dto)
        {
            VerifyExists(dto, CommonMessages.InformacoesEntrada);

            var componente = _uow.ComponenteRepository.GetById(dto.ComponenteId).FirstOrDefault();

            VerifyExists(componente, "Componente");

            componente.ComponenteDependencias.Add(new ComponenteDependencia
            {
                DependenciaId = dto.DependenciaId,
                DataUltimaAlteracao = DateTime.Now,
                IdUsuarioUltimaAlteracao = IdUsuario
            });

            //_uow.DependenciaRepository.Add(dependencia);
            _uow.Commit();
        }

        public void Desassociar(int idComponente, int idDepenpendencia)
        {
            var componente = _uow.ComponenteDependenciaRepository.GetByIdCompoenenteAndIdDependencia(idComponente, idDepenpendencia).FirstOrDefault();

            VerifyExists(componente, "Componente Dependência");

            _uow.ComponenteDependenciaRepository.Delete(componente);

            _uow.Commit();
        }

        public void Update(int id, DependenciaPutDTO dto)
        {
            VerifyExists(dto, CommonMessages.InformacoesEntrada);

            var dependencia = _uow.DependenciaRepository.GetById(id).FirstOrDefault();

            VerifyExists(dto, funcNome);

            dependencia.Nome = dto.Nome;
            dependencia.Versao = dto.Versao;
            dependencia.Status = dto.Status;
            dependencia.Url = dto.Url;

            Validate(dependencia);

            _uow.Commit();
        }

        public void Delete(int id)
        {
            var dto = _uow.DependenciaRepository.GetById(id).FirstOrDefault();

            VerifyExists(dto, funcNome);

            _uow.DependenciaRepository.Delete(dto);

            _uow.Commit();
        }

        public void Validate(Dependencia dependencia)
        {
            if (string.IsNullOrWhiteSpace(dependencia.Nome))
                throw new DomainException(string.Format(CommonMessages.Required, "Nome"));

            if (string.IsNullOrWhiteSpace(dependencia.Versao))
                throw new DomainException(string.Format(CommonMessages.Required, "Versão"));

            if (string.IsNullOrWhiteSpace(dependencia.Status))
                throw new DomainException(string.Format(CommonMessages.Required, "Status"));
        }

    }
}
