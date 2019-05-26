(function () {
    'use strict';

    const app = angular.module('app');

    app.controller('indexController', function ($scope, $location, $route, jwtService, usuarioService, defaultImages) {
        // Variáveis do $scope BEGIN //

        $scope.$parent.title = "SMARDocs";
        $scope.session = {};
        $scope.defaultImage = defaultImages.usuario;

        $scope.isAdmin = jwtService.isSuperUser();
        // Variáveis do $scope END //

        // Variáveis de funções $scope BEGIN //

        $scope.goPerfil = goPerfil;
        $scope.goMenuPrincipal = goMenuPrincipal;
        $scope.logout = logout;
        $scope.getUsuario = getUsuario();

        // Variáveis de funções $scope END //

        // Funções $scope BEGIN //

        function goPerfil() {
            $location.url('/perfil');
        };

        function goMenuPrincipal() {
            $location.url('/administrativo/home');
        };

        function logout() {
            jwtService.destroy();
            $route.reload();
        };

        function getSession() {
            $scope.session = jwtService.getUser();
        };

        function getUsuario() {
            getSession();
            usuarioService.getById($scope.session.userId)
                .then(response => {
                    $scope.usuario = response;
                })
                .catch(error => {
                    showError(error);
                })
        };

        // Funções $scope END //     
    });
}());