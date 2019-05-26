(function () {
    "use strict";
    angular.module('app').controller('componenteEventoModalViewController', appController);

    function appController($scope, $uibModalInstance, evento) {

        $scope.title = "Visualização de Evento";

        $scope.evento = evento;

        $scope.fecharModal = function () {
            $uibModalInstance.close(false);
        }

        $scope.configParametro = {
            data: [],
            cardModal: true,
            type: 'parametro',
            mesageEmpty: 'Este evento não possui parâmetros.'
        };

        $scope.editorOptions = {
            lineNumbers: true,
            mode: 'htmlmixed',
            readOnly: 'nocursor',
            onLoad: function (_editor) {
                exemplo.editor = _editor;

                setTimeout(function () {
                    exemplo.editor.refresh();
                }, 100);
            }
        };

        function init() {
            $scope.configParametro.data = evento.parametrosEvento;
        }

        init();

        // Tooltip
        $(".form-control").ready(function () {
            $('[data-toggle="tooltip"]').tooltip();
        });
    }
}());