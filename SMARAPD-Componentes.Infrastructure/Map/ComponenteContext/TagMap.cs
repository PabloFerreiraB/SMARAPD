using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using SMARAPD_Componentes.Domain.ComponenteContext;

namespace SMARAPD_Componentes.Infrastructure.Map.ComponenteContext
{
    public class TagMap : IEntityTypeConfiguration<Tag>
    {
        public void Configure(EntityTypeBuilder<Tag> builder)
        {
            builder.Property(e => e.Nome)
                .IsUnicode(false);
        }
    }
}
