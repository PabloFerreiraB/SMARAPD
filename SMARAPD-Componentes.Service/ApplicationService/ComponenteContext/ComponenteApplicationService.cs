using Microsoft.EntityFrameworkCore;
using SMARAPD_Componentes.Common.DTO.CategoriaContext;
using SMARAPD_Componentes.Common.DTO.ComponenteContext;
using SMARAPD_Componentes.Common.DTO.UsuarioContext;
using SMARAPD_Componentes.Common.Exceptions;
using SMARAPD_Componentes.Common.Helper;
using SMARAPD_Componentes.Common.Resource;
using SMARAPD_Componentes.Domain.ComponenteContext;
using SMARAPD_Componentes.Infrastructure.UnitOfWork.ComponenteContext;
using SMARAPD_Componentes.Service.ApplicationService.Base;
using System;
using System.Collections.Generic;
using System.Linq;

namespace SMARAPD_Componentes.Service.ApplicationService.ComponenteContext
{
    public class ComponenteApplicationService : BaseApplicationService
    {
        private readonly ComponenteUnitOfWork _uow;
        private readonly string funcNome = "Componente";
        private readonly ImageUpload _imageUpload;
        public ComponenteApplicationService(ComponenteUnitOfWork uow, ImageUpload imageUpload)
        {
            _uow = uow;
            _imageUpload = imageUpload;
        }

        public List<ComponenteGetDTO> GetAll()
        {
            var dto = _uow.ComponenteRepository.GetAll().Select(x => new ComponenteGetDTO
            {
                Id = x.Id,
                Arquivo = x.Arquivo,
                Descricao = x.Descricao,
                Exemplo = x.Exemplo,
                DataUltimaAlteracao = x.DataUltimaAlteracao,
                IdUsuarioUltimaAlteracao = x.IdUsuarioUltimaAlteracao,
                UsuarioUltimaAlteracao = x.UsuarioUltimaAlteracao.Login,
                Categoria = new CategoriaGetDTO
                {
                    Id = x.Categoria.Id,
                    Nome = x.Categoria.Nome,
                    Icone = x.Categoria.Icone
                },
                Framework = new FrameworkGetDTO
                {
                    Id = x.Framework.Id,
                    Nome = x.Framework.Nome,
                    Icone = x.Framework.Icone
                },
                Usuario = new UsuarioComponenteGetDTO
                {
                    Id = x.Usuario.Id,
                    Login = x.Usuario.Login,
                    Nome = x.Usuario.Nome
                },
                Nome = x.Nome,
                Observacao = x.Observacao,
                Status = x.Status,
                Publicado = x.Publicado == true ? "Sim" : "Não",
                UrlImagem = x.Imageurl,
                DataCriacao = x.DataCriacao,
                Tags = x.ComponenteTags.Select(y => new TagGetDTO
                {
                    Id = y.Tag.Id,
                    Nome = y.Tag.Nome
                }).ToList(),
                Parametros = x.Parametros.Select(p => new ParametroGetDTO
                {
                    Id = p.Id,
                    ComponenteId = p.ComponenteId,
                    Descricao = p.Descricao,
                    Nome = p.Nome,
                    Obrigatorio = p.Obrigatorio,
                    Tipo = new TipoGetDTO
                    {
                        Id = p.Tipo.Id,
                        Nome = p.Tipo.Nome
                    }
                }).ToList(),
                Metodos = x.Metodos.Select(m => new MetodoGetDto
                {
                    Nome = m.Nome,
                    Descricao = m.Descricao,
                    Retorno = m.Tipo.Nome,
                    Exemplo = m.Exemplo,
                    ParametrosMetodo = m.ParametrosMetodo.Select(param => new ParametroMetodoGetDto
                    {
                        Nome = param.Nome,
                        Descricao = param.Descricao,
                        Obrigatorio = param.Obrigatorio,
                        Tipo = new TipoGetDTO
                        {
                            Id = param.Tipo.Id,
                            Nome = param.Tipo.Nome
                        }
                    }).ToList(),
                }).ToList(),
                Eventos = x.Eventos.Select(m => new EventoGetDto
                {
                    Nome = m.Nome,
                    Descricao = m.Descricao,
                    Exemplo = m.Exemplo,
                    ParametrosEvento = m.ParametrosEvento.Select(param => new ParametroEventoGetDto
                    {
                        Nome = param.Nome,
                        Descricao = param.Descricao,
                        Obrigatorio = param.Obrigatorio,
                        Tipo = new TipoGetDTO
                        {
                            Id = param.Tipo.Id,
                            Nome = param.Tipo.Nome
                        }
                    }).ToList()
                }).ToList(),
                Dependencias = x.ComponenteDependencias.Select(p => new DependenciaGetDTO
                {
                    Id = p.Dependencia.Id,
                    Nome = p.Dependencia.Nome,
                    Versao = p.Dependencia.Versao,
                    Status = p.Dependencia.Status,
                    Url = p.Dependencia.Url
                }).ToList(),                

            })
            .ToList();

            return dto;
        }

        public List<ComponenteGridGetDTO> GetAllGrid()
        {
            var dto = _uow.ComponenteRepository.GetAll().Select(x => new ComponenteGridGetDTO
            {
                Id = x.Id,
                Autor = x.Usuario.Nome,
                FrameworkIcone = x.Framework.Icone,
                Nome = x.Nome,
                Publicado = x.Publicado == true ? "Sim" : "Não",
                Status = x.Status
            }).ToList();

            return dto;
        }

        public ComponenteByIdGetDTO GetById(int id)
        {
            var query = _uow.ComponenteRepository.GetById(id);

            var dto = query.Select(x => new ComponenteByIdGetDTO
            {
                Id = x.Id,
                Nome = x.Nome,
                Arquivo = x.Arquivo,
                Descricao = x.Descricao,
                Exemplo = x.Exemplo,
                IdCategoria = x.CategoriaId,
                IdFramework = x.FrameworkId,
                IdUsuario = x.UsuarioId,
                Observacao = x.Observacao,
                Imagem = x.Imageurl,
                DataUltimaAlteracao = x.DataUltimaAlteracao,
                IdUsuarioUltimaAlteracao = x.IdUsuarioUltimaAlteracao,
                UsuarioUltimaAlteracao = x.UsuarioUltimaAlteracao.Login,
                Parametros = x.Parametros.Select(p => new ParametroGetDTO
                {
                    Id = p.Id,
                    ComponenteId = p.ComponenteId,
                    Descricao = p.Descricao,
                    Nome = p.Nome,
                    Obrigatorio = p.Obrigatorio,
                    Tipo = new TipoGetDTO
                    {
                        Id = p.Tipo.Id,
                        Nome = p.Tipo.Nome
                    }
                }).ToList(),
                Metodos = x.Metodos.Select(m => new MetodoGetDto
                {
                    Nome = m.Nome,
                    Descricao = m.Descricao,
                    Retorno = m.Tipo.Nome,
                    Exemplo = m.Exemplo,
                    ParametrosMetodo = m.ParametrosMetodo.Select(param => new ParametroMetodoGetDto
                    {
                        Id = param.Id,
                        MetodoId = m.Id,
                        Nome = param.Nome,
                        Descricao = param.Descricao,
                        Obrigatorio = param.Obrigatorio,
                        Tipo = new TipoGetDTO
                        {
                            Id = param.Tipo.Id,
                            Nome = param.Tipo.Nome
                        }
                    }).ToList()
                }).ToList(),
                Eventos = x.Eventos.Select(m => new EventoGetDto
                {
                    Nome = m.Nome,
                    Descricao = m.Descricao,
                    Exemplo = m.Exemplo,
                    ParametrosEvento = m.ParametrosEvento.Select(param => new ParametroEventoGetDto
                    {
                        Id = param.Id,
                        EventoId = m.Id,
                        Nome = param.Nome,
                        Descricao = param.Descricao,
                        Obrigatorio = param.Obrigatorio,
                        Tipo = new TipoGetDTO
                        {
                            Id = param.Tipo.Id,
                            Nome = param.Tipo.Nome
                        }
                    }).ToList()
                }).ToList(),
                Status = x.Status,
                Publicado = x.Publicado,
                DataCriacao = x.DataCriacao,
                Tags = x.ComponenteTags.Select(y => new TagGetDTO
                {
                    Id = y.Tag.Id,
                    Nome = y.Tag.Nome
                }).ToList(),
                Dependencias = x.ComponenteDependencias.Select(p => new DependenciaGetDTO
                {
                    Id = p.Dependencia.Id,
                    Nome = p.Dependencia.Nome,
                    Versao = p.Dependencia.Versao,
                    Status = p.Dependencia.Status,
                    Url = p.Dependencia.Url
                }).ToList()
            })
            .FirstOrDefault();

            VerifyExists(dto, funcNome);

            return dto;
        }

        public ComponenteGetDTO GetByIdView(int id)
        {
            var query = _uow.ComponenteRepository.GetById(id);
            var dto = query.Select(x => new ComponenteGetDTO
            {
                Id = x.Id,
                Nome = x.Nome,
                Arquivo = x.Arquivo,
                Descricao = x.Descricao,
                Exemplo = x.Exemplo,
                DataUltimaAlteracao = x.DataUltimaAlteracao,
                IdUsuarioUltimaAlteracao = x.IdUsuarioUltimaAlteracao,
                UsuarioUltimaAlteracao = x.UsuarioUltimaAlteracao.Login,
                Categoria = new CategoriaGetDTO
                {
                    Id = x.Categoria.Id,
                    Nome = x.Categoria.Nome,
                    Icone = x.Categoria.Icone
                },
                UrlImagem = x.Imageurl,
                Framework = new FrameworkGetDTO
                {
                    Id = x.Framework.Id,
                    Nome = x.Framework.Nome,
                    Icone = x.Framework.Icone
                },
                Usuario = new UsuarioComponenteGetDTO
                {
                    Id = x.Usuario.Id,
                    Nome = x.Usuario.Nome,
                    Login = x.Usuario.Login
                },
                Observacao = x.Observacao,
                Parametros = x.Parametros.Select(p => new ParametroGetDTO
                {
                    Id = p.Id,
                    ComponenteId = p.ComponenteId,
                    Descricao = p.Descricao,
                    Nome = p.Nome,
                    Obrigatorio = p.Obrigatorio,
                    Tipo = new TipoGetDTO
                    {
                        Id = p.Tipo.Id,
                        Nome = p.Tipo.Nome
                    }
                }).ToList(),
                Metodos = x.Metodos.Select(m => new MetodoGetDto
                {
                    Nome = m.Nome,
                    Descricao = m.Descricao,
                    Retorno = m.Tipo.Nome,
                    Exemplo = m.Exemplo,
                    ParametrosMetodo = m.ParametrosMetodo.Select(param => new ParametroMetodoGetDto
                    {
                        Nome = param.Nome,
                        Descricao = param.Descricao,
                        Obrigatorio = param.Obrigatorio,
                        Tipo = new TipoGetDTO
                        {
                            Id = param.Tipo.Id,
                            Nome = param.Tipo.Nome
                        }
                    }).ToList()
                }).ToList(),
                Eventos = x.Eventos.Select(m => new EventoGetDto
                {
                    Nome = m.Nome,
                    Descricao = m.Descricao,
                    Exemplo = m.Exemplo,
                    ParametrosEvento = m.ParametrosEvento.Select(param => new ParametroEventoGetDto
                    {
                        Nome = param.Nome,
                        Descricao = param.Descricao,
                        Obrigatorio = param.Obrigatorio,
                        Tipo = new TipoGetDTO
                        {
                            Id = param.Tipo.Id,
                            Nome = param.Tipo.Nome
                        }
                    }).ToList()
                }).ToList(),
                Status = x.Status,
                Publicado = x.Publicado == true ? "Sim" : "Não",
                DataCriacao = x.DataCriacao,
                Tags = x.ComponenteTags.Select(y => new TagGetDTO
                {
                    Id = y.Tag.Id,
                    Nome = y.Tag.Nome
                }).ToList(),
                Dependencias = x.ComponenteDependencias.Select(p => new DependenciaGetDTO
                {
                    Id = p.Dependencia.Id,
                    Nome = p.Dependencia.Nome,
                    Versao = p.Dependencia.Versao,
                    Status = p.Dependencia.Status,
                    Url = p.Dependencia.Url
                }).ToList()
            })
            .FirstOrDefault();

            VerifyExists(query, funcNome);

            return dto;
        }

        public List<ComponenteResultDTO> Search(PesquisaDTO dto)
        {
            var result = new List<ComponenteResultDTO>();

            var queryComponente = _uow.ComponenteRepository
                                     .GetAll()
                                     .Where(x => x.Publicado);

            #region Busca Padrao

            if (dto.BuscaPadrao)
            {

                if (!string.IsNullOrEmpty(dto.Pesquisa))
                {
                    queryComponente = queryComponente.Where(x => (x.Nome.Contains(dto.Pesquisa) || x.Descricao.Contains(dto.Pesquisa)));
                }

                if (!string.IsNullOrEmpty(dto.Parametro))
                {
                    queryComponente = queryComponente.Where(x => x.Parametros.Any(y => y.Nome.Contains(dto.Parametro)));
                }

                if (!string.IsNullOrEmpty(dto.Metodo))
                {
                    queryComponente = queryComponente.Where(x => x.Metodos.Any(y => y.Nome.Contains(dto.Metodo)));
                }

                if (!string.IsNullOrEmpty(dto.Evento))
                {
                    queryComponente = queryComponente.Where(x => x.Eventos.Any(y => y.Nome.Contains(dto.Evento)));
                }

                if (dto.Tags != null && dto.Tags.Count > 0)
                {
                    var idsTagsSearch = dto.Tags.Select(x => x.Id).ToList();
                    queryComponente = queryComponente.Where(x => x.ComponenteTags.Any(z => idsTagsSearch.Contains(z.TagId)));
                }

            }

            #endregion

            #region Busca Por Categoria

            if (dto.BuscaPorCategoria)
            {
                queryComponente = queryComponente.Where(x => x.CategoriaId == dto.IdCategoria);
            }

            #endregion

            result = queryComponente.Select(x => new ComponenteResultDTO
            {
                Id = x.Id,
                Nome = x.Nome,
                Descricao = x.Descricao,
                Usuario = x.Usuario.Nome,
                Categoria = x.Categoria.Nome,
                Framework = x.Framework.Icone,
                Tags = x.ComponenteTags.Select(y => new TagGetDTO
                {
                    Id = y.Tag.Id,
                    Nome = y.Tag.Nome
                }).ToList(),
                Dependencias = x.ComponenteDependencias.Select(y => new DependenciaGetDTO
                {
                    Id = y.Dependencia.Id,
                    Nome = y.Dependencia.Nome,
                    Versao = y.Dependencia.Versao,
                    Status = y.Dependencia.Status,
                    Url = y.Dependencia.Url
                }).ToList(),

                DataCriacao = x.DataCriacao,
                HasParametros = x.Parametros.Any(),
                HasEventos = x.Eventos.Any(),
                HasMetodos = x.Metodos.Any()
            }).ToList();

            return result;
        }

        public void Save(ComponentePostDTO dto)
        {
            var componente = new Componente
            {
                Nome = dto.Nome,
                Status = dto.Status,
                Descricao = dto.Descricao,
                UsuarioId = IdUsuario,
                CategoriaId = dto.IdCategoria,
                FrameworkId = dto.IdFramework,
                Arquivo = dto.Arquivo,
                DataCriacao = DateTime.Now,
                DataUltimaAlteracao = DateTime.Now,
                IdUsuarioUltimaAlteracao = IdUsuario,
                Exemplo = dto.Exemplo,
                Observacao = dto.Observacao,
                Parametros = dto.Parametros.Select(p => new Parametro
                {
                    Nome = p.Nome,
                    Descricao = p.Descricao,
                    Obrigatorio = p.Obrigatorio,
                    TipoId = p.TipoId,
                    DataUltimaAlteracao = DateTime.Now,
                    IdUsuarioUltimaAlteracao = IdUsuario
                }).ToList(),
                Metodos = dto.Metodos.Select(m => new Metodo
                {
                    Nome = m.Nome,
                    Descricao = m.Descricao,
                    IdTipoRetorno = m.IdTipoRetorno,
                    Exemplo = m.Exemplo,
                    DataUltimaAlteracao = DateTime.Now,
                    IdUsuarioUltimaAlteracao = IdUsuario,
                    ParametrosMetodo = m.ParametrosMetodo.Select(param => new ParametroMetodo
                    {
                        Nome = param.Nome,
                        Descricao = param.Descricao,
                        Obrigatorio = param.Obrigatorio,
                        TipoId = param.TipoId,
                        DataUltimaAlteracao = DateTime.Now,
                        IdUsuarioUltimaAlteracao = IdUsuario
                    }).ToList()
                }).ToList(),
                Eventos = dto.Eventos.Select(m => new Evento
                {
                    Nome = m.Nome,
                    Descricao = m.Descricao,
                    Exemplo = m.Exemplo,
                    DataUltimaAlteracao = DateTime.Now,
                    IdUsuarioUltimaAlteracao = IdUsuario,
                    ParametrosEvento = m.ParametrosEvento.Select(param => new ParametroEvento
                    {
                        Nome = param.Nome,
                        Descricao = param.Descricao,
                        Obrigatorio = param.Obrigatorio,
                        TipoId = param.TipoId,
                        DataUltimaAlteracao = DateTime.Now,
                        IdUsuarioUltimaAlteracao = IdUsuario
                    }).ToList()
                }).ToList(),
                Publicado = dto.Publicado
            };

            if (!string.IsNullOrWhiteSpace(dto.Imagem) && !dto.Imagem.StartsWith("http"))
            {
                if (!string.IsNullOrWhiteSpace(componente.Imageurl))
                    _imageUpload.DeleteImage(componente.Imageurl);
                var imageUrl = _imageUpload.SaveImage(dto.Imagem);
                componente.Imageurl = imageUrl;
            }

            if (dto.Tags != null && dto.Tags.Count > 0)
            {
                var tagsToAdd = dto.Tags.Where(x => x.Id == 0).ToList();

                if (tagsToAdd.Count > 0)
                {
                    _uow.ComponenteTagRepository.AddRange(tagsToAdd.Select(x => new ComponenteTag
                    {
                        Componente = componente,
                        Tag = new Tag { Nome = x.Nome }
                    })
                    .ToList());
                }

                var tagsToRelate = dto.Tags.Where(x => x.Id > 0).ToList();

                if (tagsToRelate.Count > 0)
                {
                    _uow.ComponenteTagRepository.AddRange(tagsToRelate.Select(x => new ComponenteTag { TagId = x.Id, Componente = componente }).ToList());
                }
            }


            #region ===== Dependência =====

            var dependenciasToRelate = dto.Dependencias.Where(x => x.Id > 0).ToList();

            if (dependenciasToRelate.Count > 0)
            {
                _uow.ComponenteDependenciaRepository.AddRange(dependenciasToRelate.Select(p => new ComponenteDependencia
                {
                    DependenciaId = p.Id,
                    Componente = componente,
                    DataUltimaAlteracao = DateTime.Now,
                    IdUsuarioUltimaAlteracao = IdUsuario

                }).ToList());
            }

            #endregion


            Validate(componente);
            _uow.ComponenteRepository.Add(componente);
            _uow.Commit();
        }

        public void Update(ComponentePutDTO dto, int id)
        {
            var query = _uow.ComponenteRepository.GetById(id).Include(x => x.ComponenteTags).Include(x => x.ComponenteDependencias);
            var componente = query.FirstOrDefault();
            if (dto.ImagemPut != null)
            {
                var imageUrl = _imageUpload.SaveImage(dto.ImagemPut);
                componente.Imageurl = imageUrl;
            }
            componente.Nome = dto.Nome;
            componente.Arquivo = dto.Arquivo;
            componente.Descricao = dto.Descricao;
            componente.Exemplo = dto.Exemplo;
            componente.Observacao = dto.Observacao;
            componente.Publicado = dto.Publicado;
            componente.CategoriaId = dto.IdCategoria;
            componente.FrameworkId = dto.IdFramework;
            componente.Status = dto.Status;
            componente.IdUsuarioUltimaAlteracao = IdUsuario;
            componente.DataUltimaAlteracao = DateTime.Now;


            var tagsToDelete = componente.ComponenteTags.Where(x => !dto.Tags.Select(y => y.Id).Contains(x.TagId)).ToList();

            if (tagsToDelete.Count > 0)
            {
                _uow.ComponenteTagRepository.MassDelete(tagsToDelete);
            }

            var tagsToRelate = dto.Tags.Where(x => x.Id > 0 && !componente.ComponenteTags.Select(y => y.TagId).Contains(x.Id)).ToList();

            if (tagsToRelate.Count > 0)
            {
                _uow.ComponenteTagRepository.AddRange(tagsToRelate.Select(x => new ComponenteTag { TagId = x.Id, Componente = componente }).ToList());
            }

            var tagsToAdd = dto.Tags.Where(x => x.Id == 0).ToList();

            if (tagsToAdd.Count > 0)
            {
                _uow.ComponenteTagRepository.AddRange(tagsToAdd.Select(x => new ComponenteTag
                {
                    Componente = componente,
                    Tag = new Tag { Nome = x.Nome }
                })
                .ToList());
            }


            Validate(componente);
            _uow.Commit();
        }

        public void Delete(int id)
        {
            var query = _uow.ComponenteRepository.GetById(id).FirstOrDefault();
            _uow.ComponenteRepository.Delete(query);
            _uow.Commit();
        }

        public List<ComponenteCategoriaGetDTO> GetAllByCategoria()
        {
            var dto = _uow.CategoriaRepository.GetAll().Select(x => new ComponenteCategoriaGetDTO
            {
                Nome = x.Nome,
                Id = x.Id,
                Icone = x.Icone,
                Componentes = x.Componentes.Select(y => new ComponenteMenuGetDTO
                {
                    Id = y.Id,
                    Nome = y.Nome,
                    Publicado = y.Publicado
                }).ToList()
            }).ToList();

            VerifyExists(dto, funcNome);
            return dto;
        }

        public List<ComponenteCategoriaGetDTO> GetComponenteMenu()
        {
            var dto = _uow.CategoriaRepository.GetAll().Where(x => x.Componentes.Any(c => c.Publicado)).Select(x => new ComponenteCategoriaGetDTO
            {
                Nome = x.Nome,
                Id = x.Id,
                Icone = x.Icone,
                Componentes = x.Componentes.Where(y => y.Publicado == true).Select(y => new ComponenteMenuGetDTO
                {
                    Id = y.Id,
                    Nome = y.Nome,
                }).ToList()
            }).ToList();

            VerifyExists(dto, funcNome);
            return dto;
        }


        private void Validate(Componente componente)
        {
            if (componente == null)
                throw new DomainException(string.Format(CommonMessages.Required, "Componente"));

            if (string.IsNullOrWhiteSpace(componente.Arquivo))
                throw new DomainException(string.Format(CommonMessages.Required, "Arquivo"));

            if (componente.CategoriaId == 0)
                throw new DomainException(string.Format(CommonMessages.Required, "Categoria"));

            if (string.IsNullOrWhiteSpace(componente.Descricao))
                throw new DomainException(string.Format(CommonMessages.Required, "Descrição"));

            if (componente.FrameworkId == 0)
                throw new DomainException(string.Format(CommonMessages.Required, "Framework"));

            if (string.IsNullOrWhiteSpace(componente.Nome))
                throw new DomainException(string.Format(CommonMessages.Required, "Nome"));

            if (componente.Status == null && (componente.Status != "Depreciado" || componente.Status != "Ativo" || componente.Status != "Desativado"))
                throw new DomainException(string.Format(CommonMessages.Required, "Status"));

            if (componente.UsuarioId == 0)
                throw new DomainException(string.Format(CommonMessages.Required, "Usuário"));
        }


    }
}
