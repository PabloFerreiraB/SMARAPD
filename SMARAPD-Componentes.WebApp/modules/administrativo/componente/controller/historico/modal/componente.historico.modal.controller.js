(function () {
    'use strict';

    const app = angular.module('app');

    app.controller('historicoModalController', function ($scope, $uibModalInstance) {
        // Variáveis do $scope BEGIN //

        // Variáveis do $scope END //

        // Variáveis de funções $scope BEGIN //
        $scope.load = load();

        $scope.fecharModal = fecharModal;

        // Variáveis de funções $scope END //

        // Funções $scope BEGIN //

        function fecharModal() {
            $uibModalInstance.close(false);
        }

        function load() {
            
        }

        // Funções $scope END //
    });
}());