(function () {
    'use strict';

    const app = angular.module('app');

    app.controller('usuarioViewController', function ($scope, $location, $routeParams, usuarioService, defaultImages, $window) {

        //$scope Variables BEGIN

        $scope.$parent.title = "Visualização de Usuário";
        $scope.voltarPagina = voltarPagina;
        $scope.getUsuario = getUsuario();
        $scope.usuario = {};
        $scope.defaultImage = defaultImages.usuario;

        //$scope Variables END

        //$scope Functions BEGIN 

        function voltarPagina() {
            $window.history.back();
        };

        function getUsuario() {
            usuarioService.getById($routeParams.id)
                .then(function (dados) {
                    $scope.usuario = angular.copy(dados);
                })
                .catch(function (error) {
                    showError(error);
                    $location.url('administrativo/usuario');
                })
        };

        //$scope Functions END 
    });
}());