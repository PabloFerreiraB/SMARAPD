(function () {
    "use strict";
    angular.module('app').controller('componenteDependenciaModalController', appController);

    function appController($scope, $uibModalInstance, alertFactory, messagesFactory, dependenciaService, idComponente, dependencia) {

        // Variável para verificar se é uma edição(post no service) ou um novo cadastro(push no array)
        var isEdit = idComponente && idComponente > 0;

        // Variáveis de $scope BEGIN.

        $scope.searchStr = undefined;

        $scope.config = {
            data: [],
            quantidadeItens: 3,
            fieldValue: 'nome',
            selectedObject: function (data) {
                $scope.dependencia = data;
                addDependencia($scope.dependencia)
            },
            objeto: $scope.dependencia,
            teste: false,
            isObject: true
        }


        $scope.status = [{
            nome: 'Depreciado',
            value: 'Depreciado'
        },
        {
            nome: 'Ativo',
            value: 'Ativo'
        },
        {
            nome: 'Desativado',
            value: 'Desativado'
        }
        ];


        if (dependencia) {
            $scope.title = "Edição de Dependência";

        } else {
            $scope.title = "Inclusão de Dependência";

            $scope.dependencia = {
                id: undefined,
                nome: undefined,
                versao: undefined,
                status: undefined,
                url: undefined
            };
        }
        // Variáveis de $scope END


        // Variáveis de Função $scope BEGIN

        $scope.save = save;
        $scope.fecharModal = fecharModal;
        $scope.addDependencia = addDependencia;

        // Variáveis de Função $scope END


        //Funções $scope BEGIN


        function addDependencia(dependencia) {
            if (isEdit) {
                dependenciaService.associar({ DependenciaId: dependencia.id, ComponenteId: idComponente })
                    .then(function () {
                        alertFactory.success(messagesFactory.Common.CADASTRADO_SUCESSO);
                        $uibModalInstance.close(true);
                    })
                    .catch(showError);
            } else {
                // se for uma inclusão, retorna o dependencia para o controller principal
                $uibModalInstance.close(dependencia);
            }
        };


        function update(dependencia) {
            componenteDependenciaService.update(dependencia.id, dependencia)
                .then(function () {
                    alertFactory.success(messagesFactory.Common.ATUALIZADO_SUCESSO);
                    $uibModalInstance.close(true);
                })
                .catch(showError);
        };


        function save(dependencia) {
            $scope.$broadcast('show-errors-check-validity');

            if ($scope.dependenciaEditForm.$invalid) return;

            if (dependencia.id)
                update(dependencia);
            else
                addDependencia(dependencia);
        };


        function fecharModal() {
            $uibModalInstance.close(false);
        };


        function getDependencia() {
            dependenciaService.getAll()
                .then(function (dados) {
                    $scope.config.data = angular.copy(dados).map(function (item) {
                        return {
                            data: item,
                        }
                    });

                })
                .catch(showError)
        }

        getDependencia();

        //Funções $scope END
    }
}());