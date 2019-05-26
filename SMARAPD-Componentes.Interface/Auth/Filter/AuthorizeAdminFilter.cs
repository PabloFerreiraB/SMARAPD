
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Filters;
using SMARAPD_Componentes.Infrastructure.UnitOfWork.AuthContext;
using SMARAPD_Componentes.Interface.Auth.CustomAttribute;
using System;
using System.Linq;

namespace SMARAPD_Componentes.Interface.Auth.Filter
{
    public class AuthorizeAdminFilter : IActionFilter
    {
        private readonly AuthUnitOfWork _uow;

        public AuthorizeAdminFilter(AuthUnitOfWork uow)
        {
            _uow = uow;
        }

        public void OnActionExecuted(ActionExecutedContext context)
        {

        }

        public void OnActionExecuting(ActionExecutingContext context)
        {
            if (SkipAuthorization(context))
                return;

            Authorize(context);
        }

        private void Authorize(ActionExecutingContext context)
        {

            if (!context.HttpContext.User.Claims.Any(c => c.Type == "userName" && !string.IsNullOrEmpty(c.Value)))
            {
                context.Result = new ForbidResult();
                return;
            }

            if (!context.HttpContext.User.Claims.Any(c => c.Type == "isSuperUser" && !string.IsNullOrEmpty(c.Value)))
            {
                context.Result = new ForbidResult();
                return;
            }

            var user = context.HttpContext.User.Claims.First(c => c.Type == "userName").Value;

            var isSuperUser = Convert.ToBoolean(context.HttpContext.User.Claims.First(c => c.Type == "isSuperUser").Value);


            if (isSuperUser)
            {
                var condition = _uow.UsuarioRepository.ValideUser(user, isSuperUser: true);

                if (!condition)
                {
                    context.Result = new ForbidResult();
                    return;
                }
            }
            else
            {
                var condition = _uow.UsuarioRepository.ValideUser(user, isSuperUser: false);

                if (condition)
                {
                    if (!context.ActionDescriptor.FilterDescriptors.Any(x => x.Filter is AuthorizeVisitanteAttribute))
                    {
                        context.Result = new ForbidResult();
                    }
                }
                else
                {
                    context.Result = new ForbidResult();
                    return;
                }
            }
        }

        private bool SkipAuthorization(ActionExecutingContext context)
        {
            return context.ActionDescriptor.FilterDescriptors.Any(x => x.Filter is Microsoft.AspNetCore.Mvc.Authorization.AllowAnonymousFilter)
            || context.ActionDescriptor.FilterDescriptors.Any(x => x.Filter is Microsoft.AspNetCore.Authorization.AllowAnonymousAttribute);            
        }
    }
}
