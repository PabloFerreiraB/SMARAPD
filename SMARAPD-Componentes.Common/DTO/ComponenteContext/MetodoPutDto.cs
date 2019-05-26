using System;
using System.Collections.Generic;
using System.Text;

namespace SMARAPD_Componentes.Common.DTO.ComponenteContext
{
    public class MetodoPutDto
    {
        public string Nome { get; set; }

        public string Descricao { get; set; }

        public int IdTipoRetorno { get; set; }

        public string Exemplo { get; set; }
    }
}
