using Newtonsoft.Json;
using System;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace SMARAPD_Componentes.Domain.HistoricoContext
{
    [Table("ComponenteLog")]
    public class Historico
    {
        [Key]
        [Column("id")]
        public int Id { get; set; }

        [Column("idcomponente")]
        public int ComponenteId { get; set; }

        [Column("nomecomponente")]
        [StringLength(100)]
        public string NomeComponente { get; set; }

        [Column("login")]
        [StringLength(20)]
        public string LoginUsuario { get; set; }

        [Column("operacao")]
        [StringLength(20)]
        public string Operacao { get; set; }

        [Column("tabela")]
        [StringLength(50)]
        public string Tabela { get; set; }

        [Column("data")]
        public DateTime Data { get; set; }

        [Column("log")]
        [MaxLength]
        public string Log { get; set; }

    }
}