(function () {
    'use strict';

    const app = angular.module('app');

    app.controller('usuarioExternoNewController', function ($scope, $location, $route, usuarioService, messagesFactory, alertFactory) {

        //$scope Variables BEGIN
        $scope.$parent.title = "Cadastro de usuário";
        $scope.VoltarPaginaInicial = VoltarPaginaInicial;
        $scope.insertUsuario = insertUsuario;

        $scope.usuario = {
            Nome: undefined,
            Email: undefined,
            Login: undefined,
            Senha: undefined,
        };

        $scope.confirmaSenha = undefined;
        //$scope Variables END

        //Functions BEGIN
        function VoltarPaginaInicial() {
            $location.url('login');
        };

        function insertUsuario() {

            $scope.$broadcast('show-errors-check-validity');

            if ($scope.cadastroUsuarioExterno.$valid) {

                usuarioService.usuarioExternoSave($scope.usuario)
                    .then(function () {
                        $location.url("/login");
                        alertFactory.success(messagesFactory.Common.CADASTRADO_SUCESSO);
                    })
                    .catch(showError);

            }
            //Functions END
        };
    });
}());