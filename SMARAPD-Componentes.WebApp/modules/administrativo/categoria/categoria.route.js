(function () {
    'use strict';

    angular.module('app').config(function routesConfig($routeProvider, routeConfig) {

        var defaultRoute = routeConfig.Administrativo;

        $routeProvider       
            .when(defaultRoute + 'categoria', { 
                templateUrl: '/modules/administrativo/categoria/view/categoria.grid.html',
                controller: 'categoriaGridController',
                access: {
                    requireSuperUser: true
                }
            })
            .when(defaultRoute + 'categoria/new', { 
                templateUrl: '/modules/administrativo/categoria/view/categoria.new.html',
                controller: 'categoriaNewController',
                access: {
                    requireSuperUser: true
                }
            })
            .when(defaultRoute + 'categoria/edit/:id', { 
                templateUrl: '/modules/administrativo/categoria/view/categoria.edit.html',
                controller: 'categoriaEditController',
                access: {
                    requireSuperUser: true
                }
            })
            .when(defaultRoute + 'categoria/view/:id', { 
                templateUrl: '/modules/administrativo/categoria/view/categoria.view.html',
                controller: 'categoriaViewController',
                access: {
                    requireSuperUser: true
                }
            });
    });
}());