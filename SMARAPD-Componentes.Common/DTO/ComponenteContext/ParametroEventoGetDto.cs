namespace SMARAPD_Componentes.Common.DTO.ComponenteContext
{
    public class ParametroEventoGetDto
    {
        public int Id { get; set; }

        public int EventoId { get; set; }

        public int TipoId { get; set; }

        public string Nome { get; set; }

        public string Descricao { get; set; }

        public bool Obrigatorio { get; set; }

        public TipoGetDTO Tipo { get; set; }
    }
}
