using System;
using System.Collections.Generic;
using System.Text;

namespace SMARAPD_Componentes.Common.DTO.ComponenteContext
{
    public class PesquisaDTO
    {
        public string Pesquisa { get; set; }

        public string Parametro { get; set; }

        public string Metodo { get; set; }

        public string Evento { get; set; }

        public string Categoria { get; set; }

        public List<TagGetDTO> Tags { get; set; }

        public int IdCategoria { get; set; }

        public bool BuscaPadrao { get; set; }

        public bool BuscaPorCategoria { get; set; }

        public List<DependenciaGetDTO> Dependencias { get; set; }

    }
}
