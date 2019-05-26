using System;
using System.Collections.Generic;
using System.Text;

namespace SMARAPD_Componentes.Common.Exceptions
{
    public class DomainException : Exception
    {
        public DomainException(string message) : base(message)
        {

        }
    }
}
