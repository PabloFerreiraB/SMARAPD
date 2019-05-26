(function () {
    "use strict";
    angular.module('app').controller('componenteEventoEditController', appController);

    function appController($scope, eventoService, dialogService, messagesFactory, alertFactory, $uibModal, $routeParams) {

        // Variáveis de $scope BEGIN
        $scope.componenteId = $routeParams.id;

        $scope.eventos = [];
        // Variáveis de $scope END


        // Variáveis de Função $scope BEGIN
        $scope.openModalEvento = openModalEvento;
        $scope.openModalDelete = openModalDelete;
        // Variáveis de Função $scope END


        //Funções $scope BEGIN

        //Lista de eventos
        $scope.configEvento = {
            data: [],
            searchBar: true,
            addButton: true,
            actions: true,
            mesageEmpty: 'Este componente não possui eventos.',
            edit: openModalEvento,
            add: openModalEvento,
            remove: openModalDelete,
            type: 'evento'
        };

        // Modals
        function openModalEvento(evento) {

            var modalInstance = $uibModal.open({
                templateUrl: 'modules/administrativo/componente/view/evento/modal/componente.evento.modal.html',
                controller: 'componenteEventoModalController',
                size: 'lg',
                backdrop: 'static',
                resolve: {
                    idComponente: function () {
                        return $scope.componenteId;
                    },
                    evento: function () {
                        return evento;
                    }
                }
            });

            modalInstance.result
                .then(function (result) {
                    if (result) {
                        getEventoByIdComponente();
                    }
                })
        };

        function openModalDelete(evento) {
            dialogService.confirmDelete()
                .then(function (accept) {
                    if (accept) {
                        eventoService.delete(evento.id)
                            .then(function () {
                                alertFactory.success(messagesFactory.Common.EXCLUIDO_SUCESSO);
                                getEventoByIdComponente();
                            })
                            .catch(showError);
                    }
                });
        }

        function getEventoByIdComponente() {
            eventoService.getByIdComponente($scope.componenteId)
                .then(function (data) {
                    $scope.eventos = data;
                    $scope.configEvento.data = $scope.eventos;
                })
                .catch(showError);
        }

        getEventoByIdComponente();

        //Funções $scope END
    }
}());