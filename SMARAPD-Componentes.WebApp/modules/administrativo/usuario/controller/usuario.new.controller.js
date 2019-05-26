(function () {
    'use strict';

    const app = angular.module('app');

    app.controller('usuarioNewController', function ($scope, $location, $route, usuarioService, messagesFactory, alertFactory, defaultImages) {

        //$scope Variables BEGIN

        $scope.$parent.title = "Inclusão de Usuário";
        $scope.insertUsuario = insertUsuario;
        $scope.voltarPagina = voltarPagina;
        $scope.openfile = openfile;
        $scope.defaultImage = defaultImages.usuario;

        $scope.usuario = {
            nome: undefined,
            email: undefined,
            login: undefined,
            senha: undefined,
            imagem: undefined,
            isSuperUsuario: undefined,
            isAutorizado: undefined
        };

        $scope.tipoUsuario = [
            "Administrador",
            "Comum"
        ];

        //$scope Variables END

        //Functions BEGIN

        function openfile(file) {
            const reader = new FileReader();

            reader.onloadend = function () {
                let string64 = reader.result;
                $scope.usuario.imagem = string64;
            }

            reader.readAsDataURL(file);
        };

        function insertUsuario(usuario) {
            $scope.$broadcast('show-errors-check-validity');

            if ($scope.CadastroUsuario.$valid && usuario.senha == usuario.confirmaSenha) {

                if (usuario.isSuperUsuario == "Administrador")
                    usuario.isSuperUsuario = true;
                else
                    usuario.isSuperUsuario = false;

                usuarioService.save(usuario)
                    .then(function () {
                        $route.reload();
                        alertFactory.success(messagesFactory.Common.CADASTRADO_SUCESSO);
                    })
                    .catch(showError);
            }
        };

        function voltarPagina() {
            $location.url("/administrativo/usuario");
        };

        //Functions END
    });
}());