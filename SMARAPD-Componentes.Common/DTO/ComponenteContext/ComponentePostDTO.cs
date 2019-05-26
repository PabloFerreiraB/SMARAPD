using System;
using System.Collections.Generic;
using System.Text;

namespace SMARAPD_Componentes.Common.DTO.ComponenteContext
{
    public class ComponentePostDTO
    {
        public string Nome { get; set; }

        public string Status { get; set; }

        public string Descricao { get; set; }

        public int IdUsuario { get; set; }

        public int IdCategoria { get; set; }

        public int IdFramework { get; set; }

        public string Arquivo { get; set; }

        public string Exemplo { get; set; }

        public string Observacao { get; set; }

        public string Imagem { get; set; }

        public bool Publicado { get; set; }

        public List<TagPostDTO> Tags { get; set; }

        public List<ParametroPostDTO> Parametros { get; set; }

        public List<MetodoPostDto> Metodos { get; set; }

        public List<EventoPostDto> Eventos { get; set; }

        public List<DependenciaPostDTO> Dependencias { get; set; }
    }
}
