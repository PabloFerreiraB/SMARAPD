(function () {
    'use strict';

    const app = angular.module('app');

    app.controller('perfilModalEditPasswordController',
        function ($scope, $uibModalInstance, jwtService, usuarioService, alertFactory, messagesFactory) {

            //$scope Variables BEGIN

            $scope.senha = {
                SenhaAtual: undefined,
                NovaSenha: undefined
            };

            $scope.usuario = {};
            $scope.session = {};

            $scope.getUsuario = getUsuario();
            $scope.fecharModal = fecharModal;
            $scope.editPassword = editPassword;

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

            function fecharModal() {
                $uibModalInstance.close(false);
            }

            function editPassword(senha) {

                $scope.$broadcast('show-errors-check-validity');

                if ($scope.edicaoPerfilPassword.$valid) {

                    if (senha.NovaSenha == $scope.confirmacaoSenha) {
                        usuarioService.updatePasswordUsuarioExterno($scope.usuario.id, senha)
                            .then(function () {
                                alertFactory.success(messagesFactory.Common.SENHA_ATUALIZADA_SUCESSO);
                                $uibModalInstance.close(false);
                                $route.reload();
                            })
                            .catch(showError)
                    }
                }
            }

            //$scope Functions END

        });

}());