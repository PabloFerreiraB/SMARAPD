using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using SMARAPD_Componentes.Domain.ComponenteContext;

namespace SMARAPD_Componentes.Infrastructure.Map.ComponenteContext
{
    public class ParametroMetodoMap : IEntityTypeConfiguration<ParametroMetodo>
    {
        public void Configure(EntityTypeBuilder<ParametroMetodo> builder)
        {
            builder.Property(e => e.Descricao)
                .IsUnicode(false);          

            builder.Property(e => e.Nome)
                .IsUnicode(false);

            builder.HasOne(d => d.Metodo)
                .WithMany(p => p.ParametrosMetodo)
                .HasForeignKey(d => d.MetodoId)
                .OnDelete(DeleteBehavior.Cascade)
                .HasConstraintName("FK__Parametro__idmet__4EF38B7F");

            builder.HasOne(d => d.Tipo)
                .WithMany(p => p.ParametrosMetodo)
                .HasForeignKey(d => d.TipoId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK__ParametroMetodo__idtipo__4DFF6746");

            builder.HasOne(d => d.UsuarioUltimaAlteracao)
             .WithMany(p => p.ParametroMetodoUsuarioUltimaAlteracao)
             .HasForeignKey(d => d.IdUsuarioUltimaAlteracao);
        }
    }
}
