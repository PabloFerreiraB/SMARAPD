namespace SMARAPD_Componentes.Common.DTO.ComponenteContext
{
    public class ParametroGetDTO
    {
        public int Id { get; set; }

        public int ComponenteId { get; set; }

        public string Nome { get; set; }

        public string Descricao { get; set; }

        public bool Obrigatorio { get; set; }

        public TipoGetDTO Tipo { get; set; }
    }
}
