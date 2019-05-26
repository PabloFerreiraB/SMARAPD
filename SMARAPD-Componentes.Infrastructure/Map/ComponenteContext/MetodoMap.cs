using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using SMARAPD_Componentes.Domain.ComponenteContext;

namespace SMARAPD_Componentes.Infrastructure.Map.ComponenteContext
{
    public class MetodoMap : IEntityTypeConfiguration<Metodo>
    {
        public void Configure(EntityTypeBuilder<Metodo> builder)
        {
            builder.Property(e => e.Descricao)
                .IsUnicode(false);

            builder.Property(e => e.Nome)
                .IsUnicode(false);

            builder.Property(e => e.IdTipoRetorno)
                .IsUnicode(false);

            builder.HasOne(d => d.Componente)
                .WithMany(p => p.Metodos)
                .HasForeignKey(d => d.ComponenteId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK__Metodo__idcompon__4D0B430D");

            builder.HasOne(d => d.UsuarioUltimaAlteracao)
             .WithMany(p => p.MetodoUsuarioUltimaAlteracao)
             .HasForeignKey(d => d.IdUsuarioUltimaAlteracao);
        }
    }
}
