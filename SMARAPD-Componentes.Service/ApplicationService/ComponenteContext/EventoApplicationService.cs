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
    public class EventoApplicationService : BaseApplicationService
    {
        private readonly ComponenteUnitOfWork _uow;

        private readonly string funcNome = "Evento";

        public EventoApplicationService(ComponenteUnitOfWork uow)
        {
            _uow = uow;
        }

        public void Save(EventoPostDto eventoPost)
        {
            VerifyExists(eventoPost, CommonMessages.InformacoesEntrada);

            var evento = new Evento
            {
                Nome = eventoPost.Nome,
                Descricao = eventoPost.Descricao,
                Exemplo = eventoPost.Exemplo,
                ComponenteId = eventoPost.ComponenteId,
                DataUltimaAlteracao = DateTime.Now,
                IdUsuarioUltimaAlteracao = IdUsuario,
                ParametrosEvento = eventoPost.ParametrosEvento.Select(y => new ParametroEvento
                {
                    DataUltimaAlteracao = DateTime.Now,
                    IdUsuarioUltimaAlteracao = IdUsuario,
                    Nome = y.Nome,
                    Descricao = y.Descricao,
                    TipoId = y.TipoId,
                    Obrigatorio = y.Obrigatorio
                }).ToList()
            };

            Validate(evento);

            _uow.EventoRepository.Add(evento);

            _uow.Commit();
        }

        private Evento SearchById(int eventoId)
        {
            var obj = _uow.EventoRepository.GetById(eventoId).Include(x => x.ParametrosEvento).ThenInclude(x => x.Tipo).FirstOrDefault();

            VerifyExists(obj, funcNome);

            return obj;
        }

        public EventoGetDto GetById(int eventoId)
        {
            var query = SearchById(eventoId);

            var dto = new EventoGetDto
            {
                Id = query.Id,
                Nome = query.Nome,
                Descricao = query.Descricao,
                Exemplo = query.Exemplo,
                ComponenteId = query.ComponenteId,
                ParametrosEvento = query.ParametrosEvento.Select(y => new ParametroEventoGetDto
                {
                    Id = y.Id,
                    EventoId = y.EventoId,
                    Nome = y.Nome,
                    Descricao = y.Descricao,
                    Tipo = new TipoGetDTO
                    {
                        Id = y.Tipo.Id,
                        Nome = y.Tipo.Nome
                    },
                    Obrigatorio = y.Obrigatorio
                }).ToList()
            };

            VerifyExists(dto, funcNome);

            return dto;
        }

        public List<EventoGetDto> GetByIdComponente(int componenteId)
        {
            var query = _uow.EventoRepository.GetByIdComponente(componenteId).AsNoTracking();

            var dto = query.Select(x => new EventoGetDto
            {
                Id = x.Id,
                Nome = x.Nome,
                Descricao = x.Descricao,
                Exemplo = x.Exemplo,
                ComponenteId = x.ComponenteId,
                ParametrosEvento = x.ParametrosEvento.Select(y => new ParametroEventoGetDto
                {
                    Id = y.Id,
                    EventoId = y.EventoId,
                    Nome = y.Nome,
                    Descricao = y.Descricao,
                    Tipo = new TipoGetDTO
                    {
                        Id = y.Tipo.Id,
                        Nome = y.Tipo.Nome
                    },
                    Obrigatorio = y.Obrigatorio
                }).ToList()
            }).ToList();

            VerifyExists(dto, funcNome);

            return dto;
        }

        public void Update(int eventoId, EventoPutDto eventoPut)
        {
            VerifyExists(eventoPut, CommonMessages.InformacoesEntrada);

            var evento = SearchById(eventoId);

            VerifyExists(evento, funcNome);

            evento.Nome = eventoPut.Nome;
            evento.Descricao = eventoPut.Descricao;
            evento.Exemplo = eventoPut.Exemplo;
            evento.IdUsuarioUltimaAlteracao = IdUsuario;
            evento.DataUltimaAlteracao = DateTime.Now;

            Validate(evento);

            _uow.Commit();
        }

        public void Delete(int eventoId)
        {
            var evento = SearchById(eventoId);

            VerifyExists(evento, funcNome);

            _uow.EventoRepository.Delete(evento);

            _uow.Commit();
        }

        public bool Validate(Evento evento)
        {
            if (evento == null)
                throw new DomainException(string.Format(CommonMessages.Required, "Evento"));
            if (string.IsNullOrWhiteSpace(evento.Nome))
                throw new DomainException(string.Format(CommonMessages.Required, "Nome"));
            return true;
        }
    }
}
