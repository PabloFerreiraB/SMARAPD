using System;
using System.Collections.Generic;
using System.Text;

namespace SMARAPD_Componentes.Common.DTO.ComponenteContext
{
    public class ComponenteGridGetDTO
    {
        public int Id { get; set; }

        public string Nome { get; set; }

        public string Autor { get; set; }

        public string FrameworkIcone { get; set; }

        public string Status { get; set; }

        public string Publicado { get; set; }
    }
}
