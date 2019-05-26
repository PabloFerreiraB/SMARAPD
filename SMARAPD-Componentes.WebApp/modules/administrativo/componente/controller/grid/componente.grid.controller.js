angular.module('app').controller('componenteGridController', function ($scope, $location, componenteService, dialogService, alertFactory, messagesFactory, $route) {
    // Variáveis de $scope BEGIN
    $scope.$parent.title = "Busca de Componente";
    $scope.usuario = 'teste';
    $scope.gridConfig = {
        name: 'Administrativo.Componente',
        buttons: [
            {
                description: 'Adicionar', action: function (data) {
                    $location.url('administrativo/componente/new')
                }
            }
        ],
        columns: [
            { label: 'Nome', value: 'nome', size: 2, maxLength: 15 },
            { label: 'Autor', value: 'autor', size: 2, maxLength: 6 },
            { label: 'Framework', value: 'frameworkIcone', size: 2, maxLength: 20, isIcon:true },
            { label: 'Status', value: 'status', size: 2, maxLength: 10 },
            { label: 'Publicado', value: 'publicado', size: 2, maxLength: 4 },
        ],
        actions: [
            {
                description: 'Visualizar', icon: 'far fa-eye',
                action: function (data) {
                    $location.url("/administrativo/componente/view/" + data.id);
                }
            },
            {
                description: 'Editar', icon: 'far fa-edit',
                action: function (data) {
                    $location.url("/administrativo/componente/edit/" + data.id);
                }
            },
            {
                description: 'Remover', icon: 'far fa-trash-alt',
                action: function (data) {
                    dialogService.confirmDelete()
                        .then(function (accept) {
                            if (accept) {
                                componenteService.delete(data.id)
                                    .then(function () {
                                        alertFactory.success(messagesFactory.Common.EXCLUIDO_SUCESSO);
                                        $route.reload();
                                    })
                                    .catch(function () {
                                        alertFactory.danger(messagesFactory.Common.ERRO_EXCLUSAO);
                                    });
                            }
                        });
                }
            }
        ],
        getData: function () {
            return componenteService.getAllGrid();
        }
    };
    // Variáveis de $scope END
    // Variáveis de Função $scope BEGIN
    // Variáveis de Função $scope END
    //Funções $scope BEGIN
    //Funções $scope END

});