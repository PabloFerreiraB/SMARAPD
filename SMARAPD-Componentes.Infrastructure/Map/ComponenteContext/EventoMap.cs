using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using SMARAPD_Componentes.Domain.ComponenteContext;

namespace SMARAPD_Componentes.Infrastructure.Map.ComponenteContext
{
    public class EventoMap : IEntityTypeConfiguration<Evento>
    {
        public void Configure(EntityTypeBuilder<Evento> builder)
        {
            builder.Property(e => e.Id);

            builder.Property(e => e.Descricao)
                .IsUnicode(false);

            builder.Property(e => e.Exemplo);

            builder.Property(e => e.ComponenteId);

            builder.Property(e => e.Nome)
                .IsUnicode(false);

            builder.HasOne(d => d.Componente)
                .WithMany(p => p.Eventos)
                .HasForeignKey(d => d.ComponenteId)
                .OnDelete(DeleteBehavior.Cascade)
                .HasConstraintName("FK__Evento__idcompon__4D0B430D");

            builder.HasOne(d => d.UsuarioUltimaAlteracao)
           .WithMany(p => p.EventoUsuarioUltimaAlteracao)
           .HasForeignKey(d => d.IdUsuarioUltimaAlteracao);
        }
    }
}
