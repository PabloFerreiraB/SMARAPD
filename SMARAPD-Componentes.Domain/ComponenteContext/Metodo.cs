using Newtonsoft.Json;
using SMARAPD_Componentes.Domain.UsuarioContext;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace SMARAPD_Componentes.Domain.ComponenteContext
{
    [Table("Metodo")]
    public class Metodo
    {
        public Metodo()
        {
            ParametrosMetodo = new List<ParametroMetodo>();
        }

        [Key]
        [Column("id")]
        public int Id { get; set; }

        [Required]
        [Column("idcomponente")]
        public int ComponenteId { get; set; }

        [Required]
        [Column("nome")]
        [StringLength(10)]
        public string Nome { get; set; }

        [Column("descricao")]
        [StringLength(100)]
        public string Descricao { get; set; }

        [Column("exemplo", TypeName = "text")]
        public string Exemplo { get; set; }

        [Required]
        [Column("idtiporetorno")]
        public int IdTipoRetorno { get; set; }

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
        public virtual Tipo Tipo { get; set; }

        [JsonIgnore]
        public virtual ICollection<ParametroMetodo> ParametrosMetodo { get; set; }
    }
}
