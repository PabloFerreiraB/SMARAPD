using SMARAPD_Componentes.Domain.UsuarioContext;
using SMARAPD_Componentes.Infrastructure.Model;
using SMARAPD_Componentes.Infrastructure.Repository.Base;
using System.Linq;
using SMARAPD_Componentes.Common.DTO.UsuarioContext;
using SMARAPD_Componentes.Common.Helper;

namespace SMARAPD_Componentes.Infrastructure.Repository.UsuarioContext
{
    public class UsuarioRepository : GenericRepository<Usuario, ComponenteModel>
    {
        public UsuarioRepository(ComponenteModel context) : base(context)
        {

        }

        public IQueryable<Usuario> GetById(int id)
        {
            return _context.Usuarios.Where(x => x.Id == id);
        }

        public Usuario GetByUserNameAndPassword(string userName, string password)
        {
            var passwordToCompare = Helper.ComputeSha256Hash(password);

            return _context.Usuarios.SingleOrDefault(x => x.Login == userName && x.Senha == passwordToCompare && x.IsAutorizado);
        }

        public Usuario GetByUserName(string userName)
        {
            return _context.Usuarios.SingleOrDefault(x => x.Login == userName);
        }

        public bool ValideUser(string userName, bool isSuperUser)
        {
            return _context.Usuarios.Any(x => x.Login == userName && x.IsSuperUsuario == isSuperUser && x.IsAutorizado);
        }
    }
}
