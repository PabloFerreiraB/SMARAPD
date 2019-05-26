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
    public class ParametroApplicationService : BaseApplicationService
    {
        private readonly ComponenteUnitOfWork _uow;

        private readonly string funcNome = "Parâmetro";

        public ParametroApplicationService(ComponenteUnitOfWork uow)
        {
            _uow = uow;
        }

        public List<ParametroGetDTO> GetParametrosByComponente(int componenteId)
        {
            var parametros = _uow.ParametroRepository.GetAll()
                .Where(p => p.ComponenteId == componenteId).AsNoTracking().Select(p => new ParametroGetDTO
                {
                    ComponenteId = p.ComponenteId,
                    Descricao = p.Descricao,
                    Id = p.Id,
                    Nome = p.Nome,
                    Obrigatorio = p.Obrigatorio,
                    Tipo = new TipoGetDTO
                    {
                        Id = p.Tipo.Id,
                        Nome = p.Tipo.Nome
                    }
                }).OrderBy(p => p.Id).ToList();
            VerifyExists(parametros, funcNome);
            return parametros;
        }

        private Parametro GetById(int parametroId)
        {
            var parametro = _uow.ParametroRepository.GetById(parametroId).FirstOrDefault();
            VerifyExists(parametro, funcNome);
            return parametro;
        }

        public void Save(ParametroPostDTO parametroPost)
        {
            VerifyExists(parametroPost, CommonMessages.InformacoesEntrada);
            var parametro = new Parametro
            {
                Nome = parametroPost.Nome,
                Descricao = parametroPost.Descricao,
                TipoId = parametroPost.TipoId,
                Obrigatorio = parametroPost.Obrigatorio,
                ComponenteId = parametroPost.ComponenteId,
                DataUltimaAlteracao = DateTime.Now,
                IdUsuarioUltimaAlteracao = IdUsuario
            };
            Validate(parametro);

            _uow.ParametroRepository.Add(parametro);
            _uow.Commit();
        }

        public void Update(int parametroId, ParametroPutDTO parametroPut)
        {
            VerifyExists(parametroPut, CommonMessages.InformacoesEntrada);
            var parametro = GetById(parametroId);
            VerifyExists(parametro, CommonMessages.NotExists);

            parametro.Nome = parametroPut.Nome;
            parametro.Descricao = parametroPut.Descricao;
            parametro.TipoId = parametroPut.TipoId;
            parametro.Obrigatorio = parametroPut.Obrigatorio;
            parametro.DataUltimaAlteracao = DateTime.Now;
            parametro.IdUsuarioUltimaAlteracao = IdUsuario;

            Validate(parametro);

            _uow.Commit();
        }

        public void Delete(int parametroId)
        {
            var parametro = GetById(parametroId);

            VerifyExists(parametro, funcNome);
            _uow.ParametroRepository.Delete(parametro);
            _uow.Commit();
        }

        public bool Validate(Parametro parametro)
        {
            if (parametro.ComponenteId == 0)
                throw new DomainException(string.Format(CommonMessages.Required, "ComponenteId"));
            if (string.IsNullOrWhiteSpace(parametro.Nome))
                throw new DomainException(string.Format(CommonMessages.Required, "Nome"));
            if (parametro.TipoId == 0)
                throw new DomainException(string.Format(CommonMessages.Required, "TipoId"));
            return true;
        }
    }
}
