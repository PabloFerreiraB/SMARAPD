using Newtonsoft.Json;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace SMARAPD_Componentes.Domain.ComponenteContext
{
    [Table("Dependencia")]
    public class Dependencia
    {
        public Dependencia()
        {
            ComponenteDependencias = new List<ComponenteDependencia>();
        }

        [Key]
        [Column("id")]
        public int Id { get; set; }

        [Required]
        [Column("nome")]
        [StringLength(25)]
        public string Nome { get; set; }

        [Required]
        [Column("versao")]
        [StringLength(10)]
        public string Versao { get; set; }

        [Required]
        [Column("status")]
        [StringLength(20)]
        public string Status { get; set; }

        [Column("url")]
        [StringLength(1000)]
        public string Url { get; set; }

        [JsonIgnore]
        public virtual ICollection<ComponenteDependencia> ComponenteDependencias { get; set; }
    }
}
