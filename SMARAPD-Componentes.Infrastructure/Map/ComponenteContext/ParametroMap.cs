using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using SMARAPD_Componentes.Domain.ComponenteContext;

namespace SMARAPD_Componentes.Infrastructure.Map.ComponenteContext
{
    public class ParametroMap : IEntityTypeConfiguration<Parametro>
    {
        public void Configure(EntityTypeBuilder<Parametro> builder)
        {
            builder.Property(e => e.Descricao)
                .IsUnicode(false);

            builder.Property(e => e.Nome)
                .IsUnicode(false);

            builder.HasOne(d => d.Componente)
                .WithMany(p => p.Parametros)
                .HasForeignKey(d => d.ComponenteId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK__Parametro__idcom__4DFF6746");

            builder.HasOne(d => d.Tipo)
                .WithMany(p => p.Parametros)
                .HasForeignKey(d => d.TipoId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK__Parametro__idtipo__4DFF6746");

            builder.HasOne(d => d.UsuarioUltimaAlteracao)
                .WithMany(p => p.ParametroUsuarioUltimaAlteracao)
                .HasForeignKey(d => d.IdUsuarioUltimaAlteracao);
        }
    }
}
