using Newtonsoft.Json;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace SMARAPD_Componentes.Domain.ComponenteContext
{
    [Table("ComponenteTag")]
    public class ComponenteTag
    {
        [Key]
        [Column("id")]
        public int Id { get; set; }

        [Required]
        [Column("idtag")]
        public int TagId { get; set; }

        [Required]
        [Column("idcomponente")]
        public int ComponenteId { get; set; }

        [JsonIgnore]
        public virtual Tag Tag { get; set; }

        [JsonIgnore]
        public virtual Componente Componente { get; set; }
    }
}
