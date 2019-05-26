(function () {
    "use strict";
    angular.module('app').controller('componenteParametroModalController', appController);

    function appController($scope, $uibModalInstance, alertFactory, messagesFactory, parametroService, tipoService, idComponente, parametro) {

        // Variável para verificar se é uma edição(post no service) ou um novo cadastro(push no array)
        var isEdit = idComponente && idComponente > 0;

        // Variáveis de $scope BEGIN
        $scope.tipos = [];

        if (parametro) {
            $scope.title = "Edição de Parâmetro";

            $scope.parametro = parametro;
        } else {
            $scope.title = "Inclusão de Parâmetro";

            $scope.parametro = {
                id: undefined,
                nome: undefined,
                descricao: undefined,
                tipoId: undefined,
                obrigatorio: undefined
            };
        }
        // Variáveis de $scope END


        // Variáveis de Função $scope BEGIN
        
        $scope.salvarParametro = salvarParametro;
        $scope.fecharModal = fecharModal;
        // Variáveis de Função $scope END


        //Funções $scope BEGIN
        function addParametro(parametro) {
            if (isEdit) {
                parametro.componenteId = idComponente;
                parametroService.save(parametro)
                    .then(function () {
                        alertFactory.success(messagesFactory.Common.CADASTRADO_SUCESSO);
                        $uibModalInstance.close(true);
                    })
                    .catch(showError);
            } else {
                // se for uma inclusão, retorna o parâmetro para o controller principal
                $uibModalInstance.close(parametro);
            }
        };

        function updateParametro(parametro) {
            parametroService.update(parametro.id, parametro)
                .then(function () {
                    alertFactory.success(messagesFactory.Common.ATUALIZADO_SUCESSO);
                    $uibModalInstance.close(true);
                })
                .catch(showError);
        };

        function salvarParametro(parametro) {
            $scope.$broadcast('show-errors-check-validity');

            if ($scope.parametroEditForm.$invalid) return;

            if (parametro.id)
                updateParametro(parametro);
            else
                addParametro(parametro);
        };

        function fecharModal() {
            $uibModalInstance.close(false);
        };

        function carregarTipos() {
            tipoService.getTiposParametro()
            .then(function (data) {
                $scope.tipos = data;
                if ($scope.parametro.tipo) {
                    $scope.parametro.tipoId = $scope.parametro.tipo.id;
                }
            })
            .catch(showError);
        };

        function init() {
            carregarTipos();
        };

        init();

        //Funções $scope END

        // Tooltip
        $(".form-control").ready(function () {
            $('[data-toggle="tooltip"]').tooltip();
        });
    }
}());