(function () {
    "use strict";
    angular.module('app').controller('componenteParametroEditController', appController);

    function appController($scope, $routeParams, $window, $uibModal, alertFactory, messagesFactory, dialogService, parametroService, componenteService) {
        
        // Variáveis de $scope BEGIN
        $scope.parametros = [];

        $scope.componente = {
            id: undefined,
            nome: undefined,
            status: undefined,
            descricao: undefined,
            idCategoria: undefined,
            idFramework: undefined,
            arquivo: undefined,
            exemplo: undefined,
            observacao: undefined,
            urlImagem: undefined,
            tags: [],
            parametros: []
        };
        
        //Lista de parâmetros (diretiva de cards)
        $scope.configParametro = {
            data: [],
            searchBar: true,
            addButton: true,
            actions: true,
            mesageEmpty: 'Este componente não possui parâmetros.',
            edit: openModalParametro,
            add: openModalParametro,
            remove: deleteParametro,
            type: 'parametro',
        };
        // Variáveis de $scope END


        // Variáveis de Função $scope BEGIN
        $scope.buscarParametro = buscarParametro;
        $scope.openModalParametro = openModalParametro;
        $scope.modalDeleteParametro = modalDeleteParametro;
        // Variáveis de Função $scope END


        //Funções $scope BEGIN
        function openModalParametro(parametro = undefined) {
            var modalInstance = $uibModal.open({
                templateUrl: 'modules/administrativo/componente/view/parametro/modal/componente.parametro.modal.html',
                controller: 'componenteParametroModalController',
                size: 'lg',
                backdrop: 'static',
                resolve: {
                    idComponente: function () {
                        return $routeParams.id;
                    },
                    parametro: function () {
                        return angular.copy(parametro);
                    }
                }
            });

            modalInstance.result
                .then(function (result) {
                    if (result) {
                        carregarParametros();
                    }
                })
        };

        function modalDeleteParametro(parametroId) {
            dialogService.confirmDelete()
                .then(function (accept) {
                    if (accept) {
                        deleteParametro(parametroId);
                    }
                });
        }

        function deleteParametro(parametro) {
            parametroService.delete(parametro.id)
                .then(function () {
                    carregarParametros();
                })
                .catch(showError);
        };

        function carregarParametros() {
            parametroService.getByComponente($routeParams.id)
                .then(function (data) {
                    $scope.componente.parametros = data;
                    $scope.parametros = data;
                    init();
                })
                .catch(showError);
        };

        function buscarParametro(termoBusca) {
            if (termoBusca && termoBusca.length > 2) {
                $scope.parametros = $scope.componente.parametros.filter(function (item) {
                    return item.nome.includes(termoBusca);
                });
            } else if (!termoBusca) {
                $scope.parametros = $scope.componente.parametros;
            }
        };

        function init() {
            componenteService.getAll()
                .then(function (data) {
                    $scope.componente = data.filter(function (c) {
                        return c.id == $routeParams.id;
                    })[0];
                    $scope.parametros = $scope.componente.parametros;
                    $scope.configParametro.data = $scope.parametros;
                })
                .catch(showError);
        };

        init();

        //Funções $scope END
    }
}());