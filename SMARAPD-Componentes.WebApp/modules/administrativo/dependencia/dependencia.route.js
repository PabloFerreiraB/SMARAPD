(function () {
    'use strict'

    angular.module('app').config(function routesConfig($routeProvider, routeConfig) {

        var defaultRoute = routeConfig.Administrativo;

        $routeProvider

            .when(defaultRoute + 'dependencia', {
                templateUrl: '/modules/administrativo/dependencia/view/dependencia.grid.html',
                controller: 'dependenciaGridController',
                access: {
                    requireSuperUser: true
                }
            })

            .when(defaultRoute + 'dependencia/new', {
                templateUrl: '/modules/administrativo/dependencia/view/dependencia.new.html',
                controller: 'dependenciaNewController',
                access: {
                    requireSuperUser: true
                }
            })

            .when(defaultRoute + 'dependencia/edit/:id', {
                templateUrl: '/modules/administrativo/dependencia/view/dependencia.edit.html',
                controller: 'dependenciaEditController',
                access: {
                    requireSuperUser: true
                }
            })

            .when(defaultRoute + 'dependencia/view/:id', {
                templateUrl: '/modules/administrativo/dependencia/view/dependencia.view.html',
                controller: 'dependenciaViewController',
                access: {
                    requireSuperUser: true
                }
            });
    });
}())