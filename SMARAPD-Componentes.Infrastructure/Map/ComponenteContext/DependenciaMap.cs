using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using SMARAPD_Componentes.Domain.ComponenteContext;

namespace SMARAPD_Componentes.Infrastructure.Map.ComponenteContext
{
    public class DependenciaMap : IEntityTypeConfiguration<Dependencia>
    {
        public void Configure(EntityTypeBuilder<Dependencia> builder)
        {
            builder.Property(e => e.Nome)
                .IsUnicode(false);

            builder.Property(e => e.Versao)
                .IsUnicode(false);

            builder.Property(e => e.Status)
                .IsUnicode(false);

            builder.Property(e => e.Url)
             .IsUnicode(false);
        }
    }
}
