using System.Collections.Generic;

namespace SMARAPD_Componentes.Common.DTO.ComponenteContext
{
    public class ComponentePutDTO
    {
        public string Nome { get; set; }

        public string Status { get; set; }

        public string Descricao { get; set; }

        public int IdCategoria { get; set; }

        public int IdFramework { get; set; }

        public string Arquivo { get; set; }

        public string Exemplo { get; set; }

        public string Observacao { get; set; }

        public string Imagem { get; set; }

        public string ImagemPut { get; set; }

        public bool Publicado { get; set; }

        public List<TagPutDTO> Tags { get; set; }
        public List<DependenciaPutDTO> Dependencias { get; set; }
    }
}
