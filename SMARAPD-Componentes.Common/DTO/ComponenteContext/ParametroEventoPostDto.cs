namespace SMARAPD_Componentes.Common.DTO.ComponenteContext
{
    public class ParametroEventoPostDto
    {
        public int EventoId { get; set; }

        public int TipoId { get; set; }

        public string Nome { get; set; }

        public string Descricao { get; set; }

        public bool Obrigatorio { get; set; }
    }
}
