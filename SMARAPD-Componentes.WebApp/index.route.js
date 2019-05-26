(function () {
    'use strict';

    const route = angular.module('app');

    route.config(function ($routeProvider) {
        $routeProvider
            .when('/perfil', {
                templateUrl: 'modules/perfil/view/perfil.html',
                controller: 'perfilController'
            });
    });
}());