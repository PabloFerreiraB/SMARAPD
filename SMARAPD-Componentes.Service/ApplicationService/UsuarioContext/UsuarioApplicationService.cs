using SMARAPD_Componentes.Common.DTO.UsuarioContext;
using SMARAPD_Componentes.Common.Exceptions;
using SMARAPD_Componentes.Common.Helper;
using SMARAPD_Componentes.Common.Resource;
using SMARAPD_Componentes.Domain.UsuarioContext;
using SMARAPD_Componentes.Infrastructure.UnitOfWork.UsuarioContext;
using SMARAPD_Componentes.Service.ApplicationService.Base;
using System.Collections.Generic;
using System.Linq;

namespace SMARAPD_Componentes.Service.ApplicationService.UsuarioContext
{
    public class UsuarioApplicationService : BaseApplicationService
    {
        private readonly UsuarioUnitOfWork _uow;

        private readonly ImageUpload _imageUpload;

        private readonly EmailService _emailService;

        private readonly string funcNome = "Usuário";

        public UsuarioApplicationService(UsuarioUnitOfWork uow, 
                                         ImageUpload imageUpload,
                                         EmailService emailService)
        {
            _uow = uow;
            _imageUpload = imageUpload;
            _emailService = emailService;
        }

        public List<UsuarioGridGetAllDTO> GridGetAll()
        {
            var usuarios = _uow.UsuarioRepository.GetAll()
                .Where(x => x.IsAutorizado)
                .Select(x => new UsuarioGridGetAllDTO
                {
                    Id = x.Id,
                    Nome = x.Nome,
                    Login = x.Login,
                    IsSuperUsuario = x.IsSuperUsuario ? "Administrador" : "Comum"
                }).ToList();

            VerifyExists(usuarios, funcNome);
            return usuarios;
        }

        public List<UsuarioGetDTO> GetAll()
        {
            var usuarios = _uow.UsuarioRepository.GetAll().Select(x => new UsuarioGetDTO
            {
                Id = x.Id,
                Nome = x.Nome,
                Email = x.Email,
                Login = x.Login,
                Imagem = x.ImageUrl,
                IsAutorizado = x.IsAutorizado,
                IsSuperUsuario = x.IsSuperUsuario ? "Administrador" : "Comum"
            }).ToList();

            VerifyExists(usuarios, funcNome);
            return usuarios;
        }

        public List<UsuarioGridGetAllDTO> GetAllByAutorizacao()
        {
            var usuarios = _uow.UsuarioRepository.GetAll()
                .Where(x => x.IsAutorizado == false)
                .Select(x => new UsuarioGridGetAllDTO
                {
                    Id = x.Id,
                    Login = x.Login,
                    Nome = x.Nome,
                    IsAutorizado = x.IsAutorizado ? "Autorizado" : "Não autorizado",
                    IsSuperUsuario = x.IsSuperUsuario ? "Administrador" : "Comum"
                }).ToList();

            VerifyExists(usuarios, funcNome);
            return usuarios;
        }
        public UsuarioGetDTO GetById(int id)
        {
            var dto = _uow.UsuarioRepository.GetById(id).Select(x => new UsuarioGetDTO
            {
                Id = x.Id,
                Nome = x.Nome,
                Email = x.Email,
                Login = x.Login,
                Imagem = x.ImageUrl,
                IsAutorizado = x.IsAutorizado,
                IsAutorizadoDescricao = x.IsAutorizado ? "Autorizado" : "Não autorizado",
                IsSuperUsuario = x.IsSuperUsuario ? "Administrador" : "Comum"
            })
            .FirstOrDefault();

            VerifyExists(dto, funcNome);

            return dto;
        }

        public int CountNaoAutorizados()
        {
            var count = _uow.UsuarioRepository.GetAll().Count(x => !x.IsAutorizado);

            return count;
        }

        public void Save(UsuarioPostDTO dto)
        {
            VerifyExists(dto, CommonMessages.InformacoesEntrada);

            if (_uow.UsuarioRepository.GetAll().Any(x => x.Login == dto.Login))
            {
                throw new DomainException("Login já em uso");
            }

            var usuario = new Usuario
            {
                Nome = dto.Nome,
                Email = dto.Email,
                Login = dto.Login,
                Senha = Helper.ComputeSha256Hash(dto.Senha),
                IsSuperUsuario = dto.IsSuperUsuario,
                IsAutorizado = dto.IsAutorizado
            };

            if (!string.IsNullOrWhiteSpace(dto.Imagem) && !dto.Imagem.StartsWith("http"))
            {
                if (!string.IsNullOrWhiteSpace(usuario.ImageUrl))
                    _imageUpload.DeleteImage(usuario.ImageUrl);
                var imageUrl = _imageUpload.SaveImage(dto.Imagem);
                usuario.ImageUrl = imageUrl;
            }

            Validate(usuario);

            _uow.UsuarioRepository.Add(usuario);
            _uow.Commit();

            _emailService.SendAuthorizedEmail(usuario.Email).ConfigureAwait(false);
        }

        public void UsuarioExternoSave(UsuarioExternoPostDTO dto)
        {
            VerifyExists(dto, CommonMessages.InformacoesEntrada);

            if (_uow.UsuarioRepository.GetAll().Any(x => x.Login == dto.Login))
            {
                throw new DomainException("Login já em uso");
            }

            var usuario = new Usuario
            {
                Nome = dto.Nome,
                Email = dto.Email,
                Login = dto.Login,
                Senha = Helper.ComputeSha256Hash(dto.Senha),
                IsSuperUsuario = false,
                IsAutorizado = false
            };

            Validate(usuario);

            _uow.UsuarioRepository.Add(usuario);
            _uow.Commit();

            _emailService.SendConfirmationEmail(usuario.Email).ConfigureAwait(false);
            _emailService.SendAuthorizeRequestEmail(usuario.Email).ConfigureAwait(false);
        }

        public void Update(int id, UsuarioPutDTO dto)
        {
            VerifyExists(dto, CommonMessages.InformacoesEntrada);

            var usuario = _uow.UsuarioRepository.GetById(id).FirstOrDefault();

            if (_uow.UsuarioRepository.GetAll().Any(x => x.Login == dto.Login && x.Id != usuario.Id))
            {
                throw new DomainException("Login já em uso");
            }

            VerifyExists(usuario, funcNome);

            usuario.Nome = dto.Nome;
            usuario.Email = dto.Email;
            usuario.Login = dto.Login;
            usuario.IsSuperUsuario = dto.IsSuperUsuario;
            usuario.IsAutorizado = dto.IsAutorizado;

            if (!string.IsNullOrWhiteSpace(dto.Imagem) && !dto.Imagem.StartsWith("http"))
            {
                if (!string.IsNullOrWhiteSpace(usuario.ImageUrl))
                    _imageUpload.DeleteImage(usuario.ImageUrl);
                usuario.ImageUrl = _imageUpload.SaveImage(dto.Imagem);
            }

            Validate(usuario);

            _uow.Commit();
        }

        public void UpdatePassword(int id, UsuarioPutPasswordDTO dto)
        {
            VerifyExists(dto, CommonMessages.InformacoesEntrada);

            var usuario = _uow.UsuarioRepository.GetById(id).FirstOrDefault();

            VerifyExists(usuario, funcNome);

            usuario.Senha = Helper.ComputeSha256Hash(dto.NovaSenha);
            Validate(usuario);

            _uow.Commit();
        }

        public void UpdatePasswordPerfil(int id, UsuarioPutPasswordDTO dto)
        {
            VerifyExists(dto, CommonMessages.InformacoesEntrada);

            var usuario = _uow.UsuarioRepository.GetById(id).FirstOrDefault();

            VerifyExists(usuario, funcNome);

            var senhaAtual = Helper.ComputeSha256Hash(dto.SenhaAtual);

            if (senhaAtual == usuario.Senha)
            {
                usuario.Senha = Helper.ComputeSha256Hash(dto.NovaSenha);
                _uow.Commit();
            }
            else
                throw new DomainException("A senha atual está incorreta");
        }

        public void UpdateAllAutorizacao()
        {
            var usuarios = _uow.UsuarioRepository.GetAll()
                .Where(x => x.IsAutorizado == false)
                .ToList();

            VerifyExists(usuarios, funcNome);

            usuarios.ForEach(x => x.IsAutorizado = true);
            _uow.Commit();

            foreach (var usuario in usuarios)
            {
                _emailService.SendAuthorizedEmail(usuario.Email).ConfigureAwait(false);
            }
        }

        public void UpdateAutorizacao(int id)
        {
            var usuario = _uow.UsuarioRepository.GetById(id).FirstOrDefault();
            VerifyExists(usuario, funcNome);

            usuario.IsAutorizado = true;
            _uow.Commit();

            _emailService.SendAuthorizedEmail(usuario.Email).ConfigureAwait(false);
        }

        public bool Validate(Usuario usuario)
        {
            if (string.IsNullOrWhiteSpace(usuario.Nome))
                throw new DomainException(string.Format(CommonMessages.Required, "Nome"));
            if (string.IsNullOrWhiteSpace(usuario.Email))
                throw new DomainException(string.Format(CommonMessages.Required, "Email"));
            if (string.IsNullOrWhiteSpace(usuario.Login))
                throw new DomainException(string.Format(CommonMessages.Required, "Login"));
            return true;
        }
    }
}
