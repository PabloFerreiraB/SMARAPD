using Newtonsoft.Json;
using SMARAPD_Componentes.Domain.UsuarioContext;
using System;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace SMARAPD_Componentes.Domain.ComponenteContext
{
    [Table("ComponenteDependencia")]
    public class ComponenteDependencia
    {
        [Key]
        [Column("id")]
        public int Id { get; set; }

        [Required]
        [Column("idcomponente")]
        public int ComponenteId { get; set; }

        [Required]
        [Column("iddependencia")]
        public int DependenciaId { get; set; }

        [Required]
        [Column("idusuario_ultima_alteracao")]
        public int IdUsuarioUltimaAlteracao { get; set; }

        [Required]
        [Column("data_ultima_alteracao")]
        public DateTime DataUltimaAlteracao { get; set; }

        [JsonIgnore]
        public virtual Usuario UsuarioUltimaAlteracao { get; set; }

        [JsonIgnore]
        public virtual Componente Componente { get; set; }

        [JsonIgnore]
        public virtual Dependencia Dependencia { get; set; }
    }
}
