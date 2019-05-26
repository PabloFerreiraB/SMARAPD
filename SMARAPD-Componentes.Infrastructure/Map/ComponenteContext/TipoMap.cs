using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using SMARAPD_Componentes.Domain.ComponenteContext;

namespace SMARAPD_Componentes.Infrastructure.Map.ComponenteContext
{
    public class TipoMap : IEntityTypeConfiguration<Tipo>
    {
        public void Configure(EntityTypeBuilder<Tipo> builder)
        {
            builder.Property(e => e.Nome)
                .IsUnicode(false);

            builder
                .HasMany(x => x.Metodo)
                .WithOne(x => x.Tipo)
                .HasForeignKey(x => x.IdTipoRetorno);
        }
    }
}
