namespace SMARAPD_Componentes.Common.DTO.ComponenteContext
{
    public class ParametroEventoPutDto
    {
        public string Nome { get; set; }

        public int TipoId { get; set; }

        public string Descricao { get; set; }

        public bool Obrigatorio { get; set; }
    }
}
