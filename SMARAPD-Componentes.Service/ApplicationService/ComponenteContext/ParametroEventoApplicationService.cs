using Microsoft.EntityFrameworkCore;
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
    public class ParametroEventoApplicationService : BaseApplicationService
    {
        private readonly ComponenteUnitOfWork _uow;

        private readonly string funcNome = "Parâmetro Evento";

        public ParametroEventoApplicationService(ComponenteUnitOfWork uow)
        {
            _uow = uow;
        }

        public List<ParametroEventoGetDto> GetByIdEvento(int eventoId)
        {
            var query = _uow.ParametroEventoRepository.GetByIdEvento(eventoId).AsNoTracking();

            var dto = query.Select(x => new ParametroEventoGetDto
            {
                Id = x.Id,
                EventoId = x.EventoId,
                Nome = x.Nome,
                Descricao = x.Descricao,
                Tipo = new TipoGetDTO
                {
                    Id = x.Tipo.Id,
                    Nome = x.Tipo.Nome
                },
                Obrigatorio = x.Obrigatorio
            }).ToList();

            VerifyExists(dto, funcNome);

            return dto;
        }

        private ParametroEvento SearchById(int parametroEventoId)
        {
            var obj = _uow.ParametroEventoRepository.GetById(parametroEventoId).FirstOrDefault();

            VerifyExists(obj, funcNome);

            return obj;
        }

        public ParametroEventoGetDto GetById(int parametroEventoId)
        {
            var query = SearchById(parametroEventoId);

            var dto = new ParametroEventoGetDto
            {
                Id = query.Id,
                EventoId = query.EventoId,
                Nome = query.Nome,
                Descricao = query.Descricao,
                Tipo = new TipoGetDTO
                {
                    Id = query.Tipo.Id,
                    Nome = query.Tipo.Nome
                },
                Obrigatorio = query.Obrigatorio
            };

            VerifyExists(dto, funcNome);

            return dto;
        }

        public void Save(ParametroEventoPostDto parametroEventoPost)
        {
            VerifyExists(parametroEventoPost, funcNome);

            var parametroEvento = new ParametroEvento
            {
                Nome = parametroEventoPost.Nome,
                Descricao = parametroEventoPost.Descricao,
                TipoId = parametroEventoPost.TipoId,
                Obrigatorio = parametroEventoPost.Obrigatorio,
                EventoId = parametroEventoPost.EventoId,
                DataUltimaAlteracao = DateTime.Now,
                IdUsuarioUltimaAlteracao = IdUsuario
            };

            Validate(parametroEvento);

            _uow.ParametroEventoRepository.Add(parametroEvento);
            _uow.Commit();
        }

        public void Update(int parametroEventoId, ParametroEventoPutDto parametroEventoPut)
        {
            var parametroEvento = SearchById(parametroEventoId);

            VerifyExists(parametroEvento, funcNome);

            parametroEvento.Nome = parametroEventoPut.Nome;
            parametroEvento.Descricao = parametroEventoPut.Descricao;
            parametroEvento.TipoId = parametroEventoPut.TipoId;
            parametroEvento.Obrigatorio = parametroEventoPut.Obrigatorio;
            parametroEvento.DataUltimaAlteracao = DateTime.Now;
            parametroEvento.IdUsuarioUltimaAlteracao = IdUsuario;

            Validate(parametroEvento);

            _uow.Commit();
        }

        public void Delete(int parametroEventoId)
        {
            var parametroEvento = SearchById(parametroEventoId);

            VerifyExists(parametroEvento, funcNome);

            _uow.ParametroEventoRepository.Delete(parametroEvento);
            _uow.Commit();
        }

        public bool Validate(ParametroEvento parametroEvento)
        {
            if (parametroEvento.EventoId == 0)
                throw new DomainException(string.Format(CommonMessages.Required, "Evento"));
            if (string.IsNullOrWhiteSpace(parametroEvento.Nome))
                throw new DomainException(string.Format(CommonMessages.Required, "Nome"));
            if (parametroEvento.TipoId == 0)
                throw new DomainException(string.Format(CommonMessages.Required, "Tipo"));
            return true;
        }
    }
}
