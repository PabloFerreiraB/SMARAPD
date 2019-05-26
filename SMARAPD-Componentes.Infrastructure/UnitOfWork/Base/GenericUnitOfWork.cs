using SMARAPD_Componentes.Infrastructure.Model;
using System;
using System.Collections.Generic;
using System.Text;

namespace SMARAPD_Componentes.Infrastructure.UnitOfWork.Base
{
    public abstract class GenericUnitOfWork
    {
        protected readonly IServiceProvider _serviceProvider;
        protected readonly ComponenteModel _context;

        public GenericUnitOfWork(ComponenteModel context, IServiceProvider serviceProvider)
        {
            _context = context;
            _serviceProvider = serviceProvider;
        }

        public void Commit()
        {            
            _context.SaveChanges();
        }
    }
}
