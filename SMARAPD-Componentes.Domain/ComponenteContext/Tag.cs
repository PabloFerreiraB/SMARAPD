using Newtonsoft.Json;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace SMARAPD_Componentes.Domain.ComponenteContext
{
    [Table("Tag")]
    public class Tag
    {
        public Tag()
        {
            ComponenteTags = new List<ComponenteTag>();
        }

        [Key]
        [Column("id")]
        public int Id { get; set; }

        [Required]
        [Column("nome")]
        [StringLength(80)]
        public string Nome { get; set; }

        [JsonIgnore]
        public virtual ICollection<ComponenteTag> ComponenteTags { get; set; }
    }
}
