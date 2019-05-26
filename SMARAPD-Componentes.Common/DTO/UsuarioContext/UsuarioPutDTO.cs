namespace SMARAPD_Componentes.Common.DTO.UsuarioContext
{
    public class UsuarioPutDTO
    {
        public int Id { get; set; }

        public string Nome { get; set; }

        public string Email { get; set; }

        public string Login { get; set; }

        public string Imagem { get; set; }

        public bool IsSuperUsuario { get; set; }

        public bool IsAutorizado { get; set; }
    }
}
