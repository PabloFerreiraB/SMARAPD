using Newtonsoft.Json;
using SMARAPD_Componentes.Domain.CategoriaContext;
using SMARAPD_Componentes.Domain.UsuarioContext;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace SMARAPD_Componentes.Domain.ComponenteContext
{
    [Table("Componente")]
    public class Componente
    {
        public Componente()
        {
            ComponenteTags = new List<ComponenteTag>();
            Metodos = new List<Metodo>();
            Eventos = new List<Evento>();
            Parametros = new List<Parametro>();
            ComponenteDependencias = new List<ComponenteDependencia>();
        }

        [Key]
        [Column("id")]
        public int Id { get; set; }

        [Required]
        [Column("idusuario")]
        public int UsuarioId { get; set; }

        [Required]
        [Column("idcategoria")]
        public int CategoriaId { get; set; }

        [Required]
        [Column("idframework")]
        public int FrameworkId { get; set; }

        [Required]
        [Column("nome")]
        [StringLength(40)]
        public string Nome { get; set; }

        [Column("descricao")]
        [StringLength(300)]
        public string Descricao { get; set; }

        [Column("exemplo", TypeName = "text")]
        public string Exemplo { get; set; }

        [Column("observacao", TypeName = "text")]
        public string Observacao { get; set; }

        [Column("arquivo")]
        [StringLength(20)]
        public string Arquivo { get; set; }

        [Column("publicado")]
        public bool Publicado { get; set; }

        [Required]
        [Column("status")]
        [StringLength(50)]
        public string Status { get; set; }

        [Column("imageurl")]
        [StringLength(500)]
        public string Imageurl { get; set; }

        [Required]
        [Column("datacriacao")]
        public DateTime DataCriacao { get; set; }

        [Required]
        [Column("idusuario_ultima_alteracao")]
        public int IdUsuarioUltimaAlteracao { get; set; }

        [Required]
        [Column("data_ultima_alteracao")]
        public DateTime DataUltimaAlteracao { get; set; }

        [JsonIgnore]
        public virtual Usuario Usuario { get; set; }

        [JsonIgnore]
        public virtual Usuario UsuarioUltimaAlteracao { get; set; }

        [JsonIgnore]
        public virtual Categoria Categoria { get; set; }

        [JsonIgnore]
        public virtual Framework Framework { get; set; }

        [JsonIgnore]
        public virtual ICollection<Metodo> Metodos { get; set; }

        [JsonIgnore]
        public virtual ICollection<Parametro> Parametros { get; set; }

        [JsonIgnore]
        public virtual ICollection<Evento> Eventos { get; set; }

        [JsonIgnore]
        public virtual ICollection<ComponenteTag> ComponenteTags { get; set; }

        [JsonIgnore]
        public virtual ICollection<ComponenteDependencia> ComponenteDependencias { get; set; }
    }
}
