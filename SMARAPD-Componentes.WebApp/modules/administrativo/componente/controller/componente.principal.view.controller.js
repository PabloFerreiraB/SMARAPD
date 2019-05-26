angular.module('app').controller('componentePrincipalViewController', function ($scope, $location, $routeParams, componenteService, $uibModal, defaultImages) {
    // Variáveis de $scope BEGIN
    $scope.$parent.title = "Visualização de Componente";
    $scope.editorOptions = {
        lineNumbers: true,
        mode: 'htmlmixed',
        readOnly: 'nocursor'
    };
    $scope.componente = {};
    $scope.tagString = [];
    $scope.defaultImage = defaultImages.componente;

    // Variáveis de $scope END

    // Variáveis de Função $scope BEGIN

    $scope.getComponente = getComponente();
    $scope.voltar = voltar;

    // Variáveis de Função $scope END

    //Funções $scope BEGIN
    function voltar() {
        $location.url('/administrativo/componente');
    };

    function getComponente() {
        componenteService.getByIdView($routeParams.id)
            .then(response => {
                $scope.componente = angular.copy(response);
                $scope.componente.tags.forEach(tag => {
                    $scope.tagString.push(tag.nome);
                });
                $scope.tagString = $scope.tagString.toString();
                carregarCards();
            })
            .catch(showError);
    };

    function carregarCards() {
        carregarCardsParametro();
        carregarCardsMetodo();
        carregarCardsEvento();
        carregarCardsDependencia();

    }
    function carregarCardsParametro() {
        $scope.configParametro.data = $scope.componente.parametros;
    }

    function carregarCardsMetodo() {
        $scope.configMetodo.data = $scope.componente.metodos;
    }

    function carregarCardsEvento() {
        $scope.configEvento.data = $scope.componente.eventos;
    }

    function carregarCardsDependencia() {
        $scope.configDependencia.data = $scope.componente.dependencias;
    }

    function carregarModalViewParametro(parametro) {
        var modalInstance = $uibModal.open({
            templateUrl: 'modules/administrativo/componente/view/parametro/modal/componente.parametro.modal.view.html',
            controller: 'componenteParametroModalViewController',
            size: 'lg',
            backdrop: 'static',
            resolve: {
                idComponente: function () {
                    return undefined;
                },
                parametro: function () {
                    return parametro;
                }
            }

        });
    };

    function carregarModalViewMetodo(metodo) {
        var modalInstance = $uibModal.open({
            templateUrl: 'modules/administrativo/componente/view/metodo/modal/componente.metodo.modal.view.html',
            controller: 'componenteMetodoModalViewController',
            size: 'lg',
            backdrop: 'static',
            resolve: {
                idComponente: function () {
                    return undefined;
                },
                metodo: function () {
                    return metodo;
                }
            }

        });
    };

    function carregarModalViewEvento(evento) {
        var modalInstance = $uibModal.open({
            templateUrl: 'modules/administrativo/componente/view/evento/modal/componente.evento.modal.view.html',
            controller: 'componenteEventoModalViewController',
            size: 'lg',
            backdrop: 'static',
            resolve: {
                idComponente: function () {
                    return undefined;
                },
                evento: function () {
                    return evento;
                }
            }

        });
    };


    function carregarModalViewDependencia(dependencia) {
        var modalInstance = $uibModal.open({
            templateUrl: 'modules/administrativo/componente/view/dependencia/modal/componente.dependencia.modal.view.html',
            controller: 'componenteDependenciaModalViewController',
            size: 'lg',
            backdrop: 'static',
            resolve: {
                idComponente: function () {
                    return undefined;
                },
                dependencia: function () {
                    return dependencia;
                }
            }

        });
    };


    //Lista de parâmetros
    $scope.configParametro = {
        data: [],
        searchBar: true,
        mesageEmpty: 'Este componente não possui parâmetros.',
        cardOnClick: carregarModalViewParametro,
        type: 'parametro',
        pointer: true
    };

    //Lista de Eventos
    $scope.configEvento = {
        data: [],
        searchBar: true,
        mesageEmpty: 'Este componente não possui eventos.',
        cardOnClick: carregarModalViewEvento,
        type: 'evento',
        pointer: true
    };

    //Lista de Métodos
    $scope.configMetodo = {
        data: [],
        searchBar: true,
        mesageEmpty: 'Este componente não possui métodos.',
        cardOnClick: carregarModalViewMetodo,
        type: 'metodo',
        pointer: true
    };

    //Lista de Dependência
    $scope.configDependencia = {
        data: [],
        searchBar: true,
        mesageEmpty: 'Este componente não possui dependências.',
        cardOnClick: carregarModalViewDependencia,
        type: 'dependencia',
        pointer: true
    };

    //Funções $scope END

    $('#myTab a').on('click', function (e) {
        e.preventDefault()
        $(this).tab('show')
    });

    //fixme
    function init() {
        getComponente();
    }

    init();

});