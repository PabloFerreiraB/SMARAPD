using Microsoft.AspNetCore.Mvc;
using SMARAPD_Componentes.Common.DTO.ComponenteContext;
using SMARAPD_Componentes.Service.ApplicationService.ComponenteContext;
using System.Collections.Generic;

namespace SMARAPD_Componentes.Interface.Controllers
{
    /// <summary>
    /// Gerencia dados relacionados a parâmetros de um método.
    /// </summary>
    [Route("parametroMetodo")]
    [ApiController]
    public class ParametroMetodoController : ControllerBase
    {
        private readonly ParametroMetodoApplicationService _appService;

        public ParametroMetodoController(ParametroMetodoApplicationService appService)
        {
            _appService = appService;
        }

        /// <summary>
        /// Adiciona um parâmetro a um método.
        /// </summary>
        /// <param name="parametroMetodoPost">Dados do parâmetro</param>
        /// <returns>Sucesso da operação</returns>
        /// <response code="201">Sucesso na operação</response>
        /// <response code="403">Usuário não autorizado</response>
        /// <response code="409">Em caso de erros de validação</response>
        /// <response code="500">Demais erros</response>  
        [HttpPost]
        [ProducesResponseType(201)]
        [ProducesResponseType(403)]
        [ProducesResponseType(409)]
        [ProducesResponseType(500)]
        public ActionResult PostParametroMetodo([FromBody] ParametroMetodoPostDto parametroMetodoPost)
        {
            _appService.Save(parametroMetodoPost);
            return Ok();
        }

        /// <summary>
        /// Altera o parâmetro de um método.
        /// </summary>
        /// <param name="parametroMetodoId">Dados do parâmetro</param>
        /// <param name="parametroMetodoPut">Dados do parâmetro</param>
        /// <returns>Sucesso da operação</returns>
        /// <response code="200">Sucesso na operação</response>
        /// <response code="403">Usuário não autorizado</response>
        /// <response code="409">Em caso de erros de validação</response>
        /// <response code="500">Demais erros</response>  
        [HttpPut("{parametroMetodoId:int}")]
        [ProducesResponseType(200)]
        [ProducesResponseType(403)]
        [ProducesResponseType(409)]
        [ProducesResponseType(500)]
        public ActionResult PutParametroMetodo(int parametroMetodoId, [FromBody] ParametroMetodoPutDto parametroMetodoPut)
        {
            _appService.Update(parametroMetodoId, parametroMetodoPut);
            return Ok();
        }

        /// <summary>
        /// Remove o parâmetro de um método.
        /// </summary>
        /// <param name="parametroMetodoId">Dados do parâmetro</param>
        /// <returns>Sucesso da operação</returns>
        /// <response code="204">Sucesso na operação</response>
        /// <response code="403">Usuário não autorizado</response>
        /// <response code="409">Em caso de erros de validação</response>
        /// <response code="500">Demais erros</response>  
        [HttpDelete("{parametroMetodoId:int}")]
        [ProducesResponseType(204)]
        [ProducesResponseType(403)]
        [ProducesResponseType(409)]
        [ProducesResponseType(500)]
        public ActionResult DeleteParametroMetodo(int parametroMetodoId)
        {
            _appService.Delete(parametroMetodoId);
            return NoContent();
        }

        /// <summary>
        /// Busca o parâmetro de um método pelo id.
        /// </summary>
        /// <param name="parametroMetodoId">Dados do parâmetro</param>
        /// <returns>Sucesso da operação</returns>
        /// <response code="200">Sucesso na operação</response>
        /// <response code="403">Usuário não autorizado</response>
        /// <response code="409">Em caso de erros de validação</response>
        /// <response code="500">Demais erros</response>    
        [Route("{parametroMetodoId:int}")]
        [HttpGet]
        [ProducesResponseType(200)]
        [ProducesResponseType(403)]
        [ProducesResponseType(409)]
        [ProducesResponseType(500)]
        public ParametroMetodoGetDto GetById(int parametroMetodoId)
        {
            return _appService.GetById(parametroMetodoId);
        }

        /// <summary>
        /// Busca uma lista de parâmetros pelo id do método.
        /// </summary>
        /// <param name="metodoId">Dados do parâmetro</param>
        /// <returns>Sucesso da operação</returns>
        /// <response code="200">Sucesso na operação</response>
        /// <response code="403">Usuário não autorizado</response>
        /// <response code="409">Em caso de erros de validação</response>
        /// <response code="500">Demais erros</response>  
        [Route("getbyidmetodo/{metodoId:int}")]
        [HttpGet]
        [ProducesResponseType(200)]
        [ProducesResponseType(403)]
        [ProducesResponseType(409)]
        [ProducesResponseType(500)]
        public List<ParametroMetodoGetDto> GetByIdComponente(int metodoId)
        {
            return _appService.GetByIdMetodo(metodoId);
        }
    }
}
