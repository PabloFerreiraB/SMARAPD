using System;
using System.Linq;

namespace SMARAPD_Componentes.Common.Helper
{
    public static class RequestHeaderHelper
    {
        public static int IdUsuario
        {
            get { return Convert.ToInt32(HttpContextAcessorHelper.ContextAcessor.HttpContext.User.Claims.First(c => c.Type == "userId").Value); }
        }

        public static bool IsSuperUser
        {
            get { return Convert.ToBoolean(HttpContextAcessorHelper.ContextAcessor.HttpContext.User.Claims.First(c => c.Type == "isSuperUser").Value); }
        }

        public static string UserName
        {
            get { return HttpContextAcessorHelper.ContextAcessor.HttpContext.User.Claims.First(c => c.Type == "userName").Value; }
        }
    }
}
