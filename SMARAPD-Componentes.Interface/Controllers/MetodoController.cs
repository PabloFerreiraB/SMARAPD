using Microsoft.AspNetCore.Mvc;
using SMARAPD_Componentes.Common.DTO.ComponenteContext;
using SMARAPD_Componentes.Service.ApplicationService.ComponenteContext;
using System.Collections.Generic;

namespace SMARAPD_Componentes.Interface.Controllers
{
    /// <summary>
    /// Gerencia dados relacionados a métodos de um componente.
    /// </summary>
    [Route("metodo")]
    [ApiController]
    public class MetodoController : ControllerBase
    {
        private readonly MetodoApplicationService _appService;

        public MetodoController(MetodoApplicationService appService)
        {
            _appService = appService;
        }

        /// <summary>
        /// Adiciona método a um componente.
        /// </summary>
        /// <param name="metodoPost">Dados do parâmetro</param>
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
        public ActionResult PostMetodo([FromBody] MetodoPostDto metodoPost)
        {
             _appService.Save(metodoPost);
            return Ok();
        }

        /// <summary>
        /// Altera método existente.
        /// </summary>
        /// <param name="metodoId">Dados do parâmetro</param>
        /// <param name="metodoPut">Dados do parâmetro</param>
        /// <returns>Sucesso da operação</returns>
        /// <response code="200">Sucesso na operação</response>
        /// <response code="403">Usuário não autorizado</response>
        /// <response code="409">Em caso de erros de validação</response>
        /// <response code="500">Demais erros</response>  
        [HttpPut("{metodoId:int}")]
        [ProducesResponseType(200)]
        [ProducesResponseType(403)]
        [ProducesResponseType(409)]
        [ProducesResponseType(500)]
        public ActionResult PutMetodo(int metodoId, [FromBody] MetodoPutDto metodoPut)
        {
            _appService.Update(metodoId, metodoPut);
            return Ok();
        }

        /// <summary>
        /// Remove um método.
        /// </summary>
        /// <param name="metodoId">Dados do parâmetro</param>
        /// <returns>Sucesso da operação</returns>
        /// <response code="204">Sucesso na operação</response>
        /// <response code="403">Usuário não autorizado</response>
        /// <response code="409">Em caso de erros de validação</response>
        /// <response code="500">Demais erros</response>  
        [HttpDelete("{metodoId:int}")]
        [ProducesResponseType(204)]
        [ProducesResponseType(403)]
        [ProducesResponseType(409)]
        [ProducesResponseType(500)]
        public ActionResult DeleteMetodo(int metodoId)
        {
            _appService.Delete(metodoId);
            return NoContent();
        }

        /// <summary>
        /// Busca um método pelo id.
        /// </summary>
        /// <param name="metodoId">Dados do parâmetro</param>
        /// <returns>Sucesso da operação</returns>
        /// <response code="200">Sucesso na operação</response>
        /// <response code="403">Usuário não autorizado</response>
        /// <response code="409">Em caso de erros de validação</response>
        /// <response code="500">Demais erros</response>
        [HttpGet("{metodoId:int}")]
        [ProducesResponseType(200)]
        [ProducesResponseType(403)]
        [ProducesResponseType(409)]
        [ProducesResponseType(500)]
        public MetodoGetDto GetById(int metodoId)
        {
            return _appService.GetById(metodoId);
        }

        /// <summary>
        /// Busca uma lista de métodos pelo id do componente.
        /// </summary>
        /// <param name="componenteId">Dados do parâmetro</param>
        /// <returns>Sucesso da operação</returns>
        /// <response code="200">Sucesso na operação</response>
        /// <response code="403">Usuário não autorizado</response>
        /// <response code="409">Em caso de erros de validação</response>
        /// <response code="500">Demais erros</response>  
        [Route("getbyidcomponente/{componenteId:int}")]
        [HttpGet]
        [ProducesResponseType(200)]
        [ProducesResponseType(403)]
        [ProducesResponseType(409)]
        [ProducesResponseType(500)]
        public List<MetodoGetDto> GetByIdComponente(int componenteId)
        {
            return _appService.GetByIdComponente(componenteId);
        }
    }
}
