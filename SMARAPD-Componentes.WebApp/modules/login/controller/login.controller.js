(function () {
    'use strict';

    const app = angular.module('app');

    app.controller('loginController', function ($scope, $location, authService, jwtService) {
        $scope.cadastrar = cadastrar;
        $scope.logar = logar;

        $scope.usuario = {
            userName: undefined,
            password: undefined
        }

        function cadastrar() {
            $location.url('/cadastro');
        };

        function logar() {

            $scope.$broadcast('show-errors-check-validity');

            if ($scope.loginForm.$valid) {
                authService.logar($scope.usuario).then(function (data) {

                    jwtService.save(data.token);

                    let user = jwtService.getUser();

                    if (user.isSuperUser == "True") {
                        $location.url('/administrativo/home');

                    } else {
                        $location.url('/home')
                    }

                })
                    .catch(function (error) {
                        showError(error);
                    });
            }
        };

    });

}());