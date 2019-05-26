angular.module('app')
    .controller('perfilModalController',
        function ($scope, $uibModalInstance, $route, jwtService, usuarioService, alertFactory, messagesFactory, defaultImages) {

            //$scope Variables BEGIN

            $scope.usuario = {};
            $scope.session = {};

            $scope.fecharModal = fecharModal;
            $scope.editUsuario = editUsuario;
            $scope.defaultImage = defaultImages.usuario;
            $scope.openfile = openfile;
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

            function fecharModal() {
                $uibModalInstance.close(false);
            }

            function openfile(file) {
                const reader = new FileReader();

                reader.onloadend = function () {
                    let string64 = reader.result;
                    $scope.usuario.imagem = string64;
                }

                reader.readAsDataURL(file);
            };

            function editUsuario(usuario) {

                $scope.$broadcast('show-errors-check-validity');

                if ($scope.edicaoPerfil.$valid) {

                    if (usuario.isSuperUsuario == "Administrador")
                        usuario.isSuperUsuario = true;
                    else
                        if (usuario.isSuperUsuario == "Comum")
                            usuario.isSuperUsuario = false;

                    usuarioService.update(usuario.id, usuario)
                        .then(function () {
                            $uibModalInstance.close(false);
                            $route.reload();
                            alertFactory.success(messagesFactory.Common.ATUALIZADO_SUCESSO);
                        })
                        .catch(showError)
                }
            }

            //$scope Functions END
        });