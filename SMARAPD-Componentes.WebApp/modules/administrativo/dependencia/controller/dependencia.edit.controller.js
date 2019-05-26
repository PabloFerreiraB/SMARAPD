(function () {
    'use strict';

    const app = angular.module('app');

    app.controller('dependenciaEditController', function ($scope, $location, $routeParams, dependenciaService, messagesFactory, alertFactory) {

        //$scope Variables BEGIN  

        $scope.$parent.title = 'Edição de Dependência';
        $scope.cancelar = cancelar;
        $scope.update = update;

        $scope.dependencia = {
            nome: undefined,
            versao: undefined,
            status: undefined,
            url: undefined
        };

        //$scope Variables END

        //Functions BEGIN

        $scope.status = [{
            nome: 'Depreciado',
            value: 'Depreciado'
        },
        {
            nome: 'Ativo',
            value: 'Ativo'
        },
        {
            nome: 'Desativado',
            value: 'Desativado'
        }
        ];

        function load() {
            dependenciaService.getbyid($routeParams.id)
                .then(function (dadosRequisicao) {
                    $scope.dependencia = angular.copy(dadosRequisicao);
                })
                .catch(showError);
        };

        function cancelar() {
            $location.url('/administrativo/dependencia');
        };

        function update(dependencia) {
            $scope.$broadcast('show-errors-check-validity');

            if ($scope.dependenciaNewForm.$valid) {
                dependenciaService.update($routeParams.id, dependencia)
                    .then(function () {
                        $location.url('/administrativo/dependencia');
                        alertFactory.success(messagesFactory.Common.ATUALIZADO_SUCESSO);
                    })
                    .catch(showError);
            }
        };

        //Functions END

        load();
    });
}());