namespace SMARAPD_Componentes.Common.DTO.ComponenteContext
{
    public class ParametroMetodoGetDto
    {
        public int Id { get; set; }

        public int MetodoId { get; set; }

        public string Nome { get; set; }

        public string Descricao { get; set; }

        public bool Obrigatorio { get; set; }

        public TipoGetDTO Tipo { get; set; }
    }
}
