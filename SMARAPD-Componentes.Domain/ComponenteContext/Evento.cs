using Newtonsoft.Json;
using SMARAPD_Componentes.Domain.UsuarioContext;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace SMARAPD_Componentes.Domain.ComponenteContext
{
    [Table("Evento")]
    public class Evento
    {
        public Evento()
        {
            ParametrosEvento = new List<ParametroEvento>();
        }

        [Key]
        [Column("id")]
        public int Id { get; set; }

        [Required]
        [Column("idcomponente")]
        public int ComponenteId { get; set; }

        [Required]
        [Column("nome")]
        [StringLength(30)]
        public string Nome { get; set; }

        [Column("descricao")]
        [StringLength(100)]
        public string Descricao { get; set; }

        [Column("exemplo")]
        public string Exemplo { get; set; }

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
        public ICollection<ParametroEvento> ParametrosEvento { get; set; }
    }
}
