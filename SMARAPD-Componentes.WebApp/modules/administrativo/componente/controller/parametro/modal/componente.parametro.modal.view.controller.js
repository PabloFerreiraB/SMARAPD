(function () {
    "use strict";
    angular.module('app').controller('componenteParametroModalViewController', appController);

    function appController($scope, $uibModalInstance, parametro) {

        $scope.title = "Visualização de Parâmetro";

        $scope.parametro = parametro;

        $scope.fecharModal = function () {
            $uibModalInstance.close(false);
        }

        // Tooltip
        $(".form-control").ready(function () {
            $('[data-toggle="tooltip"]').tooltip();
        });
    }
}());