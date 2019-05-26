using Microsoft.AspNetCore.Mvc;
using SMARAPD_Componentes.Common.DTO.ComponenteContext;
using SMARAPD_Componentes.Service.ApplicationService.ComponenteContext;
using System.Collections.Generic;

namespace SMARAPD_Componentes.Interface.Controllers
{
    /// <summary>
    /// Responsável por gerenciar dados de dependências do componente.
    /// </summary>
    [Route("dependencia")]
    [ApiController]
    public class DependenciaController : ControllerBase
    {
        private readonly DependenciaApplicationService _appService;

        public DependenciaController(DependenciaApplicationService appService)
        {
            _appService = appService;
        }

        /// <summary>
        /// Busca todas dependências cadastradas.
        /// </summary>
        /// <returns> Retorna todas dependências cadastradas. </returns>
        /// <response code="200">Sucesso na operação</response>
        /// <response code="403">Usuário não autorizado</response>
        /// <response code="500">Demais erros</response>   
        [HttpGet("")]
        [ProducesResponseType(200)]
        [ProducesResponseType(403)]
        [ProducesResponseType(500)]
        public List<DependenciaGetDTO> GetAll()
        {
            return _appService.GetAll();
        }

        /// <summary>
        /// Busca uma dependência pelo Id.
        /// </summary>
        /// <param name="id"> Parâmetro Id. </param>
        /// <returns> Sucesso na operação. </returns>
        /// <response code="200">Sucesso na operação</response>
        /// <response code="403">Usuário não autorizado</response>
        /// <response code="409">Em caso de erros de validação</response>
        /// <response code="500">Demais erros</response>  
        [HttpGet("{id:int}", Name = "Get")]
        [ProducesResponseType(200)]
        [ProducesResponseType(403)]
        [ProducesResponseType(409)]
        [ProducesResponseType(500)]
        public DependenciaGetDTO GetById(int id)
        {
            return _appService.GetById(id);
        }

        /// <summary>
        /// Adiciona dependência para um componente.
        /// </summary>
        /// <param name="dependenciaPostDTO"> Dados da dependência. </param>
        /// <returns> Sucesso na operação. </returns>
        /// <response code="200">Sucesso na operação</response>
        /// <response code="403">Usuário não autorizado</response>
        /// <response code="409">Em caso de erros de validação</response>
        /// <response code="500">Demais erros</response>    
        [HttpPost]
        [ProducesResponseType(200)]
        [ProducesResponseType(403)]
        [ProducesResponseType(409)]
        [ProducesResponseType(500)]
        public ActionResult Post(DependenciaPostDTO dependenciaPostDTO)
        {
            _appService.Save(dependenciaPostDTO);
            return Ok();
        }

        /// <summary>
        /// Altera dependência existente.
        /// </summary>
        /// <param name="id"> Identificação da dependência. </param>
        /// <param name="dependenciaPutDTO"> Dados da dependência. </param>
        /// <returns> Sucesso na operação. </returns>
        /// <response code="200">Sucesso na operação</response>
        /// <response code="403">Usuário não autorizado</response>
        /// <response code="409">Em caso de erros de validação</response>
        /// <response code="500">Demais erros</response>  
        [HttpPut("{id:int}")]
        [ProducesResponseType(200)]
        [ProducesResponseType(403)]
        [ProducesResponseType(409)]
        [ProducesResponseType(500)]
        public ActionResult Put(int id, [FromBody] DependenciaPutDTO dependenciaPutDTO)
        {
            _appService.Update(id, dependenciaPutDTO);
            return Ok();
        }

        /// <summary>
        /// Exclui uma dependência.
        /// </summary>
        /// <param name="id"> Identificação da dependência. </param>
        /// <returns> Sucesso da operação. </returns>
        /// <response code="204">Sucesso na operação</response>
        /// <response code="403">Usuário não autorizado</response>
        /// <response code="409">Em caso de erros de validação</response>
        /// <response code="500">Demais erros</response>  
        [HttpDelete("{id:int}")]
        [ProducesResponseType(204)]
        [ProducesResponseType(403)]
        [ProducesResponseType(409)]
        [ProducesResponseType(500)]
        public ActionResult Delete(int id)
        {
            _appService.Delete(id);
            return NoContent();
        }


        /// <summary>
        /// Associar dependência para um componente.
        /// </summary>
        /// <param name="dto"> Dados da associação da dependência. </param>
        /// <returns> Sucesso na operação. </returns>
        /// <response code="200">Sucesso na operação</response>
        /// <response code="403">Usuário não autorizado</response>
        /// <response code="409">Em caso de erros de validação</response>
        /// <response code="500">Demais erros</response>    
        [HttpPost]
        [ProducesResponseType(200)]
        [ProducesResponseType(403)]
        [ProducesResponseType(409)]
        [ProducesResponseType(500)]
        [Route("associar")]
        public ActionResult Associar(ComponenteDependenciaPostDTO dto)
        {
            _appService.Associar(dto);
            return Ok();
        }


        /// <summary>
        /// Exclui uma dependência associada com um componente.
        /// </summary>
        /// <param name="idComponente">Identificação do componente</param>
        /// <param name="idDepenpendencia">Identificação da dependência</param>
        /// <returns> Sucesso na operação. </returns>
        /// <response code="200">Sucesso na operação</response>
        /// <response code="403">Usuário não autorizado</response>
        /// <response code="409">Em caso de erros de validação</response>
        /// <response code="500">Demais erros</response>    
        [HttpDelete]
        [ProducesResponseType(200)]
        [ProducesResponseType(403)]
        [ProducesResponseType(409)]
        [ProducesResponseType(500)]
        [Route("desassociar/{idComponente:int}/{idDepenpendencia:int}")]
        public ActionResult Associar(int idComponente, int idDepenpendencia)
        {
            _appService.Desassociar(idComponente, idDepenpendencia);
            return Ok();
        }
    }
}
