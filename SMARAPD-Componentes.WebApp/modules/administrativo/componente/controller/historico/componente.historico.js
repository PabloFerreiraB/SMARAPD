(function () {
    'use strict';

    const app = angular.module('app');

    app.controller('historicoController', function ($scope, $uibModal, historicoService, $location, $filter) {
        // Variáveis do $scope BEGIN //

        $scope.$parent.title = "Histórico de Componentes";

        $scope.historicos = [];

        // Variáveis do $scope END //

        // Variáveis de funções $scope BEGIN //

        $scope.abrirModal = abrirModal;

        // Variáveis de funções $scope END //

        // Funções $scope BEGIN //

        function abrirModal(historico) {
            $scope.objHistorico = historico;
            var modalInstance = $uibModal.open({
                templateUrl: '/modules/administrativo/componente/view/historico/modal/componente.historico.modal.html',
                controller: 'historicoModalController',
                size: 'md',
                backdrop: 'static',
                resolve: {},
                scope: $scope
            })
        };

        function load() {
            historicoService.getAll()
                .then(function (dadosRequisicao) {
                    $scope.historicos = angular.copy(dadosRequisicao);
                })
                .catch(function (error) {
                    showError(error);
                    $location.url('administrativo/home');
                });
        };

        load();

        $filter('uppercase')();

        // Tooltip
        $(".form-control").ready(function () {
            $('[data-toggle="tooltip"]').tooltip();
        });

        // Funções $scope END //
    });
}());