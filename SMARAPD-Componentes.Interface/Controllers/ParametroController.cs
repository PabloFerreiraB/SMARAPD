using Microsoft.AspNetCore.Mvc;
using SMARAPD_Componentes.Common.DTO.ComponenteContext;
using SMARAPD_Componentes.Service.ApplicationService.ComponenteContext;
using System.Collections.Generic;

namespace SMARAPD_Componentes.Interface.Controllers
{
    /// <summary>
    /// Gerencia dados relacionados a parâmetros de um componente.
    /// </summary>
    [Route("parametro")]
    [ApiController]
    public class ParametroController : ControllerBase
    {
        private readonly ParametroApplicationService _appService;

        public ParametroController(ParametroApplicationService appService)
        {
            _appService = appService;
        }

        /// <summary>
        /// Busca os parâmetros pertencentes a um componente.
        /// </summary>
        /// <param name="componenteId">Identificação do componente para busca</param>
        /// <returns>Lista de parâmetros</returns>
        /// <response code="200">Sucesso na operação</response>
        /// <response code="403">Usuário não autorizado</response>
        /// <response code="409">Em caso de erros de validação</response>
        /// <response code="500">Demais erros</response>  
        [HttpGet("getbyidcomponente/{componenteId:int}")]
        [ProducesResponseType(200)]
        [ProducesResponseType(403)]
        [ProducesResponseType(409)]
        [ProducesResponseType(500)]
        public List<ParametroGetDTO> GetParametrosByComponente(int componenteId)
        {
            return _appService.GetParametrosByComponente(componenteId);
        }

        /// <summary>
        /// Adiciona parâmetro a um componente.
        /// </summary>
        /// <param name="parametroPost">Dados do parâmetro</param>
        /// <returns>Sucesso da operação</returns>
        /// <response code="200">Sucesso na operação</response>
        /// <response code="403">Usuário não autorizado</response>
        /// <response code="409">Em caso de erros de validação</response>
        /// <response code="500">Demais erros</response>  
        [HttpPost]
        [ProducesResponseType(200)]
        [ProducesResponseType(403)]
        [ProducesResponseType(409)]
        [ProducesResponseType(500)]
        public ActionResult PostParametro([FromBody] ParametroPostDTO parametroPost)
        {
            _appService.Save(parametroPost);
            return Ok();
        }

        /// <summary>
        /// Altera parâmetro existente.
        /// </summary>
        /// <param name="parametroId">Identificação do parâmetro</param>
        /// <param name="parametroPut">Dados do parâmetro</param>
        /// <returns>Sucesso da operação</returns>
        /// <response code="200">Sucesso na operação</response>
        /// <response code="403">Usuário não autorizado</response>
        /// <response code="409">Em caso de erros de validação</response>
        /// <response code="500">Demais erros</response>  
        [HttpPut("{parametroId:int}")]
        [ProducesResponseType(200)]
        [ProducesResponseType(403)]
        [ProducesResponseType(409)]
        [ProducesResponseType(500)]
        public ActionResult PutParametro(int parametroId, [FromBody] ParametroPutDTO parametroPut)
        {
            _appService.Update(parametroId, parametroPut);
            return Ok();
        }

        /// <summary>
        /// Remove um parâmetro.
        /// </summary>
        /// <param name="parametroId">Identificação do parâmetro</param>
        /// <returns>Sucesso da operação</returns>
        /// <response code="204">Sucesso na operação</response>
        /// <response code="403">Usuário não autorizado</response>
        /// <response code="409">Em caso de erros de validação</response>
        /// <response code="500">Demais erros</response>   
        [HttpDelete("{parametroId:int}")]
        [ProducesResponseType(204)]
        [ProducesResponseType(403)]
        [ProducesResponseType(409)]
        [ProducesResponseType(500)]
        public ActionResult DeleteParametro(int parametroId)
        {
            _appService.Delete(parametroId);
            return NoContent();
        }
    }
}