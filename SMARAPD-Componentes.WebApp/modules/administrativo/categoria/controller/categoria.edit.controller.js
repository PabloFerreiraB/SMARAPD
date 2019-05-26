(function () {
    'use strict';

    const app = angular.module('app');

    app.controller('categoriaEditController', function ($scope, $routeParams, $location, categoriaService, dialogService, messagesFactory, alertFactory, iconeService) {

        // Variáveis do $scope BEGIN //

        $scope.$parent.title = "Edição de Categoria";
        $scope.categoria = {
            nome: undefined,
            icone: undefined
        };


        
        $scope.searchStr = undefined;

        $scope.config = {
            data: [],
            quantidadeItens: 10,
            fieldValue: 'classe',
            selectedObject: function (data) {
                $scope.config.teste = true;
                $scope.categoria.icone = data.classe;
            },
            iconValue:'classe',
            isRequired: true,
            teste: false,
            objeto: $scope.categoria,
            tooltip: "Ícone" 

        }


        // Variáveis do $scope END //

        // Variáveis de funções $scope BEGIN //

        $scope.update = update;

        // Variáveis de funções $scope END //

        // Funções $scope BEGIN //

        function load() {
            getIcons();
            categoriaService.getById($routeParams.id)
                .then(function (dadosRequisicao) {
                    $scope.categoria = angular.copy(dadosRequisicao);
                    $scope.searchStr = $scope.categoria.icone
                    $scope.config.objeto = $scope.categoria;
                })
                .catch(function (error) {
                    showError(error);
                    $location.url('administrativo/categoria');
                });
        };

        function update(categoria) {

            $scope.$broadcast('show-errors-check-validity');

            if ($scope.categoriaEditForm.$valid) {

                categoriaService.update(categoria, $routeParams.id)
                    .then(function () {
                        $location.url('/administrativo/categoria');
                        alertFactory.success(messagesFactory.Common.ATUALIZADO_SUCESSO);
                    })
                    .catch(function (error) {
                        showError(error);
                        $location.url('administrativo/categoria');
                    });
            }
        };

        function getIcons(){
            
            const icons = iconeService.getAll().map(item =>{
                return{
                    data: item
                }
            })
            $scope.config.data = icons;
        }

        load();

        // Funções $scope END //       

        // Tooltip
        $(".form-control").ready(function () {
            $('[data-toggle="tooltip"]').tooltip();
        });

    });
}());