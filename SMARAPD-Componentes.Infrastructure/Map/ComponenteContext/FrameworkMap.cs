using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using SMARAPD_Componentes.Domain.ComponenteContext;

namespace SMARAPD_Componentes.Infrastructure.Map.ComponenteContext
{
    public class FrameworkMap : IEntityTypeConfiguration<Framework>
    {
        public void Configure(EntityTypeBuilder<Framework> builder)
        {
            builder.Property(e => e.Id);

            builder.Property(e => e.Nome)
                .IsUnicode(false);

            builder.Property(e => e.Icone)
                .IsUnicode(false);
        }
    }
}
