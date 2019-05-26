(function () {
    "use strict";
    angular.module('app').controller('componenteMetodoModalViewController', appController);

    function appController($scope, $uibModalInstance, metodo) {

        $scope.title = "Visualização de Método";

        $scope.metodo = metodo;

        $scope.fecharModal = function () {
            $uibModalInstance.close(false);
        }

        $scope.configParametro = {
            data: [],
            cardModal: true,
            type: 'parametro',
            mesageEmpty: 'Este método não possui parâmetros.'
        };

        $scope.editorOptions = {
            lineNumbers: true,
            mode: 'javascript',
            readOnly: 'nocursor',
            onLoad: function (_editor) {
                exemplo.editor = _editor;

                setTimeout(function () {
                    exemplo.editor.refresh();
                }, 100);
            }
        };

        function init() {
            $scope.configParametro.data = metodo.parametrosMetodo;
        }

        init();

        // Tooltip
        $(".form-control").ready(function () {
            $('[data-toggle="tooltip"]').tooltip();
        });
    }
}());