(function () {
    'use strict';

    angular.module('app').config(function routesConfig($routeProvider, routeConfig) {
        var defaultRoute = routeConfig.Administrativo;

        $routeProvider
            .when(defaultRoute + 'usuario', {
                templateUrl: '/modules/administrativo/usuario/view/usuario.grid.html',
                controller: 'usuarioGridController',
                access: {
                    requireSuperUser: true
                }
            })
            .when(defaultRoute + 'usuario/new', {
                templateUrl: '/modules/administrativo/usuario/view/usuario.new.html',
                controller: 'usuarioNewController',
                access: {
                    requireSuperUser: true
                }
            })
            .when(defaultRoute + 'usuario/edit/:id', {
                templateUrl: '/modules/administrativo/usuario/view/usuario.edit.html',
                controller: 'usuarioEditController',
                access: {
                    requireSuperUser: true
                }
            })
            .when(defaultRoute + 'usuario/view/:id', {
                templateUrl: '/modules/administrativo/usuario/view/usuario.view.html',
                controller: 'usuarioViewController',
                access: {
                    requireSuperUser: true
                }
            })
            .when(defaultRoute + 'usuario/editPassword/:id', {
                templateUrl: '/modules/administrativo/usuario/view/usuario.edit.password.html',
                controller: 'usuarioEditPasswordController',
                access: {
                    requireSuperUser: true
                }
            })
            .when(defaultRoute + 'usuario/editAtivacao', {
                templateUrl: '/modules/administrativo/usuario/view/usuario.edit.ativacao.html',
                controller: 'usuarioEditAtivacaoController',
                access: {
                    requireSuperUser: true
                }
            });
    });
}())