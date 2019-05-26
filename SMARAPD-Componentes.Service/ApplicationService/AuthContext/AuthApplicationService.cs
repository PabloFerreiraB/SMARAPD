using Microsoft.Extensions.Configuration;
using Microsoft.IdentityModel.Tokens;
using SMARAPD_Componentes.Common.DTO.AuthContext;
using SMARAPD_Componentes.Common.Exceptions;
using SMARAPD_Componentes.Domain.UsuarioContext;
using SMARAPD_Componentes.Infrastructure.UnitOfWork.AuthContext;
using SMARAPD_Componentes.Service.ApplicationService.Base;
using System;
using System.IdentityModel.Tokens.Jwt;
using System.Security.Claims;
using System.Text;

namespace SMARAPD_Componentes.Service.ApplicationService.AuthContext
{
    public class AuthApplicationService : BaseApplicationService
    {
        private IConfiguration _config;
        private readonly AuthUnitOfWork _uow;

        public AuthApplicationService(IConfiguration config, AuthUnitOfWork uow)
        {
            _config = config;
            _uow = uow;
        }

        public Usuario Authenticate(LoginDTO login)
        {
            VerifyExists(login, "Usuário");

            if (string.IsNullOrEmpty(login.Username) || string.IsNullOrEmpty(login.Password))
            {
                throw new DomainException("Usuário não encontrado.");
            }

            var user = _uow.UsuarioRepository.GetByUserNameAndPassword(login.Username, login.Password);

            if (user == null)
            {
                throw new DomainException("Usuário e/ou senha inválido(s).");
            }

            return user;
        }

        public string RefreshToken()
        {
            var validUser = _uow.UsuarioRepository.ValideUser(UserName, IsSuperUser);

            if (!validUser)
            {
                return string.Empty;
            }

            var user = _uow.UsuarioRepository.GetByUserName(UserName);

            return BuildToken(user);
        }

        public string BuildToken(Usuario user)
        {
            var claims = new[] {
                 new Claim(JwtRegisteredClaimNames.Sub, user.Nome),
                 new Claim(JwtRegisteredClaimNames.Email, user.Email),
                 new Claim("isSuperUser", user.IsSuperUsuario.ToString()),
                 new Claim("userName", user.Login.ToString()),
                 new Claim("userId", user.Id.ToString()),                 
                 new Claim("refreshToken", DateTime.Now.AddMinutes(Convert.ToInt32(_config["Jwt:MinutesToRefresh"])).ToString("MM/dd/yyyy HH:mm:ss")),
                 new Claim(JwtRegisteredClaimNames.Jti, Guid.NewGuid().ToString())
             };

            var key = new SymmetricSecurityKey(Encoding.UTF8.GetBytes(_config["Jwt:Key"]));
            var creds = new SigningCredentials(key, SecurityAlgorithms.HmacSha256);

            var token = new JwtSecurityToken(
                _config["Jwt:Issuer"],
                _config["Jwt:Audience"],
                claims,
                expires: DateTime.Now.AddMinutes(Convert.ToInt32(_config["Jwt:MinutesToExpires"])),                                
                signingCredentials: creds);

            return new JwtSecurityTokenHandler().WriteToken(token);
        }
    }
}
