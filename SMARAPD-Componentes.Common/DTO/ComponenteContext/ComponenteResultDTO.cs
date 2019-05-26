using System;
using System.Collections.Generic;

namespace SMARAPD_Componentes.Common.DTO.ComponenteContext
{
    public class ComponenteResultDTO
    {
        public int Id { get; set; }
        public string Nome { get; set; }

        public string Descricao { get; set; }

        public string Usuario { get; set; }

        public string Categoria { get; set; }

        public string Framework { get; set; }

        public DateTime DataCriacao { get; set; }

        public List<TagGetDTO> Tags { get; set; }

        public bool HasParametros { get; set; }

        public bool HasEventos { get; set; }

        public bool HasMetodos { get; set; }

        public List<DependenciaGetDTO> Dependencias { get; set; }
    }
}
