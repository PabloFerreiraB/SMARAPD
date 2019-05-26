using Newtonsoft.Json;
using SMARAPD_Componentes.Domain.ComponenteContext;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace SMARAPD_Componentes.Domain.CategoriaContext
{
    [Table("Categoria")]
    public class Categoria
    {
        public Categoria()
        {
            Componentes = new List<Componente>();
        }

        [Key]
        [Column("id")]
        public int Id { get; set; }

        [Required]
        [Column("nome")]
        [StringLength(40)]
        public string Nome { get; set; }

        [Column("icone")]
        [StringLength(40)]
        public string Icone { get; set; }

        [JsonIgnore]
        public virtual ICollection<Componente> Componentes { get; set; }
    }
}
