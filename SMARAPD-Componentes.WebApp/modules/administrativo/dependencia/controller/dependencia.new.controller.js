(function () {
    'use strict';

    const app = angular.module('app');

    app.controller('dependenciaNewController', function ($scope, $location, dependenciaService, messagesFactory, alertFactory, $route) {

        //$scope Variables BEGIN  

        $scope.$parent.title = 'Inclusão de Dependência';
        $scope.save = save;
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


        function save(dependencia) {
            $scope.$broadcast('show-errors-check-validity');

            if ($scope.dependenciaNewForm.$valid) {
                dependenciaService.save(dependencia)
                    .then(function () {
                        alertFactory.success(messagesFactory.Common.CADASTRADO_SUCESSO);
                        $route.reload();
                    })
                    .catch(showError);
            }
        };

        //Functions END

    });
}());