using SMARAPD_Componentes.Common.DTO.HistoricoContext;
using SMARAPD_Componentes.Infrastructure.UnitOfWork.HistoricoContext;
using SMARAPD_Componentes.Service.ApplicationService.Base;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace SMARAPD_Componentes.Service.ApplicationService.HistoricoContext
{
    public class HistoricoApplicationService : BaseApplicationService
    {
        private readonly HistoricoUnityOfWork _uow;

        public HistoricoApplicationService(HistoricoUnityOfWork uow)
        {
            _uow = uow;
        }

        public List<HistoricoGetDTO> GetAll()
        {
            var query = _uow.HistoricoRepository.GetAll().Select(x => new HistoricoGetDTO
            {
                Id = x.Id,
                ComponenteId = x.ComponenteId,
                NomeComponente = x.NomeComponente,
                LoginUsuario = x.LoginUsuario,
                Operacao = x.Operacao,
                Data = x.Data,
                Log = x.Log,
                Tabela = x.Tabela
            }).OrderByDescending(x => x.Data).ToList();

            return query;
        }

        public List<HistoricoGetDTO> GetByIdComponente(int idComponente)
        {        
            var query = _uow.HistoricoRepository.GetByIdComponente(idComponente).Select(x => new HistoricoGetDTO
            {
                Id = x.Id,
                ComponenteId = x.ComponenteId,
                NomeComponente = x.NomeComponente,
                LoginUsuario = x.LoginUsuario,
                Operacao = x.Operacao,
                Data = x.Data,
                Log = x.Log,
                Tabela = x.Tabela
            }).OrderByDescending(x => x.Data).ToList();

            return query;
        }
    }
}
