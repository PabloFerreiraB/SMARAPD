angular.module("app").config(function ($routeProvider) {

    $routeProvider
        .when('/componente/:id', {
            templateUrl: 'modules/visitante/componente/view/componente.html',
            controller: 'componenteController'
        })
        .when('/componente/:id/:tab', {
            templateUrl: 'modules/visitante/componente/view/componente.html',
            controller: 'componenteController'
        })
        .when("/home", {
            templateUrl: "modules/visitante/home/view/dashVisitante.html",
            controller: "homeVisitanteController"
        })
        .when("/home/buscar", {
            templateUrl: "modules/visitante/home/view/dashVisitante.html",
            controller: "homeVisitanteController"
        })
});