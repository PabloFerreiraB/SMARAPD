using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using SMARAPD_Componentes.Domain.ComponenteContext;

namespace SMARAPD_Componentes.Infrastructure.Map.ComponenteContext
{
    public class ComponenteTagMap : IEntityTypeConfiguration<ComponenteTag>
    {
        public void Configure(EntityTypeBuilder<ComponenteTag> builder)
        {
            builder.Property(e => e.Id);

            builder.Property(e => e.ComponenteId);

            builder.Property(e => e.TagId);

            builder.HasOne(d => d.Componente)
                .WithMany(p => p.ComponenteTags)
                .HasForeignKey(d => d.ComponenteId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK__Component__idcom__4B22FA9B");

            builder.HasOne(d => d.Tag)
                .WithMany(p => p.ComponenteTags)
                .HasForeignKey(d => d.TagId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK__Component__idtag__4C171ED4");
        }
    }
}
