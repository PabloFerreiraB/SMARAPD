(function () {
    'use strict';

    angular.module('app').config(function routesConfig($routeProvider) {

        $routeProvider
            .when("/login", {               
                templateUrl: "/modules/login/view/login.html",
                controller: "loginController"
            })
            .when("/cadastro", {
                templateUrl: "/modules/login/view/usuarioExterno.new.html",
                controller: "usuarioExternoNewController"
            })
    });
}());