(function () {
    'use strict';

    const app = angular.module('app');

    app.controller('categoriaNewController', function ($scope, categoriaService, $location, $route, messagesFactory, alertFactory, iconeService) {

        // Variáveis do $scope BEGIN //

        $scope.$parent.title = "Inclusão de Categoria";
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
            iconValue: 'classe',
            isRequired: true,
            teste: false,
            objeto: $scope.categoria,
            tooltip: "Ícone"

        }

        // Variáveis do $scope END //

        // Variáveis de funções $scope BEGIN //

        $scope.save = save;

        // Variáveis de funções $scope END //

        // Funções $scope BEGIN //

        function save(categoria) {

            $scope.$broadcast('show-errors-check-validity');

            if ($scope.categoriaNewForm.$valid) {
                categoriaService.save(categoria)
                    .then(function () {
                        $route.reload();
                        alertFactory.success(messagesFactory.Common.CADASTRADO_SUCESSO);
                    })
                    .catch(function (error) {
                        showError(error);
                        $location.url('administrativo/categoria');
                    });
            }
        };

        function getIcons() {

            const icons = iconeService.getAll().map(item => {
                return {
                    data: item
                }
            })
            $scope.config.data = icons;
        }

        function load() {
            getIcons();
        }

        load()

        // Funções $scope END //      

        // Tooltip
        $(".form-control").ready(function () {
            $('[data-toggle="tooltip"]').tooltip();
        });

    });
}());