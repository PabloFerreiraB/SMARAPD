using Newtonsoft.Json;
using SMARAPD_Componentes.Domain.UsuarioContext;
using System;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace SMARAPD_Componentes.Domain.ComponenteContext
{
    [Table("ParametroMetodo")]
    public class ParametroMetodo
    {
        [Key]
        [Column("id")]
        public int Id { get; set; }

        [Required]
        [Column("idmetodo")]
        public int MetodoId { get; set; }

        [Required]
        [Column("idtipo")]
        public int TipoId { get; set; }

        [Required]
        [Column("nome")]
        [StringLength(10)]
        public string Nome { get; set; }

        [Column("descricao")]
        [StringLength(100)]
        public string Descricao { get; set; }

        [Required]
        [Column("obrigatorio")]
        public bool Obrigatorio { get; set; }

        [Required]
        [Column("idusuario_ultima_alteracao")]
        public int IdUsuarioUltimaAlteracao { get; set; }

        [Required]
        [Column("data_ultima_alteracao")]
        public DateTime DataUltimaAlteracao { get; set; }

        [JsonIgnore]
        public virtual Usuario UsuarioUltimaAlteracao { get; set; }

        [JsonIgnore]
        public virtual Metodo Metodo { get; set; }

        [JsonIgnore]
        public virtual Tipo Tipo { get; set; }
    }
}
