using Microsoft.AspNetCore.Mvc;
using SMARAPD_Componentes.Common.DTO.ComponenteContext;
using SMARAPD_Componentes.Service.ApplicationService.ComponenteContext;
using System.Collections.Generic;

namespace SMARAPD_Componentes.Interface.Controllers
{
    /// <summary>
    /// Gerencia dados relacionados a eventos de um componente.
    /// </summary>
    [Route("evento")]
    [ApiController]
    public class EventoController : ControllerBase
    {
        private readonly EventoApplicationService _appService;

        public EventoController(EventoApplicationService appService)
        {
            _appService = appService;
        }

        /// <summary>
        /// Adiciona evento a um componente.
        /// </summary>
        /// <param name="eventoPost">Dados do parâmetro</param>
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
        public ActionResult PostEvento([FromBody] EventoPostDto eventoPost)
        {
            _appService.Save(eventoPost);
            return Ok();
        }

        /// <summary>
        /// Altera evento existente.
        /// </summary>
        /// <param name="eventoId">Dados do parâmetro</param>
        /// <param name="eventoPut">Dados do parâmetro</param>
        /// <returns>Sucesso da operação</returns>
        /// <response code="200">Sucesso na operação</response>
        /// <response code="403">Usuário não autorizado</response>
        /// <response code="409">Em caso de erros de validação</response>
        /// <response code="500">Demais erros</response>   
        [HttpPut("{eventoId:int}")]
        [ProducesResponseType(200)]
        [ProducesResponseType(403)]
        [ProducesResponseType(409)]
        [ProducesResponseType(500)]
        public ActionResult PutEvento(int eventoId, [FromBody] EventoPutDto eventoPut)
        {
            _appService.Update(eventoId, eventoPut);
            return Ok();
        }

        /// <summary>
        /// Remove um evento.
        /// </summary>
        /// <param name="eventoId">Dados do parâmetro</param>
        /// <returns>Sucesso da operação</returns>
        /// <response code="204">Sucesso na operação</response>
        /// <response code="403">Usuário não autorizado</response>
        /// <response code="409">Em caso de erros de validação</response>
        /// <response code="500">Demais erros</response>  
        [HttpDelete("{eventoId:int}")]
        [ProducesResponseType(204)]
        [ProducesResponseType(403)]
        [ProducesResponseType(409)]
        [ProducesResponseType(500)]
        public ActionResult DeleteEvento(int eventoId)
        {
            _appService.Delete(eventoId);
            return NoContent();
        }

        /// <summary>
        /// Busca um evento pelo id.
        /// </summary>
        /// <param name="eventoId">Dados do parâmetro</param>
        /// <returns>Sucesso da operação</returns>
        /// <response code="200">Sucesso na operação</response>
        /// <response code="403">Usuário não autorizado</response>
        /// <response code="409">Em caso de erros de validação</response>
        /// <response code="500">Demais erros</response>  
        [Route("{eventoId:int}")]
        [HttpGet]
        [ProducesResponseType(200)]
        [ProducesResponseType(403)]
        [ProducesResponseType(409)]
        [ProducesResponseType(500)]
        public EventoGetDto GetById(int eventoId)
        {
            return _appService.GetById(eventoId);
        }

        /// <summary>
        /// Busca uma lista de eventos pelo id do componente.
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
        public List<EventoGetDto> GetByIdComponente(int componenteId)
        {
            return _appService.GetByIdComponente(componenteId);
        }
    }
}
