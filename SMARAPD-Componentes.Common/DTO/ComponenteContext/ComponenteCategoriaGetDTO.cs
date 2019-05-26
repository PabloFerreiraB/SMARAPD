using SMARAPD_Componentes.Common.DTO.CategoriaContext;
using System;
using System.Collections.Generic;
using System.Text;

namespace SMARAPD_Componentes.Common.DTO.ComponenteContext
{
    public class ComponenteCategoriaGetDTO
    {
        public int Id { get; set; }
        public string Nome { get; set; }
        public string Icone { get; set; }

        public List<ComponenteMenuGetDTO> Componentes { get; set; }
    }
}
