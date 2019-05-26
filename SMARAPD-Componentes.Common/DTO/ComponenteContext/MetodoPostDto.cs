using System;
using System.Collections.Generic;
using System.Text;

namespace SMARAPD_Componentes.Common.DTO.ComponenteContext
{
    public class MetodoPostDto
    {
        public int ComponenteId { get; set; }

        public string Nome { get; set; }

        public string Descricao { get; set; }

        public int IdTipoRetorno { get; set; }

        public string Exemplo { get; set; }

        public virtual List<ParametroMetodoDto> ParametrosMetodo { get; set; }
    }
}
