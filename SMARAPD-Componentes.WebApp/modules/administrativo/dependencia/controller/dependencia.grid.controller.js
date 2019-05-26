(function () {
    'use strict';

    const app = angular.module('app');

    app.controller('dependenciaGridController', function ($scope, $location, $route, dependenciaService, dialogService, messagesFactory, alertFactory) {

        // Variáveis do $scope BEGIN //

        $scope.$parent.title = 'Busca de Dependência';

        $scope.config = {
            name: 'Administrativo.Dependencia',
            buttons: [
                {
                    description: "Adicionar", action: function (data) {
                        $location.url("/administrativo/dependencia/new")
                    }
                },
            ],
            columns: [{
                label: 'Nome',
                value: 'nome',
                size: 4,
                maxLength: 20
            },
            {
                label: 'Versão',
                value: 'versao',
                size: 2,
                maxLength: 12
            },
            {
                label: 'Status',
                value: 'status',
                size: 2,
                maxLength: 15
            },
            {
                label: 'URL',
                value: 'url',
                size: 2,
                maxLength: 18
            }
            ],

            actions: [{
                description: 'Visualizar',
                icon: 'far fa-eye',
                action: function (data) {
                    $location.url('/administrativo/dependencia/view/' + data.id);
                }
            },
            {
                description: 'Editar',
                icon: 'far fa-edit',
                action: function (data) {
                    $location.url('/administrativo/dependencia/edit/' + data.id, data);
                }
            },
            {
                description: 'Remover',
                icon: 'far fa-trash-alt',
                action: function (data) {
                    dialogService.confirmDelete()
                        .then(function (accept) {
                            if (accept) {
                                dependenciaService.remove(data.id)
                                    .then(function () {
                                        alertFactory.success(messagesFactory.Common.EXCLUIDO_SUCESSO);
                                        $route.reload();
                                    })
                                    .catch(showError);
                            }
                        });

                }
            },
            ],

            // Variáveis do $scope END //

            // Funções $scope BEGIN //

            getData: function () {
                return dependenciaService.getAll();
            }

            // Funções $scope END //
        };
    });
}());