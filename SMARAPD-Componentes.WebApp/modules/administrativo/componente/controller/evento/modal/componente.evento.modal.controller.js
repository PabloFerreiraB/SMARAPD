/// <reference path="../componente.evento.view.controller.js" />
(function () {
    "use strict";

    angular.module('app').controller('componenteEventoModalController', appController);

    function appController($scope, eventoService, parametroEventoService, tipoService, messagesFactory, alertFactory, $uibModalInstance, idComponente, evento) {

        // Variável para verificar se é uma edição(post no service) ou um novo cadastro(push no array)

        var isEdit = idComponente && idComponente > 0;

        // Variáveis de $scope BEGIN

        if (evento) {
            $scope.title = "Edição de Evento";

            $scope.evento = evento;
        } else {
            $scope.title = "Inclusão de Evento";

            $scope.evento = {
                id: undefined,
                componenteId: idComponente,
                nome: undefined,
                descricao: undefined,
                exemplo: undefined,
                parametrosEvento: []
            };
        }        

        $scope.parametro = {
            eventoId: evento ? $scope.evento.id : undefined,
            nome: undefined,
            tipo: undefined,
            descricao: undefined,
            obrigatorio: undefined
        };

        $scope.editorOptions = {
            lineNumbers: true,
            mode: 'htmlmixed',
            onLoad: function (_editor) {
                exemploEvento.editor = _editor;

                setTimeout(function () {
                    exemploEvento.editor.refresh();
                }, 100);
            }
        };

        //Lista de eventos (diretiva de cards)

        $scope.configEvento = {
            data: [],
            actions: true,
            cardModal: true,
            edit: editarParametro,
            remove: deleteParametro,
            type: 'parametro'
        };

        // Variáveis de $scope END

        // Variáveis de Função $scope BEGIN

        $scope.adicionarEvento = adicionarEvento;
        $scope.editarEvento = editarEvento;
        $scope.adicionarParametro = adicionarParametro;
        $scope.editarParametro = editarParametro;
        $scope.deleteParametro = deleteParametro;
        $scope.closeModal = closeModal;

        // Variáveis de Função $scope END

        //Funções $scope BEGIN

        // Modal

        function closeModal() {
            $uibModalInstance.close(false);
        }

        // Evento
        function adicionarEvento(evento) {

            $scope.$broadcast('show-errors-check-validity');

            if ($scope.eventoForm.$invalid) return;

            if (isEdit) {
                if (evento.id) {
                    eventoService.update(evento.id, evento)
                        .then(function () {
                            alertFactory.success(messagesFactory.Common.ATUALIZADO_SUCESSO);
                            $uibModalInstance.close(true);
                        })
                        .catch(function (error) {
                            showError(error);
                            $uibModalInstance.close(false);
                        });
                } else {
                    eventoService.save(evento)
                        .then(function () {
                            alertFactory.success(messagesFactory.Common.CADASTRADO_SUCESSO);
                            $uibModalInstance.close(true);
                        })
                        .catch(function (error) {
                            showError(error);
                            $uibModalInstance.close(false);
                        });
                }

            } else {
                // se for uma inclusão, retorna o evento para o controller principal
                $uibModalInstance.close(evento);
            }
        }

        function editarEvento(evento) {
            $scope.evento = evento;
            getParametroByIdEvento(evento.id);
        };

        // Parâmetro
        function adicionarParametro(parametro) {

            if ($scope.parametroForm.$invalid) return;

            parametro.eventoId = $scope.evento.id;

            if (parametro.id) {
                parametroEventoService.update(parametro.id, parametro)
                    .then(function () {
                        getParametroByIdEvento(parametro.eventoId);
                    })
                    .catch(showError);
            } else {
                // se o evento já estiver cadastrado
                if (parametro.eventoId) {
                    parametroEventoService.save(parametro)
                        .then(function () {
                            getParametroByIdEvento(parametro.eventoId);
                        })
                        .catch(showError);
                } else {
                    $scope.evento.parametrosEvento.push(parametro);
                    // buscar um objeto baseado no id para ser renderizado corretamente no card
                    mapearTipoParametro();
                }
            }

            atualizarCardsEvento();

            limparParametro();
        };

        function mapearTipoParametro() {
            $scope.evento.parametrosEvento.map(function (parametro) {
                parametro.tipo = buscarTipo(parametro.tipoId);
            });
        }

        function buscarTipo(id) {
            let objetoTipo = {};

            $scope.tipos.filter(function (tipo) {
                if (tipo.id == id) {
                    objetoTipo = tipo;
                }
            });

            return objetoTipo;
        } 

        function atualizarCardsEvento() {
            $scope.configEvento.data = $scope.evento.parametrosEvento;
        }

        function limparParametro() {

            $scope.parametro = {
                nome: undefined,
                tipo: undefined,
                descricao: undefined,
                obrigatorio: undefined
            };

            $scope.parametroForm.$setPristine();
            $scope.parametroForm.$setUntouched();

        }

        function editarParametro(parametro) {
            popParametro(parametro);
            carregarTipos();
            $scope.parametro = parametro;
        }

        function deleteParametro(parametro) {
            if (parametro.id) {
                parametroEventoService.delete(parametro.id)
                    .then(function () {
                        getParametroByIdEvento($scope.evento.id);
                    })
                    .catch(showError);
            } else {
                popParametro(parametro);
            }
        }

        function popParametro(parametro) {
            $scope.evento.parametrosEvento.splice($scope.evento.parametrosEvento.indexOf(parametro), 1);
        }

        function getParametroByIdEvento(eventoId) {
            parametroEventoService.getByIdEvento(eventoId)
                .then(function (data) {
                    $scope.evento.parametrosEvento = data;
                    atualizarCardsEvento();
                })
                .catch(showError);
        }

        function carregarTipos() {
            tipoService.getTiposParametro()
                .then(function (data) {
                    $scope.tipos = data;
                    if ($scope.parametro.id)
                        $scope.parametro.tipoId = $scope.parametro.tipo.id;
                })
                .catch(showError);
        };

        function init() {
            carregarTipos();
            atualizarCardsEvento();
        };

        init();

        //Funções $scope END

        // Tooltip
        $(".form-control").ready(function () {
            $('[data-toggle="tooltip"]').tooltip();
        });

    }
}());