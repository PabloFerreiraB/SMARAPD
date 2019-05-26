(function () {
    'use strict';

    const app = angular.module('app');

    app.controller('usuarioGridController', function ($scope, usuarioService, $location) {

        //$scope Variables BEGIN

        $scope.$parent.title = "Busca de Usuário";
        
        $scope.config =
            {
                name: 'Administrativo.Usuario',
                buttons: [
                    {
                        description: "Adicionar", action: function () {
                            $location.url("/administrativo/usuario/new")
                        }
                    }
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
                        description: 'Editar', icon: 'far fa-edit',
                        action: function (data) {
                            $location.url("/administrativo/usuario/edit/" + data.id);
                        }
                    },
                    {
                        description: 'Redefinir Senha', icon: 'fas fa-key',
                        action: function (data) {
                            $location.url("/administrativo/usuario/editPassword/" + data.id);
                        }
                    },
                ],
                getData: function () {
                    return usuarioService.getAll();
                }
            };

        //$scope Variables END
    });
}());