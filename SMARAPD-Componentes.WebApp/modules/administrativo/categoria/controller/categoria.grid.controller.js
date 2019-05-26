(function () {
    'use strict';

    const app = angular.module('app');

    app.controller('categoriaGridController', function ($scope, $location, categoriaService, $route, dialogService, messagesFactory, alertFactory) {

        // Variáveis do $scope BEGIN //

        $scope.$parent.title = "Busca de Categoria";
        $scope.categorias = [];
        $scope.config =
            {
                name: 'Administrativo.Categoria',
                buttons: [
                    {
                        description: "Adicionar", action: function (data) {
                            $location.url("/administrativo/categoria/new")
                        }
                    },
                ],
                columns: [
                    { label: 'Nome', value: 'nome', size: 5, maxLength: 35 },
                    { label: 'Icone', value: 'icone', size: 5, maxLength: 20, isIcon: true }
                ],

                actions: [
                    {
                        description: 'Visualizar', icon: 'far fa-eye', action: function (data) {
                            $location.url('/administrativo/categoria/view/' + data.id)
                        }
                    },
                    {
                        description: 'Editar', icon: 'far fa-edit', action: function (data) {
                            $location.url('/administrativo/categoria/edit/' + data.id)
                        }
                    },
                    {
                        description: 'Remover', icon: 'far fa-trash-alt', action: function (data) {

                            dialogService.confirmDelete()
                                .then(function (accept) {
                                    if (accept) {
                                        categoriaService.remove(data.id)
                                            .then(function () {
                                                alertFactory.success(messagesFactory.Common.EXCLUIDO_SUCESSO);
                                                $route.reload();
                                            })
                                            .catch(showError);
                                    }
                                });
                        }
                    }
                ],

                getData: function () {
                    return categoriaService.getAll();
                }

            };

        // Variáveis do $scope END //

        // Funções $scope BEGIN //

        function load() {
            categoriaService.getAll()
                .then(function (dadosRequisicao) {
                    $scope.categorias = angular.copy(dadosRequisicao);
                })
                .catch(function (error) {
                    showError(error);
                    $location.url('administrativo/categoria');
                });
        };

        load();

        // Funções $scope END //  

    });
}());