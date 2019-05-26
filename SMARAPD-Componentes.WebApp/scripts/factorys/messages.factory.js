(function () {
    angular.module('app').factory('messagesFactory', messagesFactory);

    function messagesFactory() {
        var _common = {
            ATUALIZADO_SUCESSO: 'Registro alterado com sucesso.',
            CADASTRADO_SUCESSO: 'Registro incluído com sucesso.',
            EXCLUIDO_SUCESSO: 'Registro removido com sucesso.',

            SENHA_ATUALIZADA_SUCESSO: 'Senha alterada com sucesso.',
            SENHA_ATUALIZADA_ERRO: 'Erro ao alterar senha.',

            SELECIONAR_REGISTRO: 'É necessário selecionar ao menos um registro para executar esta ação.',
            DESATIVADO_SUCESSO: 'Registro desativado com sucesso.',
            ATIVADO_SUCESSO: 'Registro ativado com sucesso.',
            CONFIRMA_DELETE: "Deseja realmente remover o registro?",
            CONFIRMA_OPERACAO: "Deseja realmente realizar esta operação?",

            CONFIRMA_AUTORIZACAO: "Deseja realmente autorizar este registro?",
            CONFIRMA_AUTORIZACAO_GERAL: "Deseja realmente autorizar todos os registros da grid?",
            ATIVADO_SUCESSO_GERAL: "Registros foram autorizados com sucesso.",

            ATIVADO_SUCESSO: 'Registro autorizado com sucesso.',
            DESATIVADO_SUCESSO: 'Registro desativado com sucesso.',

            ERRO_CADASTRO: 'Não foi possivel cadastrar este registro.',
            ERRO_ATUALIZAR: 'Não foi possível atualizar este registro.',
            ERRO_EXCLUSAO: 'Não foi possível deletar este registro.',

            NAO_ENCONTRADO: 'Nenhum registro encontrado.'
        };

        return {
            Common: _common
        };
    }
})();