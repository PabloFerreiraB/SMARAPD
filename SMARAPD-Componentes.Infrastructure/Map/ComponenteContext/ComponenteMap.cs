using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using SMARAPD_Componentes.Domain.ComponenteContext;

namespace SMARAPD_Componentes.Infrastructure.Map.ComponenteContext
{
    public class ComponenteMap : IEntityTypeConfiguration<Componente>
    {
        public void Configure(EntityTypeBuilder<Componente> builder)
        {
            builder.Property(e => e.Id);

            builder.Property(e => e.Arquivo)
                .IsUnicode(false);

            builder.Property(e => e.Descricao)
                .IsUnicode(false);

            builder.Property(e => e.Exemplo);

            builder.Property(e => e.CategoriaId);

            builder.Property(e => e.FrameworkId);

            builder.Property(e => e.UsuarioId);

            builder.Property(e => e.Imageurl)
                .IsUnicode(false);

            builder.Property(e => e.Nome)
                .IsUnicode(false);

            builder.Property(e => e.Observacao);

            builder.Property(e => e.Publicado);

            builder.Property(e => e.Status)
                .IsUnicode(false);

            builder.Property(b => b.DataCriacao)
                .HasDefaultValueSql("getdate()");

            builder.HasOne(d => d.Categoria)
                .WithMany(p => p.Componentes)
                .HasForeignKey(d => d.CategoriaId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK__Component__idcat__014A0122");

            builder.HasOne(d => d.Framework)
                .WithMany(p => p.Componentes)
                .HasForeignKey(d => d.FrameworkId)
                .OnDelete(DeleteBehavior.Cascade)
                .HasConstraintName("FK__Component__idfra__4A2ED662");

            builder.HasOne(d => d.Usuario)
                .WithMany(p => p.Componentes)
                .HasForeignKey(d => d.UsuarioId)
                .OnDelete(DeleteBehavior.Cascade)
                .HasConstraintName("FK__Component__idusu__48468DF0");

            builder.HasOne(d => d.UsuarioUltimaAlteracao)
               .WithMany(p => p.ComponentesUsuarioUltimaAlteracao)
               .HasForeignKey(d => d.IdUsuarioUltimaAlteracao);          
        }
    }
}
