(function () {
    'use strict';

    const app = angular.module('app');

    app.controller('usuarioEditController', function ($scope, $routeParams, $location, $route, usuarioService, alertFactory, defaultImages, messagesFactory) {

        //$scope Variables BEGIN

        $scope.$parent.title = "Edição de Usuário";
        $scope.usuario = {};
        $scope.getUsuario = getUsuario();
        $scope.voltarPagina = voltarPagina;
        $scope.putUsuario = putUsuario;
        $scope.openfile = openfile;
        $scope.defaultImage = defaultImages.usuario;

        $scope.tipoUsuario = [
            "Administrador",
            "Comum"
        ];

        //$scope Variables END

        //$scope Functions BEGIN

        function getUsuario() {
            usuarioService.getById($routeParams.id)
                .then(function (dados) {
                    $scope.usuario = angular.copy(dados);
                })
                .catch(function (error) {
                    showError(error);
                    $location.url('administrativo/usuario');
                });
        };

        function openfile(file) {
            const reader = new FileReader();

            reader.onloadend = function () {
                let string64 = reader.result;
                $scope.usuario.imagem = string64;
            }

            reader.readAsDataURL(file);
        };

        function voltarPagina() {
            $location.url("/administrativo/usuario/")
        };

        function putUsuario(usuario) {

            $scope.$broadcast('show-errors-check-validity');

            if (usuario.isSuperUsuario == "Administrador")
                usuario.isSuperUsuario = true;
            else
                usuario.isSuperUsuario = false;

            if ($scope.cadastroUsuario.$valid) {
                usuarioService.update(usuario.id, usuario)
                    .then(function () {
                        $location.url("/administrativo/usuario/");
                        alertFactory.success(messagesFactory.Common.ATUALIZADO_SUCESSO);
                    })
                    .catch(function (error) {
                        showError(error);
                        $route.reload();
                    });
            }
        };

        //$scope Functions END
    });
}());