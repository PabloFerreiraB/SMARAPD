(function () {
    'use strict';

    const app = angular.module('app');

    app.controller('usuarioEditPasswordController', function ($scope, $location, $routeParams, usuarioService, alertFactory, messagesFactory) {

        //$scope Variables BEGIN

        $scope.$parent.title = "Edição de Senha";
        $scope.voltarPagina = voltarPagina;
        $scope.editPassword = editPassword;

        $scope.senha = {
            NovaSenha: undefined
        };

        //$scope Variables END

        //$scope Functions BEGIN

        function voltarPagina() {
            $location.url("/administrativo/usuario");
        };

        function editPassword(senha) {
            $scope.$broadcast('show-errors-check-validity');
            if ($scope.FormularioEditarPassword.$valid && senha.NovaSenha == $scope.confirmacaoSenha) {
                usuarioService.
                    updatePassword($routeParams.id, senha)
                    .then(function () {
                        $location.url("/administrativo/usuario");
                        alertFactory.success(messagesFactory.Common.SENHA_ATUALIZADA_SUCESSO);
                    })
                    .catch(showError);
            }
        };

        //$scope Functions END
    });
}());