(function () {
    'use strict'

    function routesConfig($routeProvider) {
        $routeProvider.when("/notfound", {
            templateUrl: "modules/notFound/view/notFound.html",
            controller: "notFoundController"
        })
        .otherwise({ redirectTo: "notfound" });
    }
    angular.module('app').config(['$routeProvider', routesConfig])
}())