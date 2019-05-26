using SMARAPD_Componentes.Common.DTO.CategoriaContext;
using SMARAPD_Componentes.Common.DTO.UsuarioContext;
using System;
using System.Collections.Generic;

namespace SMARAPD_Componentes.Common.DTO.ComponenteContext
{
    public class ComponenteGetDTO
    {
        public int Id { get; set; }

        public string Nome { get; set; }

        public string Status { get; set; }

        public string Descricao { get; set; }

        public UsuarioComponenteGetDTO Usuario { get; set; }

        public CategoriaGetDTO Categoria { get; set;}

        public FrameworkGetDTO Framework { get; set; }

        public string Arquivo { get; set; }

        public string Exemplo { get; set; }

        public string Observacao { get; set; }

        public string UrlImagem { get; set; }

        public string Publicado { get; set; }

        public DateTime DataCriacao { get; set; }
        public DateTime DataUltimaAlteracao { get; set; }

        public int IdUsuarioUltimaAlteracao { get; set; }

        public string UsuarioUltimaAlteracao { get; set; }
              

        public List<TagGetDTO> Tags { get; set; }

        public List<ParametroGetDTO> Parametros { get; set; }

        public List<MetodoGetDto> Metodos { get; set; }

        public List<EventoGetDto> Eventos { get; set; }

        public List<DependenciaGetDTO> Dependencias { get; set; }
    }
}
