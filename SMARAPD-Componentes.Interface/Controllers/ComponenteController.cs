using Microsoft.AspNetCore.Mvc;
using SMARAPD_Componentes.Common.DTO.ComponenteContext;
using SMARAPD_Componentes.Interface.Auth.CustomAttribute;
using SMARAPD_Componentes.Service.ApplicationService.ComponenteContext;
using System.Collections.Generic;

namespace SMARAPD_Componentes.Interface.Controllers
{
    /// <summary>
    /// Controlador responsável pelos dados de Componente.
    /// </summary>
    [Route("componente")]
    [ApiController]
    public class ComponenteController : ControllerBase
    {
        private readonly ComponenteApplicationService _appService;

        public ComponenteController(ComponenteApplicationService appService)
        {
            _appService = appService;
        }

        /// <summary>
        /// Lista de todos os Componentes registrados.
        /// </summary>
        /// <returns>Lista de Componentes</returns>
        /// <response code="200">Sucesso na operação</response>
        /// <response code="403">Usuário não autorizado</response>
        /// <response code="500">Demais erros</response>  
        [HttpGet]
        [ProducesResponseType(200)]
        [ProducesResponseType(403)]
        [ProducesResponseType(500)]
        public List<ComponenteGetDTO> GetAll()
        {
            return _appService.GetAll();
        }

        /// <summary>
        /// Lista de todos os Componentes registrados (view da Grid).
        /// </summary>
        /// <returns>Lista de Componentes</returns>
        /// <response code="200">Sucesso na operação</response>
        /// <response code="403">Usuário não autorizado</response>
        /// <response code="500">Demais erros</response>  
        [HttpGet("getallgrid")]
        [ProducesResponseType(200)]
        [ProducesResponseType(403)]
        [ProducesResponseType(500)]
        public List<ComponenteGridGetDTO> GetAllGrid()
        {
            return _appService.GetAllGrid();
        }

        /// <summary>
        /// Retorna um componente específico.
        /// </summary>
        /// <returns>Componente</returns>
        /// <response code="200">Sucesso na operação</response>
        /// <response code="403">Usuário não autorizado</response>
        /// <response code="409">Em caso de erros de validação</response>
        /// <response code="500">Demais erros</response>  
        [HttpGet("{id:int}")]
        [ProducesResponseType(200)]
        [ProducesResponseType(403)]
        [ProducesResponseType(409)]
        [ProducesResponseType(500)]
        public ComponenteByIdGetDTO GetById(int id)
        {
            return _appService.GetById(id);
        }

        /// <summary>
        /// Retorna um componente específico pronto para visualização.
        /// </summary>
        /// <returns>Componente</returns>
        /// <response code="200">Sucesso na operação</response>
        /// <response code="403">Usuário não autorizado</response>
        /// <response code="409">Em caso de erros de validação</response>
        /// <response code="500">Demais erros</response>  
        [AuthorizeVisitante]
        [HttpGet("getbyidview/{id:int}")]
        [ProducesResponseType(200)]
        [ProducesResponseType(403)]
        [ProducesResponseType(409)]
        [ProducesResponseType(500)]
        public ComponenteGetDTO GetByIdView(int id)
        {
            return _appService.GetByIdView(id);
        }

        /// <summary>
        /// Altera dados do componente.
        /// </summary>
        /// <param name="id">Identificação do componente</param>
        /// <param name="dto">Dados do componente</param>
        /// <returns>>Sucesso da operação</returns>
        /// <response code="200">Sucesso na operação</response>
        /// <response code="403">Usuário não autorizado</response>
        /// <response code="409">Em caso de erros de validação</response>
        /// <response code="500">Demais erros</response>
        [HttpPut("{id:int}")]
        [ProducesResponseType(200)]
        [ProducesResponseType(403)]
        [ProducesResponseType(409)]
        [ProducesResponseType(500)]
        public ActionResult Update(int id, ComponentePutDTO dto)
        {
            _appService.Update(dto, id);
            return Ok();
        }

        /// <summary>
        /// Remove componente da base de dados, junto a suas propriedades.
        /// </summary>
        /// <response code="204">Sucesso na operação</response>
        /// <response code="403">Usuário não autorizado</response>
        /// <response code="409">Em caso de erros de validação</response>
        /// <response code="500">Demais erros</response>  
        [HttpDelete("{id:int}")]
        [ProducesResponseType(204)]
        [ProducesResponseType(403)]
        [ProducesResponseType(409)]
        [ProducesResponseType(500)]
        public NoContentResult Delete(int id)
        {
            _appService.Delete(id);
            return NoContent();
        }

        /// <summary>
        /// Retorna a lista de componentes divididos por Categorias.
        /// </summary>
        /// <returns>Lista de Componentes dividida em Categorias</returns>
        /// <response code="200">Sucesso na operação</response>
        /// <response code="403">Usuário não autorizado</response>
        /// <response code="500">Demais erros</response>  
        [AuthorizeVisitante]
        [HttpGet("getallbycategoria")]
        [ProducesResponseType(200)]
        [ProducesResponseType(403)]
        [ProducesResponseType(500)]
        public List<ComponenteCategoriaGetDTO> GetAllByCategoria()
        {
            return _appService.GetAllByCategoria();
        }

        /// <summary>
        /// Retorna a lista de itens do menu.
        /// </summary>
        /// <returns>Lista de Componentes publicados dividida em Categorias</returns>
        /// <response code="200">Sucesso na operação</response>
        /// <response code="403">Usuário não autorizado</response>
        /// <response code="500">Demais erros</response>  
        [AuthorizeVisitante]
        [HttpGet("getcomponentemenu")]
        [ProducesResponseType(200)]
        [ProducesResponseType(403)]
        [ProducesResponseType(500)]
        public List<ComponenteCategoriaGetDTO> GetComponenteMenu()
        {
            return _appService.GetComponenteMenu();
        }

        /// <summary>
        /// Cadastra um novo componente.
        /// </summary>
        /// <response code="200">Sucesso na operação</response>
        /// <response code="403">Usuário não autorizado</response>
        /// <response code="409">Em caso de erros de validação</response>
        /// <response code="500">Demais erros</response>  
        [HttpPost]
        [ProducesResponseType(200)]
        [ProducesResponseType(403)]
        [ProducesResponseType(409)]
        [ProducesResponseType(500)]
        public ActionResult Add([FromBody] ComponentePostDTO dto)
        {
            _appService.Save(dto);
            return Ok();
        }

        /// <summary>
        /// Pesquisa de componentens com base em todas suas propriedades.
        /// </summary>
        /// <returns></returns>
        /// <response code="200">Sucesso na operação</response>
        /// <response code="403">Usuário não autorizado</response>
        /// <response code="500">Demais erros</response>  
        [AuthorizeVisitante]
        [HttpPost("pesquisa")]
        [ProducesResponseType(200)]
        [ProducesResponseType(403)]
        [ProducesResponseType(500)]
        public List<ComponenteResultDTO> Pesquisa(PesquisaDTO dto)
        {
            return _appService.Search(dto);
        }

    }
}