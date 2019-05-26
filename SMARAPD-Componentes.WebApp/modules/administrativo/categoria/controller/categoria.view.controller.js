(function () {
    'use strict';

    const app = angular.module('app');

    app.controller('categoriaViewController', function ($scope, categoriaService, $routeParams, $location) {

        // Variáveis do $scope BEGIN //

        $scope.$parent.title = "Visualização de Categoria";
        $scope.categoria = {
            id: undefined,
            nome: undefined,
            icone: undefined
        };



        // Variáveis do $scope END //

        // Funções $scope BEGIN //

        function load() {
            categoriaService.getById($routeParams.id)
                .then(function (dadosRequisicao) {
                    $scope.categoria = angular.copy(dadosRequisicao);
                })
                .catch(function (error) {
                    showError(error);
                    $location.url('administrativo/categoria');
                });
        };

        load();

        // Funções $scope END //

        // Tooltip
        $(".form-control").ready(function () {
            $('[data-toggle="tooltip"]').tooltip();
        });

    });
}());