(function () {
    "use strict";
    angular.module('app').controller('componenteDependenciaModalViewController', appController);

    function appController($scope, $uibModalInstance, dependencia) {

        $scope.title = "Visualização de Dependência";

        $scope.dependencia = dependencia;

        $scope.fecharModal = function () {
            $uibModalInstance.close(false);
        }

        // Tooltip
        $(".form-control").ready(function () {
            $('[data-toggle="tooltip"]').tooltip();
        });
    }
}());