using Newtonsoft.Json;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace SMARAPD_Componentes.Domain.ComponenteContext
{
    [Table("Framework")]
    public class Framework
    {
        public Framework()
        {
            Componentes = new List<Componente>();
        }

        [Key]
        [Column("id")]
        public int Id { get; set; }

        [Required]
        [Column("nome")]
        [StringLength(100)]
        public string Nome { get; set; }

        [Required]
        [Column("icone")]
        [StringLength(150)]
        public string Icone { get; set; }

        [JsonIgnore]
        public virtual ICollection<Componente> Componentes { get; set; }
    }
}
