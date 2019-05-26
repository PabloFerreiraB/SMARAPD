(function () {
    'use strict';

    const app = angular.module('app');

    app.controller('dependenciaViewController', function ($scope, $location, $routeParams, dependenciaService) {


        //$scope Variables BEGIN  

        $scope.$parent.title = 'Visualização de Dependência';
        $scope.cancelar = cancelar;

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


        function cancelar() {
            $location.url('/administrativo/dependencia');
        };

        function load() {
            dependenciaService.getbyid($routeParams.id)
                .then(function (dadosRequisicao) {
                    $scope.dependencia = angular.copy(dadosRequisicao);
                })
                .catch(showError);
        };

        //Functions END

        load();
    });
}());