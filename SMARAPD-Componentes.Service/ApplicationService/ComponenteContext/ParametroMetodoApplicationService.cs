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
    public class ParametroMetodoApplicationService : BaseApplicationService
    {
        private readonly ComponenteUnitOfWork _uow;

        private readonly string funcNome = "Parâmetro Método";

        public ParametroMetodoApplicationService(ComponenteUnitOfWork uow)
        {
            _uow = uow;
        }

        public List<ParametroMetodoGetDto> GetByIdMetodo(int metodoId)
        {
            var query = _uow.ParametroMetodoRepository.GetByIdMetodo(metodoId).AsNoTracking();

            var dto = query.Select(x => new ParametroMetodoGetDto
            {
                Id = x.Id,
                MetodoId = x.MetodoId,
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

        private ParametroMetodo SearchById(int parametroMetodoId)
        {
            var obj = _uow.ParametroMetodoRepository.GetById(parametroMetodoId).FirstOrDefault();

            VerifyExists(obj, funcNome);

            return obj;
        }

        public ParametroMetodoGetDto GetById(int parametroMetodoId)
        {
            var query = SearchById(parametroMetodoId);

            var dto = new ParametroMetodoGetDto
            {
                Id = query.Id,
                MetodoId = query.MetodoId,
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

        public void Save(ParametroMetodoPostDto parametroMetodoPost)
        {
            VerifyExists(parametroMetodoPost, funcNome);

            var parametroMetodo = new ParametroMetodo
            {
                Nome = parametroMetodoPost.Nome,
                Descricao = parametroMetodoPost.Descricao,
                TipoId = parametroMetodoPost.TipoId,
                Obrigatorio = parametroMetodoPost.Obrigatorio,
                MetodoId = parametroMetodoPost.MetodoId,
                IdUsuarioUltimaAlteracao = IdUsuario,
                DataUltimaAlteracao = DateTime.Now
            };

            Validate(parametroMetodo);

            _uow.ParametroMetodoRepository.Add(parametroMetodo);
            _uow.Commit();
        }

        public void Update(int parametroMetodoId, ParametroMetodoPutDto parametroMetodoPut)
        {
            VerifyExists(parametroMetodoPut, CommonMessages.InformacoesEntrada);
            var parametroMetodo = SearchById(parametroMetodoId);
            VerifyExists(parametroMetodo, funcNome);

            parametroMetodo.Nome = parametroMetodoPut.Nome;
            parametroMetodo.Descricao = parametroMetodoPut.Descricao;
            parametroMetodo.TipoId = parametroMetodoPut.TipoId;
            parametroMetodo.Obrigatorio = parametroMetodoPut.Obrigatorio;
            parametroMetodo.IdUsuarioUltimaAlteracao = IdUsuario;
            parametroMetodo.DataUltimaAlteracao = DateTime.Now;

            Validate(parametroMetodo);

            _uow.Commit();
        }

        public void Delete(int parametroMetodoId)
        {
            var parametroMetodo = SearchById(parametroMetodoId);

            VerifyExists(parametroMetodo, funcNome);

            _uow.ParametroMetodoRepository.Delete(parametroMetodo);
            _uow.Commit();
        }

        public bool Validate(ParametroMetodo parametroMetodo)
        {
            if (parametroMetodo.MetodoId == 0)
                throw new DomainException(string.Format(CommonMessages.Required, "Método"));
            if (string.IsNullOrWhiteSpace(parametroMetodo.Nome))
                throw new DomainException(string.Format(CommonMessages.Required, "Nome"));
            if (parametroMetodo.TipoId == 0)
                throw new DomainException(string.Format(CommonMessages.Required, "Tipo"));
            return true;
        }
    }
}
