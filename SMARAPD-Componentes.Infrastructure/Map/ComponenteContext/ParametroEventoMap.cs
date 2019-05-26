using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using SMARAPD_Componentes.Domain.ComponenteContext;

namespace SMARAPD_Componentes.Infrastructure.Map.ComponenteContext
{
    public class ParametroEventoMap : IEntityTypeConfiguration<ParametroEvento>
    {
        public void Configure(EntityTypeBuilder<ParametroEvento> builder)
        {
            builder.Property(e => e.Descricao)
                .IsUnicode(false);

            builder.Property(e => e.Nome)
                .IsUnicode(false);

            builder.HasOne(d => d.Evento)
                .WithMany(p => p.ParametrosEvento)
                .HasForeignKey(d => d.EventoId)
                .OnDelete(DeleteBehavior.Cascade)
                .HasConstraintName("FK__Parametro__ideve__4FE7AFB8");

            builder.HasOne(d => d.Tipo)
                .WithMany(p => p.ParametrosEvento)
                .HasForeignKey(d => d.TipoId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK__ParametroEvento__idtipo__4DFF6746");

            builder.HasOne(d => d.UsuarioUltimaAlteracao)
            .WithMany(p => p.ParametroEventoUsuarioUltimaAlteracao)
            .HasForeignKey(d => d.IdUsuarioUltimaAlteracao);
        }
    }
}
