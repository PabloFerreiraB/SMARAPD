
using Microsoft.AspNetCore.Http;
using SMARAPD_Componentes.Common.Exceptions;
using SMARAPD_Componentes.Common.Helper;
using SMARAPD_Componentes.Common.Resource;
using System.Collections.Generic;
using System.Linq;
using System.Web;


namespace SMARAPD_Componentes.Service.ApplicationService.Base
{
    public abstract class BaseApplicationService
    {

        protected void VerifyExists(object data, string name)
        {
            if (data == null)
                throw new DomainException(string.Format(CommonMessages.NotExists, name));
        }

        protected void VerifyExists(List<int> data, string name)
        {
            if (data == null || !data.Any())
                throw new DomainException(string.Format(CommonMessages.NotExists, name));
        }

        protected void VerifyExists(List<long> data, string name)
        {
            if (data == null || !data.Any())
                throw new DomainException(string.Format(CommonMessages.NotExists, name));
        }

        protected void VerifyExists(List<string> data, string name)
        {
            if (data == null || !data.Any())
                throw new DomainException(string.Format(CommonMessages.NotExists, name));
        }

        protected int IdUsuario
        {
            get { return RequestHeaderHelper.IdUsuario; }
        }

        protected bool IsSuperUser
        {
            get { return RequestHeaderHelper.IsSuperUser; }
        }

        protected string UserName
        {
            get { return RequestHeaderHelper.UserName; }
        }
    }
}
