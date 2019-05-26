(function () {
    'use strict';

    const app = angular.module('app');

    app.controller('usuarioEditAtivacaoController', function ($scope, $location, $route, usuarioService, dialogService, messagesFactory, alertFactory) {

        //$scope Variables BEGIN

        $scope.$parent.title = "Autorizar Usuário";
        $scope.usuarios = $scope.config;

        $scope.config =
            {
                name: 'Administrativo.Usuario.Ativacao',
                buttons: [
                    {
                        description: "Autorizar Todos",
                        action: function () {
                            dialogService.confirm("", messagesFactory.Common.CONFIRMA_AUTORIZACAO_GERAL)
                                .then(function () {
                                    usuarioService.updateAllAutorizacao()
                                        .then(function () {
                                            alertFactory.success(messagesFactory.Common.ATIVADO_SUCESSO_GERAL);
                                            $location.url("/administrativo/usuario");
                                        })
                                        .catch(showError)
                                })
                                .catch(showError)

                        }
                    },
                ],
                columns: [
                    { label: 'Nome', value: 'nome', size: 4, maxLength: 35 },
                    { label: 'Login', value: 'login', size: 3, maxLength: 15 },
                    { label: 'Tipo de usuário', value: 'isSuperUsuario', size: 3, maxLength: 14 },

                ],
                actions: [
                    {
                        description: 'Visualizar', icon: 'far fa-eye',
                        action: function (data) {
                            $location.url("/administrativo/usuario/view/" + data.id);
                        }
                    },
                    {
                        description: 'Autorizar', icon: 'far fa-check-square',

                        action: function (data) {
                            dialogService.confirm("", messagesFactory.Common.CONFIRMA_AUTORIZACAO)
                                .then(function () {
                                    usuarioService.updateAutorizacao(data.id)
                                        .then(function () {
                                            alertFactory.success(messagesFactory.Common.ATIVADO_SUCESSO);
                                            $route.reload();
                                        })
                                        .catch(showError)
                                })
                                .catch(showError)
                        }
                    }
                ],
                getData: function () {
                    return usuarioService.getallbyautorizacao();
                }
            };

        //$scope Variables END
    });
}());