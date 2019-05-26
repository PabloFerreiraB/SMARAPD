using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using SMARAPD_Componentes.Common.DTO.AuthContext;
using SMARAPD_Componentes.Interface.Auth.CustomAttribute;
using SMARAPD_Componentes.Service.ApplicationService.AuthContext;

namespace SMARAPD_Componentes.Interface.Controllers
{
    /// <summary>
    /// Controlador responsável geração do token de autenticação.
    /// </summary>
    [Route("auth")]
    [ApiController]
    public class AuthController : ControllerBase
    {
        private readonly AuthApplicationService _appService;

        public AuthController(AuthApplicationService appService)
        {
            _appService = appService;
        }

        /// <summary>
        /// Fornece token de autenticação para o usuário.
        /// </summary>
        /// <param name="login">Credenciais do usuário</param>
        /// <returns>Token</returns>
        /// <response code="200">Sucesso na operação</response>
        /// <response code="409">Em caso de erros de validação</response>
        /// <response code="500">Demais erros</response>  
        [HttpPost]
        [AllowAnonymous]
        [ProducesResponseType(200)]
        [ProducesResponseType(409)]
        [ProducesResponseType(500)]
        public IActionResult CreateToken(LoginDTO login)
        {
            var user = _appService.Authenticate(login);

            if (user != null)
            {
                var tokenString = _appService.BuildToken(user);

                return Ok(new { token = tokenString });
            }
            else
            {
                return Unauthorized();
            }
        }

        /// <summary>
        /// Renova o token de autenticação para o usuário.
        /// </summary>
        /// <returns>Token</returns>
        /// <response code="200">Sucesso na operação</response>
        /// <response code="409">Em caso de erros de validação</response>
        /// <response code="500">Demais erros</response>  
        [HttpGet("refresh")]
        [ProducesResponseType(200)]
        [ProducesResponseType(409)]
        [ProducesResponseType(500)]
        [AuthorizeVisitante]
        public IActionResult RefreshToken()
        {
            var tokenString = _appService.RefreshToken();

            if (string.IsNullOrEmpty(tokenString))
            {
                return Unauthorized();
            }

            return Ok(new { token = tokenString });

        }
    }
}
