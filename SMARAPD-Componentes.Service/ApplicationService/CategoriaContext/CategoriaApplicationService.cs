using Microsoft.EntityFrameworkCore;
using SMARAPD_Componentes.Common.DTO.CategoriaContext;
using SMARAPD_Componentes.Common.Exceptions;
using SMARAPD_Componentes.Common.Resource;
using SMARAPD_Componentes.Domain.CategoriaContext;
using SMARAPD_Componentes.Infrastructure.UnitOfWork.CategoriaContext;
using SMARAPD_Componentes.Service.ApplicationService.Base;
using System.Collections.Generic;
using System.Linq;

namespace SMARAPD_Componentes.Service.ApplicationService.CategoriaContext
{
    public class CategoriaApplicationService : BaseApplicationService
    {
        private readonly CategoriaUnityOfWork _uow;

        private readonly string funcNome = "Categoria";

        public CategoriaApplicationService(CategoriaUnityOfWork uow)
        {
            _uow = uow;
        }

        public List<CategoriaGetDTO> GetAll()
        {         

            var query = _uow.CategoriaRepository.GetAll().Select(x => new CategoriaGetDTO
            {
                Id = x.Id,
                Nome = x.Nome,
                Icone = x.Icone,
            }).ToList();

            return query;
        }

        public List<CategoriaGetDTO> GetAllHasComponente()
        {
            var query = _uow.CategoriaRepository.GetAll()
                .Where(x => x.Componentes.Any(y => y.Publicado))
                .Select(x => new CategoriaGetDTO
                {
                    Id = x.Id,
                    Nome = x.Nome,
                    Icone = x.Icone
                }).ToList();

            VerifyExists(query, funcNome);
            return query;
        }

        public CategoriaGetDTO GetById(int id)
        {
            var queryCategoria = _uow.CategoriaRepository.GetById(id);

            var dto = queryCategoria.Select(x => new CategoriaGetDTO
            {
                Id = x.Id,
                Nome = x.Nome,
                Icone = x.Icone
            }).ToList().FirstOrDefault();

            VerifyExists(dto, funcNome);

            return dto;
        }

        public void Save(CategoriaPostDTO dto)
        {
            VerifyExists(dto, CommonMessages.InformacoesEntrada);

            var categoria = new Categoria
            {
                Nome = dto.Nome,
                Icone = dto.Icone
            };

            Validate(categoria);

            _uow.CategoriaRepository.Add(categoria);
            _uow.Commit();
        }

        public void Update(int id, CategoriaPutDTO dto)
        {
            VerifyExists(dto, CommonMessages.InformacoesEntrada);
            var categoria = _uow.CategoriaRepository.GetById(id).FirstOrDefault();

            VerifyExists(categoria, funcNome);

            categoria.Nome = dto.Nome;
            categoria.Icone = dto.Icone;

            Validate(categoria);

            _uow.Commit();
        }

        public void Delete(int id)
        {
            var query = _uow.CategoriaRepository.GetById(id).Include(c => c.Componentes).FirstOrDefault();
            VerifyExists(query, funcNome);

            if (query.Componentes.Any())
                throw new DomainException("Não é possível remover um categoria que ainda possua componentes.");

            _uow.CategoriaRepository.Delete(query);
            _uow.Commit();
        }

        public void Validate(Categoria categoria)
        {
            if (string.IsNullOrWhiteSpace(categoria.Nome))
                throw new DomainException(string.Format(CommonMessages.Required, "Nome"));

            if (string.IsNullOrWhiteSpace(categoria.Icone))
                throw new DomainException(string.Format(CommonMessages.Required, "Ícone"));
        }
    }
}
