(function () {
    'use strict';

    const app = angular.module('app');

    app.controller('homeAdministrativoController', function ($scope, $location, usuarioService) {

        // Variáveis do $scope BEGIN //

        $scope.$parent.title = "SMARDocs";
        $scope.naoAutorizados = undefined;

        // Variáveis do $scope END //

        // Variáveis de funções $scope BEGIN //

        $scope.goCategoriaGrid = goCategoriaGrid;
        $scope.goCategoriaNew = goCategoriaNew;
        $scope.goComponenteGrid = goComponenteGrid;
        $scope.goComponenteNew = goComponenteNew;
        $scope.goUsuarioGrid = goUsuarioGrid;
        $scope.goUsuarioNew = goUsuarioNew;
        $scope.goUsuarioAutorizacao = goUsuarioAutorizacao;
        $scope.goDependenciaGrid = goDependenciaGrid;
        $scope.goDependenciaoNew = goDependenciaoNew;
        $scope.goComponenteHistorico = goComponenteHistorico;

        // Variáveis de funções $scope END //

        // Funções $scope BEGIN //

        function goCategoriaGrid() {
            $location.url('/administrativo/categoria');
        };

        function goCategoriaNew() {
            $location.url('/administrativo/categoria/new');
        };

        function goComponenteGrid() {
            $location.url('/administrativo/componente');
        };

        function goComponenteNew() {
            $location.url('/administrativo/componente/new');
        };

        function goUsuarioGrid() {
            $location.url('/administrativo/usuario');
        };

        function goUsuarioNew() {
            $location.url('/administrativo/usuario/new');
        };

        function goUsuarioAutorizacao() {
            $location.url('/administrativo/usuario/editAtivacao');
        };

        function goDependenciaGrid() {
            $location.url('/administrativo/dependencia');
        };

        function goDependenciaoNew() {
            $location.url('/administrativo/dependencia/new');
        };

        function goComponenteHistorico() {
            $location.url('/administrativo/componente/historico');
        };

        // Funções $scope END //

        // Funções BEGIN //

        function getNaoAutorizados() {
            usuarioService.countNaoAutorizados()
                .then(function (data) {
                    $scope.naoAutorizados = data;
                })
                .catch(showError);
        }

        // Funções END //

        getNaoAutorizados();
    });
}());