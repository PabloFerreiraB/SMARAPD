(function () {
    'use strict';

    const app = angular.module('app');

    app.controller('perfilController', function ($scope, $uibModal, $location, jwtService, usuarioService, defaultImages) {

        //$scope Variables BEGIN

        $scope.$parent.title = "Perfil do Usuário";

        $scope.usuario = {};
        $scope.session = {};

        $scope.voltarPagina = voltarPagina;
        $scope.chamarModalEdicao = chamarModalEdicao;
        $scope.defaultImage = defaultImages.usuario;
        $scope.editPassword = editPassword;
        $scope.getUsuario = getUsuario();

        //$scope Variables END

        //$scope Functions BEGIN

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

        function voltarPagina() {
            $location.url("home");
        }

        function editPassword() {
            var modalInstance = $uibModal.open({
                templateUrl: 'modules/perfil/view/modal/perfil.modal.editPassword.html',
                controller: 'perfilModalEditPasswordController',
                size: 'md',
                backdrop: 'static',
                resolve: {}
            })
        };


        function chamarModalEdicao() {
            var modalInstance = $uibModal.open({
                templateUrl: 'modules/perfil/view/modal/perfil.modal.edit.html',
                controller: 'perfilModalController',
                size: 'md',
                backdrop: 'static',
                resolve: {}
            })
        };

        //$scope Variables END
    });
}());