using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using SMARAPD_Componentes.Domain.CategoriaContext;

namespace SMARAPD_Componentes.Infrastructure.Map.CategoriaContext
{
    public class CategoriaMap : IEntityTypeConfiguration<Categoria>
    {
        public void Configure(EntityTypeBuilder<Categoria> builder)
        {
            builder.Property(e => e.Id);

            builder.Property(e => e.Nome)
                .IsUnicode(false);

            builder.Property(e => e.Icone)
                .IsUnicode(false);
        }
    }
}
