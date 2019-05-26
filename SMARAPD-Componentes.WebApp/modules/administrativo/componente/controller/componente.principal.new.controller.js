angular.module('app').controller('componentePrincipalNewController', function ($scope, $uibModal, dialogService, categoriaService, tipoService, componenteService, $location, $route, messagesFactory, alertFactory, statusService, frameworkService, tagService, defaultImages) {

    // Variáveis de $scope BEGIN
    $scope.$parent.title = "Inclusão de Componente";
    $scope.vm = this;
    $scope.opcaoStatus = angular.copy(statusService.status);
    $scope.opcaoCategoria = [];
    $scope.opcaoFramework = [];
    $scope.defaultImage = defaultImages.componente;
    $scope.editorOptions = {
        lineNumbers: true,
        mode: 'htmlmixed'
    };
    $scope.componente = {
        parametros: [],
        eventos: [],
        metodos: [],
        dependencias: []
    };
    $scope.tipos = [];
    // Variáveis de $scope END


    // Variáveis de Função $scope BEGIN
    $scope.getCategorias = getCategorias();
    $scope.getFrameworks = getFrameworks();
    $scope.cancelar = cancelar;
    $scope.getTags = getTags;
    $scope.salvarComponente = salvarComponente;
    $scope.openModalParametro = openModalParametro;
    $scope.openModalMetodo = openModalMetodo;
    $scope.openModalEvento = openModalEvento;
    $scope.openModalDependencia = openModalDependencia;
    $scope.readFile = readFile;
    // Variáveis de Função $scope END


    //Funções $scope BEGIN
    function salvarComponente() {
        $scope.$broadcast('show-errors-check-validity');
        if ($scope.vm.componenteForm.$valid) {
            componenteService.save($scope.componente)
                .then(response => {
                    $route.reload();
                    alertFactory.success(messagesFactory.Common.CADASTRADO_SUCESSO);
                })
                .catch(showError)
        } else {
            $('#basico-tab').tab('show')
        }
    }

    function openfile(event) {
        var input = event.target;

        var reader = new FileReader();
        reader.onload = function () {
            var dataURL = reader.result;
            output.src = dataURL;
        };
        reader.readAsDataURL(input.files[0]);
        $scope.tempImage = input.files[0];
    };

    function cancelar() {
        $location.url('administrativo/componente')
    }

    $('#myTab a').on('click', function (e) {
        e.preventDefault();
        $(this).tab('show');
    });


    // Modals

    //Lista de parâmetros (diretiva de cards)
    $scope.configParametro = {
        data: [],
        searchBar: true,
        addButton: true,
        actions: true,
        edit: openModalParametro,
        add: openModalParametro,
        remove: deleteParametro,
        type: 'parametro'
    };

    // Parâmetros
    function openModalParametro(parametro) {
        var modalInstance = $uibModal.open({
            templateUrl: 'modules/administrativo/componente/view/parametro/modal/componente.parametro.modal.html',
            controller: 'componenteParametroModalController',
            size: 'lg',
            backdrop: 'static',
            resolve: {
                idComponente: function () {
                    return undefined;
                },
                parametro: function () {

                    // se é uma alteração, remove do array para depois adicionar novamente
                    if (parametro) {
                        popParametro(parametro);
                    }
                    return parametro;
                }
            }
        });

        modalInstance.result
            .then(function (result) {
                if (result) {
                    $scope.componente.parametros.push(result);

                    if (parametro) {
                        alertFactory.success(messagesFactory.Common.ATUALIZADO_SUCESSO);
                    } else {
                        alertFactory.success(messagesFactory.Common.CADASTRADO_SUCESSO);
                    }

                    atualizarCardsParametro();
                } else {
                    // caso cancelar a operação no modal, adicionar novamente o parametro antigo
                    $scope.componente.parametros.push(parametro);
                }
            })
    };

    function deleteParametro(parametro) {
        dialogService.confirmDelete()
            .then(function (accept) {
                if (accept) {
                    popParametro(parametro);
                    alertFactory.success(messagesFactory.Common.EXCLUIDO_SUCESSO);
                }
            });
    }

    function atualizarCardsParametro() {
        // o retorno do modal é um tipoId, buscar então um objeto baseado no id para ser renderizado corretamente no card 
        mapearTipoParametro();
        $scope.configParametro.data = $scope.componente.parametros;
    }

    function mapearTipoParametro() {
        $scope.componente.parametros.map(function (parametro) {
            parametro.tipo = buscarTipo(parametro.tipoId);
        });
    }


    function popParametro(parametro) {
        $scope.componente.parametros.splice($scope.componente.parametros.indexOf(parametro), 1);
    }

    // Método

    //Lista de métodos (diretiva de cards)
    $scope.configMetodo = {
        data: [],
        searchBar: true,
        addButton: true,
        actions: true,
        edit: openModalMetodo,
        add: openModalMetodo,
        remove: deleteMetodo,
        type: 'metodo'
    };

    function openModalMetodo(metodo) {
        var modalInstance = $uibModal.open({
            templateUrl: 'modules/administrativo/componente/view/metodo/modal/componente.metodo.modal.html',
            controller: 'componenteMetodoModalController',
            size: 'lg',
            backdrop: 'static',
            resolve: {
                idComponente: function () {
                    return undefined;
                },
                metodo: function () {

                    // se é uma alteração, remove do array para depois adicionar novamente
                    if (metodo) {
                        popMetodo(metodo);
                    }

                    return metodo;
                }
            }
        });

        modalInstance.result
            .then(function (result) {
                if (result) {

                    $scope.componente.metodos.push(result);

                    if (metodo) {
                        alertFactory.success(messagesFactory.Common.ATUALIZADO_SUCESSO);
                    } else {
                        alertFactory.success(messagesFactory.Common.CADASTRADO_SUCESSO);
                    }

                    atualizarCardsMetodo();
                } else {
                    // caso cancelar a operação no modal, adicionar novamente o metodo antigo
                    $scope.componente.metodos.push(metodo);
                }
            })
    };

    function deleteMetodo(metodo) {
        dialogService.confirmDelete()
            .then(function (accept) {
                if (accept) {
                    popMetodo(metodo);
                    alertFactory.success(messagesFactory.Common.EXCLUIDO_SUCESSO);
                }
            });
    }

    function atualizarCardsMetodo() {
        // o retorno do modal é um idTipoRetorno, buscar então um objeto baseado no id para ser renderizado corretamente no card
        mapearTipoMetodo();
        $scope.configMetodo.data = $scope.componente.metodos;
    }

    function mapearTipoMetodo() {
        $scope.componente.metodos.map(function (metodo) {
            let retorno = buscarTipo(metodo.idTipoRetorno);

            metodo.retorno = retorno.nome;
        });
    }

    function popMetodo(metodo) {
        $scope.componente.metodos.splice($scope.componente.metodos.indexOf(metodo), 1);
    }

    // Evento

    //Lista de eventos (diretiva de cards)

    $scope.configEvento = {
        data: [],
        searchBar: true,
        addButton: true,
        actions: true,
        edit: openModalEvento,
        add: openModalEvento,
        remove: deleteEvento,
        type: 'evento'
    };

    function openModalEvento(evento) {
        var modalInstance = $uibModal.open({
            templateUrl: 'modules/administrativo/componente/view/evento/modal/componente.evento.modal.html',
            controller: 'componenteEventoModalController',
            size: 'lg',
            backdrop: 'static',
            resolve: {
                idComponente: function () {
                    return undefined;
                },
                evento: function () {

                    if (evento) {
                        popEvento(evento);
                    }

                    return evento;
                }
            }
        });

        modalInstance.result
            .then(function (result) {
                if (result) {

                    $scope.componente.eventos.push(result);

                    if (evento) {
                        alertFactory.success(messagesFactory.Common.ATUALIZADO_SUCESSO);
                    } else {
                        alertFactory.success(messagesFactory.Common.CADASTRADO_SUCESSO);
                    }

                    atualizarCardsEvento();
                } else {
                    // caso cancelar a operação no modal, adicionar novamente o evento antigo
                    $scope.componente.eventos.push(evento);
                }
            })
    };

    function deleteEvento(evento) {
        dialogService.confirmDelete()
            .then(function (accept) {
                if (accept) {
                    popEvento(evento);
                    alertFactory.success(messagesFactory.Common.EXCLUIDO_SUCESSO);
                }
            });
    }

    function atualizarCardsEvento() {
        $scope.configEvento.data = $scope.componente.eventos;
    }

    function popEvento(evento) {
        $scope.componente.eventos.splice($scope.componente.eventos.indexOf(evento), 1);
    }

    function getCategorias() {
        categoriaService.getAll()
            .then(response => {
                $scope.opcaoCategoria = angular.copy(response);
            })
            .catch(error => {
                showError(error);
                $location.url('administrativo/componente')
            })
    }

    function readFile(selectedFile) {
        const reader = new FileReader();
        const regex = new RegExp(",");

        reader.onloadend = function () {
            let string64 = reader.result;
            //let indiceRegex = regex.exec(string64);
            $scope.componente.imagem = string64;//.slice(++indiceRegex.index, -1);
        }

        reader.readAsDataURL(selectedFile);
    };

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



    // Dependencia

    //Lista de dependência (diretiva de cards)

    $scope.configDependencia = {
        data: [],
        searchBar: true,
        addButton: true,
        actions: true,
        add: openModalDependencia,
        remove: deleteDependencia,
        type: 'dependencia'
    };


    function openModalDependencia(dependencia) {

        var modalInstance = $uibModal.open({
            templateUrl: 'modules/administrativo/componente/view/dependencia/modal/componente.dependencia.modal.html',
            controller: 'componenteDependenciaModalController',
            size: 'lg',
            backdrop: 'static',
            resolve: {
                idComponente: function () {
                    return undefined;
                },
                dependencia: function () {

                    // se é uma alteração, remove do array para depois adicionar novamente
                    if (dependencia) {
                        popDependencia(dependencia);
                    }

                    return dependencia;
                }
            }
        });

        modalInstance.result
            .then(function (result) {
                if (result) {

                    $scope.componente.dependencias.push(result);

                    if (dependencia) {
                        alertFactory.success(messagesFactory.Common.ATUALIZADO_SUCESSO);
                    }
                    else {
                        alertFactory.success(messagesFactory.Common.CADASTRADO_SUCESSO);
                    }

                    atualizarCardsDependencia();
                } else {
                    // caso cancelar a operação no modal, adicionar novamente a dependencia antiga
                    $scope.componente.dependencias.push(dependencia);
                }
            })
    };

    function deleteDependencia(dependencia) {
        dialogService.confirmDelete()
            .then(function (accept) {
                if (accept) {
                    popDependencia(dependencia);
                    alertFactory.success(messagesFactory.Common.EXCLUIDO_SUCESSO);
                }
            });
    }

    function atualizarCardsDependencia() {
        $scope.configDependencia.data = $scope.componente.dependencias;
    }

    function popDependencia(dependencia) {
        $scope.componente.dependencias.splice($scope.componente.dependencias.indexOf(dependencia), 1);
    }

    function carregarTipos() {
        tipoService.getTiposRetorno()
            .then(function (data) {
                $scope.tipos = data;
            })
            .catch(showError);
    };

    function buscarTipo(id) {
        let objetoTipo = {};

        $scope.tipos.filter(function (tipo) {
            if (tipo.id == id) {
                objetoTipo = tipo;
            }
        });

        return objetoTipo;
    }   

    carregarTipos();

    //Funções $scope END

});
