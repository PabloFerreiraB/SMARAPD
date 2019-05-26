using Microsoft.AspNetCore.Mvc;
using SMARAPD_Componentes.Common.DTO.ComponenteContext;
using SMARAPD_Componentes.Service.ApplicationService.ComponenteContext;
using System.Collections.Generic;

namespace SMARAPD_Componentes.Interface.Controllers
{
    /// <summary>
    /// Controlador de Tipos de dados.
    /// </summary>
    [Route("tipo")]
    [ApiController]
    public class TipoController : ControllerBase
    {
        private readonly TipoApplicationService _appService;

        public TipoController(TipoApplicationService appService)
        {
            _appService = appService;
        }

        /// <summary>
        /// Retorna todos os tipos de dados registrados.
        /// </summary>
        /// <returns>Lista de Tipo</returns>
        /// <response code="200">Sucesso na operação</response>
        /// <response code="403">Usuário não autorizado</response>
        /// <response code="409">Em caso de erros de validação</response>
        /// <response code="500">Demais erros</response>  
        [HttpGet]
        [ProducesResponseType(200)]
        [ProducesResponseType(403)]
        [ProducesResponseType(409)]
        [ProducesResponseType(500)]
        [Route("parametro")]
        public List<TipoGetDTO> GetTiposParametro()
        {
            return _appService.GetTiposParametro();
        }

        [HttpGet]
        [ProducesResponseType(200)]
        [ProducesResponseType(403)]
        [ProducesResponseType(409)]
        [ProducesResponseType(500)]
        [Route("retorno")]
        public List<TipoGetDTO> GetTiposRetorno()
        {
            return _appService.GetTiposRetorno();
        }
    }
}
