using Microsoft.AspNetCore.Mvc;
using SMARAPD_Componentes.Common.DTO.ComponenteContext;
using SMARAPD_Componentes.Service.ApplicationService.ComponenteContext;
using System.Collections.Generic;

namespace SMARAPD_Componentes.Interface.Controllers
{
    /// <summary>
    /// Gerencia dados relacionados a parâmetros de um evento.
    /// </summary>
    [Route("parametroEvento")]
    [ApiController]
    public class ParametroEventoController : ControllerBase
    {
        private readonly ParametroEventoApplicationService _appService;

        public ParametroEventoController(ParametroEventoApplicationService appService)
        {
            _appService = appService;
        }

        /// <summary>
        /// Adiciona um parâmetro a um evento.
        /// </summary>
        /// <param name="parametroEventoPost">Dados do parâmetro</param>
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
        public ActionResult PostParametroEvento([FromBody] ParametroEventoPostDto parametroEventoPost)
        {
            _appService.Save(parametroEventoPost);
            return Ok();
        }

        /// <summary>
        /// Altera o parâmetro de um evento.
        /// </summary>
        /// <param name="parametroEventoId">Dados do parâmetro</param>
        /// <param name="parametroEventoPut">Dados do parâmetro</param>
        /// <returns>Sucesso da operação</returns>
        /// <response code="200">Sucesso na operação</response>
        /// <response code="403">Usuário não autorizado</response>
        /// <response code="409">Em caso de erros de validação</response>
        /// <response code="500">Demais erros</response>   
        [HttpPut("{parametroEventoId:int}")]
        [ProducesResponseType(200)]
        [ProducesResponseType(403)]
        [ProducesResponseType(409)]
        [ProducesResponseType(500)]
        public ActionResult PutParametroEvento(int parametroEventoId, [FromBody] ParametroEventoPutDto parametroEventoPut)
        {
            _appService.Update(parametroEventoId, parametroEventoPut);
            return Ok();
        }

        /// <summary>
        /// Remove o parâmetro de um evento.
        /// </summary>
        /// <param name="parametroEventoId">Dados do parâmetro</param>
        /// <returns>Sucesso da operação</returns>
        /// <response code="204">Sucesso na operação</response>
        /// <response code="403">Usuário não autorizado</response>
        /// <response code="409">Em caso de erros de validação</response>
        /// <response code="500">Demais erros</response>  
        [HttpDelete("{parametroEventoId:int}")]
        [ProducesResponseType(204)]
        [ProducesResponseType(403)]
        [ProducesResponseType(409)]
        [ProducesResponseType(500)]
        public ActionResult DeleteParametroEvento(int parametroEventoId)
        {
            _appService.Delete(parametroEventoId);
            return NoContent();
        }

        /// <summary>
        /// Busca o parâmetro de um evento pelo id.
        /// </summary>
        /// <param name="parametroEventoId">Dados do parâmetro</param>
        /// <returns>Sucesso da operação</returns>
        /// <response code="200">Sucesso na operação</response>
        /// <response code="403">Usuário não autorizado</response>
        /// <response code="409">Em caso de erros de validação</response>
        /// <response code="500">Demais erros</response>  
        [Route("{parametroEventoId:int}")]
        [HttpGet]
        [ProducesResponseType(200)]
        [ProducesResponseType(403)]
        [ProducesResponseType(409)]
        [ProducesResponseType(500)]
        public ParametroEventoGetDto GetById(int parametroEventoId)
        {
            return _appService.GetById(parametroEventoId);
        }

        /// <summary>
        /// Busca uma lista de parâmetros pelo id do evento.
        /// </summary>
        /// <param name="eventoId">Dados do parâmetro</param>
        /// <returns>Sucesso da operação</returns>
        /// <response code="200">Sucesso na operação</response>
        /// <response code="403">Usuário não autorizado</response>
        /// <response code="409">Em caso de erros de validação</response>
        /// <response code="500">Demais erros</response>  
        [HttpGet("getbyidevento/{eventoId:int}")]
        [ProducesResponseType(200)]
        [ProducesResponseType(403)]
        [ProducesResponseType(409)]
        [ProducesResponseType(500)]
        public List<ParametroEventoGetDto> GetByIdEvento(int eventoId)
        {
            return _appService.GetByIdEvento(eventoId);
        }
    }
}
