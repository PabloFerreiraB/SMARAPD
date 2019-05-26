using System;
using System.Collections.Generic;
using System.Text;

namespace SMARAPD_Componentes.Common.DTO.ComponenteContext
{
    public class EventoPostDto
    {

        public int ComponenteId { get; set; }

        public string Nome { get; set; }

        public string Descricao { get; set; }

        public string Exemplo { get; set; }

        public List<ParametroEventoDto> ParametrosEvento { get; set; }
    }
}
