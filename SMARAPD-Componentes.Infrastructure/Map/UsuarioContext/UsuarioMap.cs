using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using SMARAPD_Componentes.Domain.UsuarioContext;

namespace SMARAPD_Componentes.Infrastructure.Map.UsuarioContext
{
    public class UsuarioMap : IEntityTypeConfiguration<Usuario>
    {
        public void Configure(EntityTypeBuilder<Usuario> builder)
        {
            builder.Property(e => e.Email)
                .IsUnicode(false);

            builder.Property(e => e.Login)
                .IsUnicode(false);

            builder.Property(e => e.Nome)
                .IsUnicode(false);

            builder.Property(e => e.ImageUrl)
                .IsUnicode(false);

            builder.Property(e => e.Senha)
                .IsUnicode(false);
        }
    }
}
