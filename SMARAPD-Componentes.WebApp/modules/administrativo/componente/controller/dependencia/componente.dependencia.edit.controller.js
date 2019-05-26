(function () {
    "use strict";
    angular.module('app').controller('componenteDependenciaEditController', appController);

    function appController($scope, $routeParams, alertFactory, dialogService, messagesFactory, dependenciaService, componenteService, $uibModal) {

        // Variáveis de $scope BEGIN
        $scope.componenteId = $routeParams.id;

        $scope.dependencias = [];
        // Variáveis de $scope END


        // Variáveis de Função $scope BEGIN
        $scope.openModalDependencia = openModalDependencia;
        $scope.openModalDelete = openModalDelete;
        // Variáveis de Função $scope END


        //Funções $scope BEGIN

        //Lista de metodos
        $scope.configDependencia = {
            data: [],
            searchBar: true,
            addButton: true,
            actions: true,
            mesageEmpty: 'Este componente não possui dependências.',
            add: openModalDependencia,
            remove: openModalDelete,
            type: 'dependencia'
        };

        // Modals
        function openModalDependencia(dependencia) {
            var modalInstance = $uibModal.open({
                templateUrl: 'modules/administrativo/componente/view/dependencia/modal/componente.dependencia.modal.html',
                controller: 'componenteDependenciaModalController',
                size: 'lg',
                backdrop: 'static',
                resolve: {
                    idComponente: function () {
                        return $scope.componenteId;
                    },
                    dependencia: function () {
                        return dependencia;
                    }
                }
            });

            modalInstance.result
                .then(function (result) {
                    if (result) {
                        getDependenciaByIdComponente();
                    }
                })
        };

        function openModalDelete(dependencia) {
            dialogService.confirmDelete()
                .then(function (accept) {
                    if (accept) {
                        dependenciaService.desassociar($scope.componenteId, dependencia.id)
                            .then(function () {
                                alertFactory.success(messagesFactory.Common.EXCLUIDO_SUCESSO);
                                getDependenciaByIdComponente();
                            })
                            .catch(showError);
                    }
                });
        }

        function getDependenciaByIdComponente() {
            componenteService.getById($scope.componenteId)
                .then(function (data) {
                    $scope.dependencias = data.dependencias;
                    carregarCardsDependencia();
                })
                .catch(showError);
        }

        function carregarCardsDependencia() {
            $scope.configDependencia.data = $scope.dependencias;
        }

        getDependenciaByIdComponente();

        //Funções $scope END
    }
}());