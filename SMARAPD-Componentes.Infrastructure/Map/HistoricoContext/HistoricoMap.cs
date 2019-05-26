using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using SMARAPD_Componentes.Domain.HistoricoContext;
using System;
using System.Collections.Generic;
using System.Text;

namespace SMARAPD_Componentes.Infrastructure.Map.HistoricoContext
{
    public class HistoricoMap : IEntityTypeConfiguration<Historico>
    {
        public void Configure(EntityTypeBuilder<Historico> builder)
        {
            builder.Property(e => e.Id);

            builder.Property(e => e.LoginUsuario)
                .IsUnicode(false);

            builder.Property(e => e.Operacao)
                .IsUnicode(false);

            builder.Property(e => e.Tabela)
                .IsUnicode(false);

            builder.Property(e => e.Data)
                .IsUnicode(false);

            builder.Property(e => e.Log)
                .IsUnicode(false);
        }
    }
}
