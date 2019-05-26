(function () {
    'use strict';

    angular.module('app').config(function routesConfig($routeProvider, routeConfig) {
        var defaultRoute = routeConfig.Administrativo;

        $routeProvider
            .when('/administrativo/home', {
                templateUrl: '/modules/administrativo/home/view/homeAdministrativo.html',
                controller: 'homeAdministrativoController',
                access: {
                    requireSuperUser: true
                }
            });
    });
}())