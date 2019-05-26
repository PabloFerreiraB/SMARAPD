using Microsoft.AspNetCore.Mvc;
using SMARAPD_Componentes.Common.DTO.ComponenteContext;
using SMARAPD_Componentes.Service.ApplicationService.ComponenteContext;
using System.Collections.Generic;

namespace SMARAPD_Componentes.Interface.Controllers
{
    /// <summary>
    /// Responsável por gerenciar dados de Framework.
    /// </summary>
    [Route("Framework")]
    [ApiController]
    public class FrameworkController : ControllerBase
    {
        private readonly FrameworkApplicationService _appService;

        public FrameworkController(FrameworkApplicationService appService)
        {
            _appService = appService;
        }

        /// <summary>
        /// Busca por todos os frameworks registrados.
        /// </summary>
        /// <returns>Lista de Frameworks</returns>
        /// <response code="200">Sucesso na operação</response>
        /// <response code="403">Usuário não autorizado</response>
        /// <response code="500">Demais erros</response>  
        [HttpGet]
        [ProducesResponseType(200)]
        [ProducesResponseType(403)]
        [ProducesResponseType(500)]
        public List<FrameworkGetDTO> GetFrameworks()
        {
            return _appService.GetAll();
        }

        /// <summary>
        /// Adiciona Frameworks a base de dados.
        /// </summary>
        /// <param name="frameworkDto">Dados do Framework</param>
        /// <returns>Framework</returns>
        /// <response code="200">Sucesso na operação</response>
        /// <response code="403">Usuário não autorizado</response>
        /// <response code="409">Em caso de erros de validação</response>
        /// <response code="500">Demais erros</response>  
        [HttpPost]
        [ProducesResponseType(200)]
        [ProducesResponseType(403)]
        [ProducesResponseType(409)]
        [ProducesResponseType(500)]
        public ActionResult PostFramework([FromBody] FrameworkPostDTO frameworkDto)
        {
            _appService.Save(frameworkDto);
            return Ok();
        }

        /// <summary>
        /// Altera dados de Framework.
        /// </summary>
        /// <param name="frameworkId">Identificação do Frameworks</param>
        /// <param name="frameworkDto">Dados do Framework</param>
        /// <returns>Sucesso da Operação</returns>
        /// <response code="200">Sucesso na operação</response>
        /// <response code="403">Usuário não autorizado</response>
        /// <response code="409">Em caso de erros de validação</response>
        /// <response code="500">Demais erros</response>  
        [HttpPut("{frameworkId:int}")]
        [ProducesResponseType(200)]
        [ProducesResponseType(403)]
        [ProducesResponseType(409)]
        [ProducesResponseType(500)]
        public ActionResult PutFramework(int frameworkId, [FromBody] FrameworkPutDTO frameworkDto)
        {
            _appService.Update(frameworkId, frameworkDto);
            return Ok();
        }

        /// <summary>
        /// Remove Framework da base de dados.
        /// </summary>
        /// <param name="frameworkId">Identificação do Framework</param>
        /// <returns>Sucesso da Operação</returns>
        /// <response code="204">Sucesso na operação</response>
        /// <response code="403">Usuário não autorizado</response>
        /// <response code="409">Em caso de erros de validação</response>
        /// <response code="500">Demais erros</response>  
        [HttpDelete("{frameworkId:int}")]
        [ProducesResponseType(204)]
        [ProducesResponseType(403)]
        [ProducesResponseType(409)]
        [ProducesResponseType(500)]
        public ActionResult DeleteFramework(int frameworkId)
        {
            _appService.Delete(frameworkId);
            return NoContent();
        }
    }
}