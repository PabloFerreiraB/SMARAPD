using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Filters;
using SMARAPD_Componentes.Interface.Auth.Filter;

namespace SMARAPD_Componentes.Interface.Auth.CustomAttribute
{
    /// <summary>
    /// Colocar nos serviços que o usuário tipo visitante pode acessar
    /// </summary>
    public class AuthorizeVisitanteAttribute : ActionFilterAttribute
    {
        public AuthorizeVisitanteAttribute()
        {
            
        }
    }
}
