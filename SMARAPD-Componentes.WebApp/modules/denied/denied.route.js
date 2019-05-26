(function () {
    'use strict'

    function routesConfig($routeProvider) {
        $routeProvider.when("/denied", {
            templateUrl: "modules/denied/view/denied.html",
            controller: "deniedController"
        })       
    }
    angular.module('app').config(['$routeProvider', routesConfig])
}())