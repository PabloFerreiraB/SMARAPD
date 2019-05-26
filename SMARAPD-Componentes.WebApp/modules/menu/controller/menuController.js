angular.module("app").controller("menuController", function ($scope, $location, componenteService, $rootScope) {
    //$scope Variables BEGIN

    //Título da navbar superior. Propriedade acessada por todos os outros controllers
    $scope.title = "";

    //Propriedades utilizadas para definir qual menu exibir
    $scope.isVisitante = $rootScope.isVisitante;
    $scope.isSuperUser = $rootScope.isSuperUser;

    $scope.menuAdmin = [
         //Menu de gerenciamento de usuário
        {
            nome: 'Usuário',
            icone: 'fas fa-users',
            componentes: [
                { nome: 'Listar', url: '/administrativo/usuario' },
                { nome: 'Incluir', url: '/administrativo/usuario/new' },
                { nome: 'Autorizar', url: '/administrativo/usuario/editAtivacao' }
            ]
        },
        //Menu de gerenciamento de componentes
        {
            nome: 'Componente',
            icone: 'fas fa-cube',
            componentes: [
                { nome: 'Listar', url: '/administrativo/componente' },
                { nome: 'Incluir', url: '/administrativo/componente/new' },
                { nome: 'Histórico', url: '/administrativo/componente/historico' }   
            ]
        },
        //Menu de gerenciamento de categorias
        {
            nome: 'Categoria',
            icone: 'fas fa-tag',
            componentes: [
                { nome: 'Listar', url: '/administrativo/categoria' },
                { nome: 'Incluir', url: '/administrativo/categoria/new' },
            ]
        },
        //Menu de gerenciamento de dependencias
        {
            nome: 'Dependência',
            icone: 'fas fa-sitemap',
            componentes: [
                { nome: 'Listar', url: '/administrativo/dependencia' },
                { nome: 'Incluir', url: '/administrativo/dependencia/new' },
            ]
        }
    ];

    $scope.menu = [];
    $scope.busca = undefined;

    $scope.load = load;
    $scope.navigateToComponent = navigateToComponent;
    $scope.navigateToHome = navigateToHome;
    $scope.navigateToSection = navigateToSection;
    $scope.buscar = buscar;

    //Evento que verifica a mudança de rotas para carregar o menu correto
    $scope.$on('$routeChangeStart', function (event, nextRoute, current) {
        let route = $location.path();

        if (route.includes('administrativo')) {
            $scope.isSuperUser = true;
            $scope.isVisitante = false;
        } else {
            $scope.isSuperUser = false;
            $scope.isVisitante = true;
        }

    });
    //$scope Variables END
   
    load();

    //load
    function load() {
        getAll();
    }

    //Retorna todos os items do menu ao abrir a página
    function getAll() {
        componenteService.getComponenteMenu().then(function (response) {
            $scope.menu = angular.copy(response);

        }).catch(showError);
    }

    //Funções de navegação
    function navigateToSection(url){
        $location.url(url);
    }

    function navigateToComponent(id) {
        $location.url('/componente/' + id);
    }

    function navigateToHome() {
        $location.url('/home/');
    }

    function buscar() {
        $location.url('/home/buscar?buscar=' + angular.copy($scope.busca))
    }
});