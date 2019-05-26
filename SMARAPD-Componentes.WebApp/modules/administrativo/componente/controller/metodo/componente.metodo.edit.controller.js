(function () {
    "use strict";
    angular.module('app').controller('componenteMetodoEditController', appController);

    function appController($scope, metodoService, dialogService, messagesFactory, alertFactory, $uibModal, $routeParams) {

        // Variáveis de $scope BEGIN
        $scope.componenteId = $routeParams.id;

        $scope.metodos = [];
        // Variáveis de $scope END


        // Variáveis de Função $scope BEGIN
        $scope.openModalMetodo = openModalMetodo;
        $scope.openModalDelete = openModalDelete;
        // Variáveis de Função $scope END


        //Funções $scope BEGIN

        //Lista de metodos
        $scope.configMetodo = {
            data: [],
            searchBar: true,
            addButton: true,
            actions: true,
            mesageEmpty: 'Este componente não possui métodos.',
            edit: openModalMetodo,
            add: openModalMetodo,
            remove: openModalDelete,
            type: 'metodo'
        };

        // Modals
        function openModalMetodo(metodo) {
            var modalInstance = $uibModal.open({
                templateUrl: 'modules/administrativo/componente/view/metodo/modal/componente.metodo.modal.html',
                controller: 'componenteMetodoModalController',
                size: 'lg',
                backdrop: 'static',
                resolve: {
                    idComponente: function () {
                        return $scope.componenteId;
                    },
                    metodo: function () {
                        return metodo;
                    }
                }
            });

            modalInstance.result
                .then(function (result) {
                    if (result) {
                        getMetodoByIdComponente();
                    }
                })
        };

        function openModalDelete(metodo) {
            dialogService.confirmDelete()
                .then(function (accept) {
                    if (accept) {
                        metodoService.delete(metodo.id)
                        .then(function () {
                            alertFactory.success(messagesFactory.Common.EXCLUIDO_SUCESSO);
                            getMetodoByIdComponente();
                        })
                        .catch(showError);
                    }
                });
        }

        function getMetodoByIdComponente() {
            metodoService.getByIdComponente($scope.componenteId)
                .then(function (data) {
                    $scope.metodos = data;
                    $scope.configMetodo.data = $scope.metodos;
                })
                .catch(showError);
        }

        getMetodoByIdComponente();

        //Funções $scope END
    }
}());