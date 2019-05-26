using System;

namespace SMARAPD_Componentes.Common.DTO.HistoricoContext
{
    public class HistoricoGetDTO
    {
        public int Id { get; set; }
        public int ComponenteId { get; set; }
        public string NomeComponente { get; set; }
        public string LoginUsuario { get; set; }
        public string Operacao { get; set; }
        public DateTime Data { get; set; }
        public string Log { get; set; }
        public string Tabela { get; set; }

        public string Resultado
        {
            get
            {
                if (Tabela.ToUpper() == "COMPONENTE")
                {
                    if (Operacao.ToUpper() == "INSERT")
                    {
                        return $"Tabela: { Tabela.ToUpper() } - O componente {NomeComponente.ToUpper()} foi criado";
                    }

                    if (Operacao.ToUpper() == "UPDATE")
                    {
                        return $"Tabela: { Tabela.ToUpper() } - O componente {NomeComponente.ToUpper()} foi alterado pelo usuário {LoginUsuario.ToUpper()} na data {Data.ToString("dd/MM/yyyy")}";
                    }

                    if (Operacao.ToUpper() == "DELETE")
                    {
                        return $"Tabela: { Tabela.ToUpper() } - O componente {NomeComponente.ToUpper()} foi deletado pelo usuário {LoginUsuario.ToUpper()} na data { Data.ToString("dd/MM/yyyy")}";
                    }
                }

                if (Tabela.ToUpper() == "EVENTO")
                {
                    if (Operacao.ToUpper() == "INSERT")
                    {
                        return $"Tabela: { Tabela.ToUpper() } - Foi adicionado um evento no componente {NomeComponente.ToUpper()} pelo usuário {LoginUsuario.ToUpper()} na data { Data.ToString("dd/MM/yyyy")}";
                    }

                    if (Operacao.ToUpper() == "UPDATE")
                    {
                        return $"Tabela: { Tabela.ToUpper() } - Foi alterado um evento no componente {NomeComponente.ToUpper()} pelo usuário {LoginUsuario.ToUpper()} na data { Data.ToString("dd/MM/yyyy")}";
                    }

                    if (Operacao.ToUpper() == "DELETE")
                    {
                        return $"Tabela: { Tabela.ToUpper() } - Foi deletado um evento no componente {NomeComponente.ToUpper()} pelo usuário {LoginUsuario.ToUpper()} na data { Data.ToString("dd/MM/yyyy")}";
                    }
                }

                if (Tabela.ToUpper() == "PARÂMETRO")
                {
                    if (Operacao.ToUpper() == "INSERT")
                    {
                        return $"Tabela: { Tabela.ToUpper() } - Foi adicionado um parâmetro no componente {NomeComponente.ToUpper()} pelo usuário {LoginUsuario.ToUpper()} na data { Data.ToString("dd/MM/yyyy")}";
                    }

                    if (Operacao.ToUpper() == "UPDATE")
                    {
                        return $"Tabela: { Tabela.ToUpper() } - Foi alterado um parâmetro no componente {NomeComponente.ToUpper()} pelo usuário {LoginUsuario.ToUpper()} na data { Data.ToString("dd/MM/yyyy")}";
                    }

                    if (Operacao.ToUpper() == "DELETE")
                    {
                        return $"Tabela: { Tabela.ToUpper() } - Foi deletado um parâmetro no componente {NomeComponente.ToUpper()} pelo usuário {LoginUsuario.ToUpper()} na data { Data.ToString("dd/MM/yyyy")}";
                    }
                }

                if (Tabela.ToUpper() == "MÉTODO")
                {
                    if (Operacao.ToUpper() == "INSERT")
                    {
                        return $"Tabela: { Tabela.ToUpper() } - Foi adicionado um método no componente {NomeComponente.ToUpper()} pelo usuário {LoginUsuario.ToUpper()} na data { Data.ToString("dd/MM/yyyy")}";
                    }

                    if (Operacao.ToUpper() == "UPDATE")
                    {
                        return $"Tabela: { Tabela.ToUpper() } - Foi alterado um método no componente {NomeComponente.ToUpper()} pelo usuário {LoginUsuario.ToUpper()} na data { Data.ToString("dd/MM/yyyy")}";
                    }

                    if (Operacao.ToUpper() == "DELETE")
                    {
                        return $"Tabela: { Tabela.ToUpper() } - Foi deletado um método no componente {NomeComponente.ToUpper()} pelo usuário {LoginUsuario.ToUpper()} na data { Data.ToString("dd/MM/yyyy")}";
                    }
                }

                if (Tabela.ToUpper() == "PARÂMETRO MÉTODO")
                {
                    if (Operacao.ToUpper() == "INSERT")
                    {
                        return $"Tabela: { Tabela.ToUpper() } - Foi criado um parâmetro no método do componente {NomeComponente.ToUpper()} pelo usuário {LoginUsuario.ToUpper()} na data { Data.ToString("dd/MM/yyyy")}";
                    }

                    if (Operacao.ToUpper() == "UPDATE")
                    {
                        return $"Tabela: { Tabela.ToUpper() } - Foi alterado um parâmetro no método do componente {NomeComponente.ToUpper()} pelo usuário {LoginUsuario.ToUpper()} na data { Data.ToString("dd/MM/yyyy")}";
                    }

                    if (Operacao.ToUpper() == "DELETE")
                    {
                        return $"Tabela: { Tabela.ToUpper() } - Foi deletado um parâmetro no método do componente {NomeComponente.ToUpper()} pelo usuário {LoginUsuario.ToUpper()} na data { Data.ToString("dd/MM/yyyy")}";
                    }

                    //if (Operacao.ToUpper() == "INSERT" || Operacao.ToUpper() == "UPDATE" || Operacao.ToUpper() == "DELETE")
                    //{
                    //    return $"Tabela: { Tabela.ToUpper() } - Foi alterado um método no componente {NomeComponente.ToUpper()} pelo usuário {LoginUsuario.ToUpper()} na data { Data.ToString("dd/MM/yyyy")}";
                    //}
                }

                if (Tabela.ToUpper() == "PARÂMETRO EVENTO")
                {
                    if (Operacao.ToUpper() == "INSERT")
                    {
                        return $"Tabela: { Tabela.ToUpper() } - Foi criado um parâmetro no evento do componente {NomeComponente.ToUpper()} pelo usuário {LoginUsuario.ToUpper()} na data { Data.ToString("dd/MM/yyyy")}";
                    }

                    if (Operacao.ToUpper() == "UPDATE")
                    {
                        return $"Tabela: { Tabela.ToUpper() } - Foi alterado um parâmetro no evento do componente {NomeComponente.ToUpper()} pelo usuário {LoginUsuario.ToUpper()} na data { Data.ToString("dd/MM/yyyy")}";
                    }

                    if (Operacao.ToUpper() == "DELETE")
                    {
                        return $"Tabela: { Tabela.ToUpper() } - Foi deletado um parâmetro no evento do componente {NomeComponente.ToUpper()} pelo usuário {LoginUsuario.ToUpper()} na data { Data.ToString("dd/MM/yyyy")}";
                    }
                }


                return string.Empty;
            }
        }
    }
}
