(function () {
    'use strict';

    angular.module('app').config(function routesConfig($routeProvider, routeConfig) {

        var defaultRoute = routeConfig.Administrativo;

        $routeProvider
            .when(defaultRoute + 'componente', {
                templateUrl: 'modules/administrativo/componente/view/grid/componente.grid.html',
                controller: 'componenteGridController',
                access: {
                    requireSuperUser: true
                }
            })
            .when(defaultRoute + 'componente/new', {
                templateUrl: '/modules/administrativo/componente/view/componente.principal.new.html',
                controller: 'componentePrincipalNewController',
                access: {
                    requireSuperUser: true
                }
            })
            .when(defaultRoute + 'componente/edit/:id', {
                templateUrl: '/modules/administrativo/componente/view/componente.principal.edit.html',
                controller: 'componentePrincipalEditController',
                access: {
                    requireSuperUser: true
                }
            })
            .when(defaultRoute + 'componente/view/:id', {
                templateUrl: '/modules/administrativo/componente/view/componente.principal.view.html',
                controller: 'componentePrincipalViewController',
                access: {
                    requireSuperUser: true
                }
            })
            .when(defaultRoute + 'componente/historico', {
                templateUrl: '/modules/administrativo/componente/view/historico/componente.historico.geral.html',
                controller: 'historicoController',
                access: {
                    requireSuperUser: true
                }
            })

    });
}());