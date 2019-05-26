using System;
using System.Collections.Generic;
using System.Text;

namespace SMARAPD_Componentes.Common.DTO.ComponenteContext
{
    public class MetodoGetDto
    {
        public int Id { get; set; }

        public int ComponenteId { get; set; }

        public string Nome { get; set; }

        public string Descricao { get; set; }

        public string Retorno { get; set; }

        public int IdTipoRetorno { get; set; }

        public string Exemplo { get; set; }

        public virtual List<ParametroMetodoGetDto> ParametrosMetodo { get; set; }
    }
}