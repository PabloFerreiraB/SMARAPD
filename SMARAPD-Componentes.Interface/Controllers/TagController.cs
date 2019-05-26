using Microsoft.AspNetCore.Mvc;
using SMARAPD_Componentes.Common.DTO.ComponenteContext;
using SMARAPD_Componentes.Interface.Auth.CustomAttribute;
using SMARAPD_Componentes.Service.ApplicationService.ComponenteContext;
using System.Collections.Generic;

namespace SMARAPD_Componentes.Interface.Controllers
{
    [Route("tag")]
    [ApiController]
    public class TagController : ControllerBase
    {
        private readonly TagApplicationService _appService;

        public TagController(TagApplicationService appService)
        {
            _appService = appService;
        }

        /// <summary>
        /// Lista de todas as Tags registradas
        /// </summary>
        /// <returns>Lista de Tags</returns>
        /// <response code="200">Sucesso na operação</response>
        /// <response code="403">Usuário não autorizado</response>
        /// <response code="409">Em caso de erros de validação</response>
        /// <response code="500">Demais erros</response>  
        [AuthorizeVisitante]
        [HttpGet]
        [ProducesResponseType(200)]
        [ProducesResponseType(403)]
        [ProducesResponseType(409)]
        [ProducesResponseType(500)]
        public List<TagGetDTO> GetAll()
        {
            return _appService.GetAll();
        }


    }
}
