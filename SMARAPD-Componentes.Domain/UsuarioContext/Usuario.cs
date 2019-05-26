using Newtonsoft.Json;
using SMARAPD_Componentes.Domain.ComponenteContext;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace SMARAPD_Componentes.Domain.UsuarioContext
{
    [Table("usuario")]
    public class Usuario
    {
        public Usuario()
        {
            Componentes = new List<Componente>();
        }

        [Key]
        [Column("id")]
        public int Id { get; set; }

        [Required]
        [Column("nome")]
        [StringLength(30)]
        public string Nome { get; set; }

        [Required]
        [Column("login")]
        [StringLength(20)]
        public string Login { get; set; }

        [Required]
        [Column("email")]
        [StringLength(35)]
        public string Email { get; set; }

        [Column("imageurl")]
        [StringLength(500)]
        public string ImageUrl { get; set; }

        [Required]
        [Column("senha")]
        [StringLength(20)]
        public string Senha { get; set; }

        [Column("superusuario")]
        public bool IsSuperUsuario { get; set; }

        [Column("autorizado")]
        public bool IsAutorizado { get; set; }

        [JsonIgnore]
        public virtual ICollection<Componente> Componentes { get; set; }

        [JsonIgnore]
        public virtual ICollection<Componente> ComponentesUsuarioUltimaAlteracao { get; set; }

        [JsonIgnore]
        public virtual ICollection<Metodo> MetodoUsuarioUltimaAlteracao { get; set; }

        [JsonIgnore]
        public virtual ICollection<Evento> EventoUsuarioUltimaAlteracao { get; set; }

        [JsonIgnore]
        public virtual ICollection<Parametro> ParametroUsuarioUltimaAlteracao { get; set; }

        [JsonIgnore]
        public virtual ICollection<ParametroMetodo> ParametroMetodoUsuarioUltimaAlteracao { get; set; }

        [JsonIgnore]
        public virtual ICollection<ParametroEvento> ParametroEventoUsuarioUltimaAlteracao { get; set; }

        [JsonIgnore]
        public virtual ICollection<ComponenteDependencia> ComponenteDependenciaUsuarioUltimaAlteracao { get; set; }
    }
}
