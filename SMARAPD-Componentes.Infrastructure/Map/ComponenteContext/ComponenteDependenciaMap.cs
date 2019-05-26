using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using SMARAPD_Componentes.Domain.ComponenteContext;

namespace SMARAPD_Componentes.Infrastructure.Map.ComponenteContext
{
    public class ComponenteDependenciaMap : IEntityTypeConfiguration<ComponenteDependencia>
    {
        public void Configure(EntityTypeBuilder<ComponenteDependencia> builder)
        {
            builder.HasOne(d => d.Componente)
                .WithMany(p => p.ComponenteDependencias)
                .HasForeignKey(d => d.ComponenteId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK__Component__idcom__4905A7FF");

            builder.HasOne(d => d.Dependencia)
                .WithMany(p => p.ComponenteDependencias)
                .HasForeignKey(d => d.DependenciaId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK__Component__iddep__481183C6");

            builder.HasOne(d => d.UsuarioUltimaAlteracao)
           .WithMany(p => p.ComponenteDependenciaUsuarioUltimaAlteracao)
           .HasForeignKey(d => d.IdUsuarioUltimaAlteracao);
        }
    }
}
