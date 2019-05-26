using Microsoft.EntityFrameworkCore;
using SMARAPD_Componentes.Domain.ComponenteContext;
using SMARAPD_Componentes.Domain.CategoriaContext;
using SMARAPD_Componentes.Domain.UsuarioContext;
using SMARAPD_Componentes.Domain.HistoricoContext;

namespace SMARAPD_Componentes.Infrastructure.Model
{
    public class ComponenteModel : DbContext
    {

        public ComponenteModel(DbContextOptions<ComponenteModel> options)
            : base(options)
        {
        }

        public virtual DbSet<Categoria> Categorias { get; set; }

        public virtual DbSet<Componente> Componentes { get; set; }

        public virtual DbSet<ComponenteTag> ComponenteTags { get; set; }

        public virtual DbSet<Evento> Eventos { get; set; }

        public virtual DbSet<Framework> Frameworks { get; set; }

        public virtual DbSet<Metodo> Metodos { get; set; }

        public virtual DbSet<Parametro> Parametros { get; set; }

        public virtual DbSet<ParametroEvento> ParametrosEvento { get; set; }

        public virtual DbSet<ParametroMetodo> ParametrosMetodo { get; set; }

        public virtual DbSet<Tag> Tags { get; set; }

        public virtual DbSet<Tipo> Tipos { get; set; }

        public virtual DbSet<Usuario> Usuarios { get; set; }

        public virtual DbSet<Dependencia> Dependencias { get; set; }

        public virtual DbSet<ComponenteDependencia> ComponenteDependencias { get; set; }

        public virtual DbSet<Historico> Historico { get; set; } 

        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            base.OnConfiguring(optionsBuilder);
        }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.ApplyConfigurationsFromAssembly(GetType().Assembly);
        }
    }
}
