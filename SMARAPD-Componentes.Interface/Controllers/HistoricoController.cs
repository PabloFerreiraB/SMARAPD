using Microsoft.AspNetCore.Mvc;
using SMARAPD_Componentes.Common.DTO.HistoricoContext;
using SMARAPD_Componentes.Interface.Auth.CustomAttribute;
using SMARAPD_Componentes.Service.ApplicationService.CategoriaContext;
using SMARAPD_Componentes.Service.ApplicationService.HistoricoContext;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace SMARAPD_Componentes.Interface.Controllers
{
    [Route("historico")]
    [ApiController]
    public class HistoricoController : ControllerBase
    {
        private readonly HistoricoApplicationService _appService;

        public HistoricoController(HistoricoApplicationService appService)
        {
            _appService = appService;
        }

        /// <summary>
        /// Retorna registros de log de componentes
        /// </summary>
        /// <returns>Histórico de componentes</returns>
        /// <response code="200">Sucesso na operação</response>
        /// <response code="403">Usuário não autorizado</response>
        /// <response code="500">Demais erros</response>  
        [AuthorizeVisitante]
        [HttpGet]
        [ProducesResponseType(200)]
        [ProducesResponseType(403)]
        [ProducesResponseType(409)]
        [ProducesResponseType(500)]
        public List<HistoricoGetDTO> GetAll()
        {
            return _appService.GetAll();
        }

        /// <summary>
        /// Retorna registros de log de componentes
        /// </summary>
        /// <returns>Histórico de componentes</returns>
        /// <response code="200">Sucesso na operação</response>
        /// <response code="403">Usuário não autorizado</response>
        /// <response code="500">Demais erros</response>  
        [AuthorizeVisitante]
        [HttpGet("{idComponente:int}")]
        [ProducesResponseType(200)]
        [ProducesResponseType(403)]
        [ProducesResponseType(409)]
        [ProducesResponseType(500)]
        public List<HistoricoGetDTO> GetByIdComponente(int idComponente)
        {
            return _appService.GetByIdComponente(idComponente);
        }
    }
}
