using Newtonsoft.Json;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace SMARAPD_Componentes.Domain.ComponenteContext
{
    [Table("tipo")]
    public class Tipo
    {
        public Tipo()
        {
            Parametros = new List<Parametro>();
            ParametrosEvento = new List<ParametroEvento>();
            ParametrosMetodo = new List<ParametroMetodo>();
            Metodo = new List<Metodo>();
        }

        [Key]
        [Column("id")]
        public int Id { get; set; }

        [Required]
        [Column("nome")]
        [StringLength(50)]
        public string Nome { get; set; }
        
        [Column("tipoRetorno")]       
        public bool TipoRetorno { get; set; }

        [Column("tipoParametro")]
        public bool TipoParametro { get; set; }

        [JsonIgnore]
        public ICollection<Parametro> Parametros { get; set; }

        [JsonIgnore]
        public ICollection<ParametroEvento> ParametrosEvento { get; set; }

        [JsonIgnore]
        public ICollection<ParametroMetodo> ParametrosMetodo { get; set; }

        [JsonIgnore]
        public ICollection<Metodo> Metodo { get; set; }
    }
}
