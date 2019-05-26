(function () {
    'use strict';

    angular.module('app', ['ngRoute', 'ngAnimate', 'ui.codemirror', 'ui.bootstrap', 'angular-loading-bar', 'suggestion', 'card', 'angularMoment']);

    angular.module('app').config(['$locationProvider', function ($locationProvider) {
        $locationProvider.hashPrefix('');
    }]);

    angular.module('app').config(['$httpProvider', function ($httpProvider) {
        $httpProvider.interceptors.push('authInterceptor');
    }]);

    angular.module('app').run(function (alertFactory, $window, $rootScope, $location, jwtService) {
        $window.showError = window.showError = function showError(error) {

            if (error.status === 401 || error.status === 403) {
                alertFactory.danger('Token de acesso expirado');
            } else {

                if (error && (error.detail || error.title)) {
                    alertFactory.danger(error.status == 409 ? error.detail : error.title);
                }
            }
        };

        $rootScope.$on('$routeChangeStart', function (event, nextRoute, current) {
            //Verifica se o usuário está autorizado
            let isLogged = jwtService.isLogged();
            $rootScope.isLogged = isLogged;

            if (isLogged && ((nextRoute.originalPath == '/login') || (nextRoute.originalPath == '/cadastro')  )) {
                $location.path('/home');
                return;
            }

            if (!isLogged && (nextRoute.originalPath != '/cadastro')) {
                $location.path('/login');
                return;
            }

            $rootScope.isVisitante = !(nextRoute && nextRoute.access && nextRoute.access.requireSuperUser);
            $rootScope.isSuperUser = !!(nextRoute && nextRoute.access && nextRoute.access.requireSuperUser);

            //Verifica se o usuário tem permissão para acessar as telas de administração
            let isSuperUser = jwtService.isSuperUser();

            if (!!(nextRoute.access && nextRoute.access.requireSuperUser) && !isSuperUser) {
                $location.path('/denied');
                return;
            }

        });
    })


}());