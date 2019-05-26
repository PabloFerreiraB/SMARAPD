using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using SMARAPD_Componentes.Common.DTO.UsuarioContext;
using SMARAPD_Componentes.Interface.Auth.CustomAttribute;
using SMARAPD_Componentes.Service.ApplicationService.UsuarioContext;
using System.Collections.Generic;

namespace SMARAPD_Componentes.Interface.Controllers
{
    /// <summary>
    /// Controlador responsável pelos dados de usuários.
    /// </summary>
    [Route("usuario")]
    [ApiController]
    public class UsuarioController : ControllerBase
    {
        private readonly UsuarioApplicationService _appService;

        public UsuarioController(UsuarioApplicationService appService)
        {
            _appService = appService;
        }

        /// <summary>
        /// Busca dados usuários específicos para a grid.
        /// </summary>
        /// <returns>Lista de usuários</returns>
        /// <response code="200">Sucesso na operação</response>
        /// <response code="403">Usuário não autorizado</response>
        /// <response code="409">Em caso de erros de validação</response>
        /// <response code="500">Demais erros</response>  
        [HttpGet("gridgetall")]
        [ProducesResponseType(200)]
        [ProducesResponseType(403)]
        [ProducesResponseType(409)]
        [ProducesResponseType(500)]
        public List<UsuarioGridGetAllDTO> GridGetAll()
        {
            return _appService.GridGetAll();
        }

        /// <summary>
        /// Busca todos os usuário registrados.
        /// </summary>
        /// <returns>Lista de Usuários</returns>
        /// <response code="200">Sucesso na operação</response>
        /// <response code="403">Usuário não autorizado</response>
        /// <response code="409">Em caso de erros de validação</response>
        /// <response code="500">Demais erros</response>  
        [HttpGet("getall")]
        [ProducesResponseType(200)]
        [ProducesResponseType(403)]
        [ProducesResponseType(409)]
        [ProducesResponseType(500)]
        public List<UsuarioGetDTO> GetAll()
        {
            return _appService.GetAll();
        }

        [HttpGet("getallbyautorizacao")]
        [ProducesResponseType(200)]
        [ProducesResponseType(403)]
        [ProducesResponseType(409)]
        [ProducesResponseType(500)]
        public List<UsuarioGridGetAllDTO> GetAllByAutorizacao()
        {
            return _appService.GetAllByAutorizacao();
        }

        /// <summary>
        /// Busca usuário pela identificação fornecida.
        /// </summary>
        /// <param name="id">Identificação do usuário</param>
        /// <returns>Usuário</returns>
        /// <response code="200">Sucesso na operação</response>
        /// <response code="403">Usuário não autorizado</response>
        /// <response code="409">Em caso de erros de validação</response>
        /// <response code="500">Demais erros</response>  
        [HttpGet("{id:int}")]
        [AuthorizeVisitante]
        [ProducesResponseType(200)]
        [ProducesResponseType(403)]
        [ProducesResponseType(409)]
        [ProducesResponseType(500)]
        public UsuarioGetDTO GetById(int id)
        {
            return _appService.GetById(id);
        }

        /// <summary>
        /// Conta os usuários não autorizados.
        /// </summary>
        /// <returns>Número usuários não autorizados</returns>
        /// <response code="200">Sucesso na operação</response>
        /// <response code="403">Usuário não autorizado</response>
        /// <response code="409">Em caso de erros de validação</response>
        /// <response code="500">Demais erros</response>  
        [HttpGet("countNaoAutorizados")]
        [ProducesResponseType(200)]
        [ProducesResponseType(403)]
        [ProducesResponseType(409)]
        [ProducesResponseType(500)]
        public int CountNaoAutorizados()
        {
            return _appService.CountNaoAutorizados();
        }

        /// <summary>
        /// Inclui usuário no sistema.
        /// </summary>
        /// <param name="dto">Dados do usuário</param>
        /// <response code="200">Sucesso na operação</response>
        /// <response code="403">Usuário não autorizado</response>
        /// <response code="409">Em caso de erros de validação</response>
        /// <response code="500">Demais erros</response>  
        [HttpPost("save")]
        [ProducesResponseType(200)]
        [ProducesResponseType(403)]
        [ProducesResponseType(409)]
        [ProducesResponseType(500)]
        public ActionResult Save(UsuarioPostDTO dto)
        {
            _appService.Save(dto);
            return Ok();
        }

        /// <summary>
        /// Inclui usuário no sistema, de maneira externa.
        /// </summary>
        /// <param name="dto">Dados do usuário</param>
        /// <response code="200">Sucesso na operação</response>
        /// <response code="409">Em caso de erros de validação</response>
        /// <response code="500">Demais erros</response>  
        [HttpPost("usuarioExternoSave")]
        [AllowAnonymous]
        [ProducesResponseType(200)]
        [ProducesResponseType(409)]
        [ProducesResponseType(500)]
        public ActionResult UsuarioExternoSave(UsuarioExternoPostDTO dto)
        {
            _appService.UsuarioExternoSave(dto);
            return Ok();
        }

        /// <summary>
        /// Altera dados do usuário.
        /// </summary>
        /// <param name="id">Identificação do usuário</param>
        /// <param name="dto">Dados do usuário</param>
        /// <returns>Sucesso da Operação</returns>
        /// <response code="200">Sucesso na operação</response>
        /// <response code="403">Usuário não autorizado</response>
        /// <response code="409">Em caso de erros de validação</response>
        /// <response code="500">Demais erros</response>
        [AuthorizeVisitante]
        [HttpPut("{id:int}")]
        [ProducesResponseType(200)]
        [ProducesResponseType(403)]
        [ProducesResponseType(409)]
        [ProducesResponseType(500)]
        public ActionResult Put(int id, [FromBody] UsuarioPutDTO dto)
        {
            _appService.Update(id, dto);
            return Ok();
        }

        /// <summary>
        /// Autoriza todos os usuários pendentes.
        /// </summary>
        /// <returns>Sucesso da operação</returns>
        /// <response code="200">Sucesso na operação</response>
        /// <response code="403">Usuário não autorizado</response>
        /// <response code="409">Em caso de erros de validação</response>
        /// <response code="500">Demais erros</response>
        [HttpPut("editAllAutorizacao")]
        [ProducesResponseType(200)]
        [ProducesResponseType(403)]
        [ProducesResponseType(409)]
        [ProducesResponseType(500)]
        public ActionResult PutAllAutorizacao()
        {
            _appService.UpdateAllAutorizacao();
            return Ok();
        }

        /// <summary>
        /// Autoriza usuário a utilizar o sistema.
        /// </summary>
        /// <param name="id">Identificação do usuário</param>
        /// <returns>Sucesso da operação</returns>
        /// <response code="200">Sucesso na operação</response>
        /// <response code="403">Usuário não autorizado</response>
        /// <response code="409">Em caso de erros de validação</response>
        /// <response code="500">Demais erros</response>
        [HttpPut("editAutorizacao/{id:int}")]
        [ProducesResponseType(200)]
        [ProducesResponseType(403)]
        [ProducesResponseType(409)]
        [ProducesResponseType(500)]
        public ActionResult PutAutorizacao(int id)
        {
            _appService.UpdateAutorizacao(id);
            return Ok();
        }

        /// <summary>
        /// Altera senha de usuário.
        /// </summary>
        /// <param name="id">Identificação do usuário</param>
        /// <param name="dto">Dados para alteração</param>
        /// <returns>Sucesso da operação</returns>
        /// <response code="200">Sucesso na operação</response>
        /// <response code="403">Usuário não autorizado</response>
        /// <response code="409">Em caso de erros de validação</response>
        /// <response code="500">Demais erros</response>
        [HttpPut("editPassword/{id:int}")]
        [ProducesResponseType(200)]
        [ProducesResponseType(403)]
        [ProducesResponseType(409)]
        [ProducesResponseType(500)]
        public ActionResult PutPassword(int id, UsuarioPutPasswordDTO dto)
        {
            _appService.UpdatePassword(id, dto);
            return Ok();
        }

        [HttpPut("editPasswordPerfil/{id:int}")]
        [ProducesResponseType(200)]
        [ProducesResponseType(403)]
        [ProducesResponseType(409)]
        [ProducesResponseType(500)]
        public ActionResult PutPasswordPerfil(int id, UsuarioPutPasswordDTO dto)
        {
            _appService.UpdatePasswordPerfil(id, dto);
            return Ok();
        }
    }
}
