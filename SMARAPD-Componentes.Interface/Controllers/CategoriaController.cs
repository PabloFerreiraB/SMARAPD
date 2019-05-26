using Microsoft.AspNetCore.Mvc;
using SMARAPD_Componentes.Common.DTO.CategoriaContext;
using SMARAPD_Componentes.Interface.Auth.CustomAttribute;
using SMARAPD_Componentes.Service.ApplicationService.CategoriaContext;
using System.Collections.Generic;

namespace SMARAPD_Componentes.Interface.Controllers
{
    [Route("categoria")]
    [ApiController]
    public class CategoriaController : ControllerBase
    {
        private readonly CategoriaApplicationService _appService;

        public CategoriaController(CategoriaApplicationService appService)
        {
            _appService = appService;
        }

        /// <summary>
        /// Retorna uma lista com todas as categorias cadastradas.
        /// </summary>
        /// <returns>Lista de Categorias</returns>
        /// <response code="200">Sucesso na operação</response>
        /// <response code="403">Usuário não autorizado</response>
        /// <response code="500">Demais erros</response>  
        [AuthorizeVisitante] 
        [HttpGet]
        [ProducesResponseType(200)]
        [ProducesResponseType(403)]
        [ProducesResponseType(409)]
        [ProducesResponseType(500)]
        public List<CategoriaGetDTO> GetAll()
        {
            
            return _appService.GetAll();
        }


        /// <summary>
        /// Lista todas as categorias que possuem componentes.
        /// </summary>
        /// <returns>Retorna uma lista com todas as categorias que possuem componentes</returns>
        /// <response code="200">Sucesso na operação</response>
        /// <response code="403">Usuário não autorizado</response>
        /// <response code="500">Demais erros</response>  
        [AuthorizeVisitante]
        [HttpGet("getallhascomponente")]
        [ProducesResponseType(200)]
        [ProducesResponseType(403)]
        [ProducesResponseType(409)]
        [ProducesResponseType(500)]
        public List<CategoriaGetDTO>GetAllHasComponente()
        {
            return _appService.GetAllHasComponente();
        }

        /// <summary>
        /// Busca categoria por sua identificação.
        /// </summary>
        /// <param name="id">Id da categoria que vai ser retornada</param>
        /// <returns>Retorna um registro referente ao seu id</returns>
        /// <response code="200">Sucesso na operação</response>
        /// <response code="403">Usuário não autorizado</response>
        /// <response code="409">Em caso de erros de validação</response>
        /// <response code="500">Demais erros</response>  
        [ProducesResponseType(200)]
        [ProducesResponseType(403)]
        [ProducesResponseType(409)]
        [ProducesResponseType(500)]
        [HttpGet("{id:int}")]
        public CategoriaGetDTO GetById(int id)
        {
            return _appService.GetById(id);
        }

        /// <summary>
        /// Registra categoria no sistema.
        /// </summary>
        /// <param name="dto">Salva os dados no DTO</param>
        /// <return>Realiza cadastro de uma nova categoria</return>
        /// <response code="200">Sucesso na operação</response>
        /// <response code="403">Usuário não autorizado</response>
        /// <response code="409">Em caso de erros de validação</response>
        /// <response code="500">Demais erros</response>  
        [ProducesResponseType(200)]
        [ProducesResponseType(403)]
        [ProducesResponseType(409)]
        [ProducesResponseType(500)]
        [HttpPost]
        public ActionResult Save(CategoriaPostDTO dto)
        {
            _appService.Save(dto);
            return Ok();
        }

        /// <summary>
        /// Altera os dados da categoria informada.
        /// </summary>
        /// <param name="id">Id da categoria que vai ser retornada</param>
        /// <param name="dto">Salva os dados no DTO</param>
        /// <return>Realiza a atualização de uma categoria</return>
        /// <response code="200">Sucesso na operação</response>
        /// <response code="403">Usuário não autorizado</response>
        /// <response code="409">Em caso de erros de validação</response>
        /// <response code="500">Demais erros</response>  
        [ProducesResponseType(200)]
        [ProducesResponseType(403)]
        [ProducesResponseType(409)]
        [ProducesResponseType(500)]
        [HttpPut("{id:int}")]
        public ActionResult Update(int id, CategoriaPutDTO dto)
        {
            _appService.Update(id, dto);
            return Ok();
        }

        /// <summary>
        /// Remove categoria da base de dados.
        /// </summary>
        /// <param name="id">Id da categoria que vai ser retornada</param>
        /// <return>Ultilizado para deletar um registro</return>
        /// <response code="204">Sucesso na operação</response>
        /// <response code="403">Usuário não autorizado</response>
        /// <response code="409">Em caso de erros de validação</response>
        /// <response code="500">Demais erros</response>  
        [ProducesResponseType(204)]
        [ProducesResponseType(403)]
        [ProducesResponseType(409)]
        [ProducesResponseType(500)]
        [HttpDelete("{id:int}")]
        public ActionResult Delete(int id)
        {
            _appService.Delete(id);
            return NoContent();
        }        
    }
}
