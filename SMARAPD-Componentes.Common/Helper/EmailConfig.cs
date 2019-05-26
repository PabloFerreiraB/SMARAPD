using System;
using System.Collections.Generic;
using System.Text;

namespace SMARAPD_Componentes.Common.Helper
{
    public class EmailConfig
    {
        public string Host { get; set; }

        public string DisplayName { get; set; }

        public string Email { get; set; }

        public string Password { get; set; }

        public bool UseSSL { get; set; }

        public int Port { get; set; }
    }
}
