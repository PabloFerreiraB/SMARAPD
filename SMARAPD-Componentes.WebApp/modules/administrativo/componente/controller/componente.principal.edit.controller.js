angular.module('app').controller('componentePrincipalEditController', function ($scope, $uibModal, dialogService, categoriaService, componenteService, $location, $route, messagesFactory, alertFactory, statusService, frameworkService, tagService, $routeParams, defaultImages) {

    // Variáveis de $scope BEGIN
    $scope.$parent.title = "Edição de Componente";
    $scope.componente = {};
    $scope.vm = this;
    $scope.componente.imagem = undefined;
    $scope.opcaoStatus = angular.copy(statusService.status);
    $scope.opcaoCategoria = [];
    $scope.opcaoFramework = [];
    $scope.defaultImage = defaultImages.componente;
    $scope.editorOptions = {
        lineNumbers: true,
        mode: 'htmlmixed'
    };
    // Variáveis de $scope END


    // Variáveis de Função $scope BEGIN
    $scope.getCategorias = getCategorias();
    $scope.getFrameworks = getFrameworks();
    $scope.getComponente = getComponente();
    $scope.getTags = getTags;
    $scope.cancelar = cancelar;
    $scope.readFile = readFile;
    $scope.salvarComponente = salvarComponente;
    // Variáveis de Função $scope END


    //Funções $scope BEGIN
    function getCategorias() {
        categoriaService.getAll()
            .then(response => {
                $scope.opcaoCategoria = angular.copy(response);
            })
            .catch(erro => {
                showError(error);
                $location.url('administrativo/componente')
            })
    }

    function getFrameworks() {
        frameworkService.getAll()
            .then(response => {
                $scope.opcaoFramework = angular.copy(response);
            })
            .catch(error => {
                showError(error);
                $location.url('administrativo/componente')
            })
    }

    function getTags($query) {
        return tagService.getAll().then(function (response) {
            $scope.opcaoTags = angular.copy(response);
            if ($query) {
                return response.filter(item => {
                    return item.nome.toLowerCase().indexOf($query.toLowerCase()) != -1;
                });
            }
        });
    }

    function getComponente() {
        componenteService.getById($routeParams.id)
            .then(response => {
                $scope.componente = angular.copy(response);
      
            })
            .catch(error => {
                showError(error);
                $location.url('administrativo/componente')
            })
    }

    function readFile(selectedFile) {
        const reader = new FileReader();

        reader.onloadend = function () {
            let string64 = reader.result;
            $scope.componente.imagemPut = string64;
        }

        reader.readAsDataURL(selectedFile);
    };

    function salvarComponente() {
        $scope.$broadcast('show-errors-check-validity');
        if ($scope.vm.componenteForm.$valid) {
            componenteService.update($scope.componente)
                .then(response => {
                    $location.url('administrativo/componente')
                    alertFactory.success(messagesFactory.Common.ATUALIZADO_SUCESSO);
                })
                .catch(error => {
                    showError(error);
                    $location.url('administrativo/componente')
                })
        } else {
            $('#basico-tab').tab('show')
        }
    }

    function cancelar() {
        $location.url('administrativo/componente')
    }
    //Funções $scope END

    $('#myTab a').on('click', function (e) {
        e.preventDefault()
        $(this).tab('show')
    });
});