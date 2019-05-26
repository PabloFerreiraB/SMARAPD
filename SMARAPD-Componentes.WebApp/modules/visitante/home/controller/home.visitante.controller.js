angular.module('app').controller('homeVisitanteController', function ($scope, $route, $routeParams, tagService, categoriaService, componenteService, alertFactory, messagesFactory, $location) {
    // Variáveis $scope BEGIN //
    $scope.buscaAvancada = false;
    $scope.mostraResultado = false;
    // Variáveis $scope END //

    // Funções $scope BEGIN //
    $scope.getTags = getTags;
    $scope.setBusca = setBusca;
    $scope.limpar = limpar;
    $scope.pesquisa = pesquisa;
    $scope.pesquisaCategoria = pesquisaCategoria;
    $scope.NavigateToComponente = NavigateToComponente;
    $scope.NavigateToComponenteTab = NavigateToComponenteTab;
    // Funções $scope END //


    // Titulo//
    $scope.$parent.title = "Home";


    // Objetos BEGIN // 
    $scope.busca = {
        Pesquisa: undefined,
        Parametro: undefined,
        Metodo: undefined,
        Evento: undefined,
        Categoria: undefined,
        Tags: [],
        IdCategoria: undefined,
        BuscaPadrao: false,
        BuscaPorCategoria: false,
        Avancada: undefined
    };
    // Objetos END // 


    // Pesquisa Session //
    let sessionKey = "SMARAPD-Componente.Visitante.Busca";

    // Arrays BEGIN //
    $scope.categorias = [];
    $scope.resultadoBuscaPadrao = [];
    $scope.resultadoBuscaPorCategoria = [];
    // Arrays END //

    // Loads BEGIN // 
    getAllCategorias();
    load();
    // Loads BEGIN // 

    // Functions //
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

    function setBusca() {
        if (!$scope.buscaAvancada) {
            $scope.buscaAvancada = true;

        }
        else {
            $scope.buscaAvancada = false;
            $scope.busca = {
                Pesquisa: $scope.busca.Pesquisa ? $scope.busca.Pesquisa : undefined,
                Parametro: undefined,
                Metodo: undefined,
                Evento: undefined,
                Tags: []
            };
            $scope.buscaTag = undefined;

            $scope.buscaForm.$setPristine();
            $scope.buscaForm.$setUntouched();
        }
    }

    function limpar() {
        
        sessionStorage.removeItem(sessionKey);
        $scope.mostraResultado = false;
        $scope.busca = {
            Pesquisa: undefined,
            Parametro: undefined,
            Metodo: undefined,
            Evento: undefined,
            Tags: []
        };

        $scope.buscaForm.tags.$setValidity("leftoverText", true);
        $scope.text = null;

        $scope.resultadoBuscaPadrao = [];
        $scope.resultadoBuscaPorCategoria = [];  

        $scope.buscaForm.$setPristine();
        $scope.buscaForm.$setUntouched();

        $location.url('/home');
    };

    function getAllCategorias() {
        categoriaService.getAllHasComponente()
            .then(function (response) {
                $scope.categorias = angular.copy(response);

            }).catch(showError);
    }

    function pesquisa() {  
        var objBusca = angular.copy($scope.busca);

        objBusca.BuscaPorCategoria = false;
        objBusca.BuscaPadrao = true;

        componenteService.pesquisa(objBusca)
            .then(function (response) {
                $scope.resultadoBuscaPadrao = angular.copy(response);

                if ($scope.resultadoBuscaPadrao.length > 0) {
                    if ($scope.buscaAvancada) {
                        $scope.busca.Avancada = true;
                    }
                    sessionStorage.setItem(sessionKey, JSON.stringify($scope.busca));
                    $scope.mostraResultado = true;
                } else {
                    alertFactory.warning(messagesFactory.Common.NAO_ENCONTRADO);
                }


            }).catch(showError);
    }

    function pesquisaCategoria(id) {

        $scope.mostraResultado = true;
        var objBusca = angular.copy($scope.busca);

        objBusca.IdCategoria = id;
        objBusca.BuscaPadrao = false;
        objBusca.BuscaPorCategoria = true;

        componenteService.pesquisa(objBusca).then(function (response) {
            $scope.resultadoBuscaPorCategoria = angular.copy(response);
        }).catch(showError);
    }

    function load() {
        $scope.$parent.load();

        if ($routeParams.buscar) {
            $scope.busca.Pesquisa = $routeParams.buscar;
            $scope.$parent.busca = undefined;
            pesquisa();
        }

        if (sessionStorage.getItem(sessionKey)) {
            $scope.busca = JSON.parse(sessionStorage.getItem(sessionKey));
            if ($scope.busca.Avancada) {
                $scope.buscaAvancada = true;
            }
            $scope.busca.Avancada = undefined;
            pesquisa();
        }        
    }

    function NavigateToComponente(id) {
        $location.url('/componente/' + id);
    }

    function NavigateToComponenteTab(id, tab) {
        $location.url('/componente/' + id + '/' + tab);
    }
});