angular.module('app')
    .controller('componenteController', function ($scope, $routeParams, componenteService, $uibModal) {

        $scope.error = false;
        $scope.errorMesage = undefined;
        $scope.componente = undefined;
        $scope.busca = undefined;
        $scope.voltar = voltar;

        //Configuração do CodeMirror      
        $scope.editorOptions = {
            lineNumbers: true,
            mode: 'htmlmixed',
            readOnly: true,
            onLoad: function (_editor) {
                exemplo.editor = _editor;

                setTimeout(function () {
                    exemplo.editor.refresh();
                }, 100);
            }
        };

        //JQuery responsavel pela navegação das Tabs
        $('#myTab a').on('click', function (e) {
            e.preventDefault()
            $(this).tab('show')
        });

        function voltar() {
            window.history.back();
        };

        //Popula as tabs com os vetores de Parametros, Eventos e Métodos

        //Lista de parâmetros
        $scope.configParametro = {
            data: [],
            mesageEmpty: 'Este componente não possui parâmetros.',
            searchBar: true,
            cardOnClick: carregarModalViewParametro,
            type: 'parametro',
            pointer: true
        };

        //Lista de Eventos
        $scope.configEvento = {
            data: [],
            mesageEmpty: 'Este componente não possui eventos.',
            searchBar: true,
            cardOnClick: carregarModalViewEvento,
            type: 'evento',
            pointer: true
        };

        //Lista de Métodos
        $scope.configMetodo = {
            data: [],
            mesageEmpty: 'Este componente não possui métodos.',
            searchBar: true,
            cardOnClick: carregarModalViewMetodo,
            type: 'metodo',
            pointer: true
        };

        //Load
        load();

        //Functions
        function load() {
            componenteService.getByIdView($routeParams.id)
                .then(function (response) {
                    $scope.componente = response;
                    $scope.$parent.title = $scope.componente.nome;

                    if (!$scope.componente) {
                        $scope.$parent.title = "Componente não encontrado";
                        $scope.error = true;
                    } else {
                        $scope.configParametro.data = $scope.componente.parametros;
                        $scope.configEvento.data = $scope.componente.eventos;
                        $scope.configMetodo.data = $scope.componente.metodos;
                    }
                    if ($routeParams.tab) {
                        $('#myTab a[href="#' + $routeParams.tab + '"]').tab('show');
                    }
                }).catch(function (error) {
                    $scope.$parent.title = "Ocorreu um erro";
                    $scope.error = true;
                });
        }


        $scope.toggleModal = function () {

            var modalImg = $('#img01');

            modalImg[0].style.display = "block";
            modalImg[0].src = $scope.componente.urlImagem;

            $('#imgModal').modal('toggle');
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

    });