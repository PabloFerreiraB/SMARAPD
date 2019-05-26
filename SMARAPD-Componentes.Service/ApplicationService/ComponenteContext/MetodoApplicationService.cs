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
    public class MetodoApplicationService : BaseApplicationService
    {
        private readonly ComponenteUnitOfWork _uow;

        private readonly string funcNome = "Método";

        public MetodoApplicationService(ComponenteUnitOfWork uow)
        {
            _uow = uow;
        }

        public void Save(MetodoPostDto metodoPost)
        {
            VerifyExists(metodoPost, CommonMessages.InformacoesEntrada);

            var metodo = new Metodo
            {
                Nome = metodoPost.Nome,
                Descricao = metodoPost.Descricao,
                IdTipoRetorno = metodoPost.IdTipoRetorno,
                Exemplo = metodoPost.Exemplo,
                ComponenteId = metodoPost.ComponenteId,
                DataUltimaAlteracao = DateTime.Now,
                IdUsuarioUltimaAlteracao = IdUsuario,                
                ParametrosMetodo = metodoPost.ParametrosMetodo.Select(y => new ParametroMetodo
                {
                    Nome = y.Nome,
                    Descricao = y.Descricao,
                    TipoId = y.TipoId,
                    Obrigatorio = y.Obrigatorio,
                    DataUltimaAlteracao = DateTime.Now,
                    IdUsuarioUltimaAlteracao = IdUsuario
                }).ToList()
            };

            Validate(metodo);

            _uow.MetodoRepository.Add(metodo);

            _uow.Commit();
        }

        private Metodo SearchById(int metodoId)
        {
            var obj = _uow.MetodoRepository.GetById(metodoId)
                .Include(x => x.ParametrosMetodo)
                .Include(x => x.Tipo)
                .FirstOrDefault();

            VerifyExists(obj, funcNome);

            return obj;
        }

        public MetodoGetDto GetById(int metodoId)
        {
            var query = SearchById(metodoId);

            var dto = new MetodoGetDto
            {
                Id = query.Id,
                Nome = query.Nome,
                Descricao = query.Descricao,
                Retorno = query.Tipo.Nome,
                IdTipoRetorno = query.IdTipoRetorno,
                Exemplo = query.Exemplo,
                ComponenteId = query.ComponenteId,
                ParametrosMetodo = query.ParametrosMetodo.Select(y => new ParametroMetodoGetDto
                {
                    Id = y.Id,
                    MetodoId = y.MetodoId,
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

        public List<MetodoGetDto> GetByIdComponente(int componenteId)
        {
            var query = _uow.MetodoRepository.GetByIdComponente(componenteId).AsNoTracking();

            var dto = query.Select(x => new MetodoGetDto
            {
                Id = x.Id,
                Nome = x.Nome,
                Descricao = x.Descricao,
                Retorno = x.Tipo.Nome,
                IdTipoRetorno = x.IdTipoRetorno,
                Exemplo = x.Exemplo,
                ComponenteId = x.ComponenteId,
                ParametrosMetodo = x.ParametrosMetodo.Select(y => new ParametroMetodoGetDto
                {
                    Id = y.Id,
                    MetodoId = y.MetodoId,
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

        public void Update(int metodoId, MetodoPutDto metodoPut)
        {
            VerifyExists(metodoPut, CommonMessages.InformacoesEntrada);

            var metodo = SearchById(metodoId);

            VerifyExists(metodo, funcNome);
            
            metodo.Nome = metodoPut.Nome;
            metodo.Descricao = metodoPut.Descricao;
            metodo.IdTipoRetorno = metodoPut.IdTipoRetorno;
            metodo.Exemplo = metodoPut.Exemplo;
            metodo.DataUltimaAlteracao = DateTime.Now;
            metodo.IdUsuarioUltimaAlteracao = IdUsuario;
            
            Validate(metodo);

            _uow.Commit();
        }

        public void Delete(int metodoId)
        {
            var metodo = SearchById(metodoId);

            VerifyExists(metodo, funcNome);

            _uow.MetodoRepository.Delete(metodo);

            _uow.Commit();
        }

        public bool Validate(Metodo metodo)
        {
            if (metodo == null)
                throw new DomainException(string.Format(CommonMessages.Required, "Método"));
            if (string.IsNullOrWhiteSpace(metodo.Nome))
                throw new DomainException(string.Format(CommonMessages.Required, "Nome"));
            return true;
        }
    }
}
