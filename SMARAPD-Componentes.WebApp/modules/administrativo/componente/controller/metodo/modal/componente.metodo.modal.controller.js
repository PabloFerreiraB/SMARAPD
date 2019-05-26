(function () {
    "use strict";
    angular.module('app').controller('componenteMetodoModalController', appController);

    function appController($scope, metodoService, parametroMetodoService, tipoService, messagesFactory, alertFactory, $uibModalInstance, idComponente, metodo) {

        // Variável para verificar se é uma edição(post no service) ou um novo cadastro(push no array)
        var isEdit = idComponente && idComponente > 0;

        // Variáveis de $scope BEGIN
        if (metodo) {
            $scope.title = "Edição de Método";

            $scope.metodo = metodo
        } else {
            $scope.title = "Inclusão de Método";

            $scope.metodo = {
                id: undefined,
                componenteId: idComponente,
                nome: undefined,
                descricao: undefined,
                idTipoRetorno: undefined,
                exemplo: undefined,
                parametrosMetodo: []
            };
        }

        $scope.parametro = {
            metodoId: metodo ? $scope.metodo.id : undefined,
            nome: undefined,
            tipo: undefined,
            descricao: undefined,
            obrigatorio: undefined
        };

        $scope.editorOptions = {
            lineNumbers: true,
            mode: 'javascript',
            onLoad: function (_editor) {
                exemploMetodo.editor = _editor;

                setTimeout(function () {
                    exemploMetodo.editor.refresh();
                }, 100);
            }
        };

        //Lista de eventos (diretiva de cards)
        $scope.configMetodo = {
            data: [],
            actions: true,
            cardModal: true,
            edit: editarParametro,
            remove: deleteParametro,
            type: 'parametro'
        };

        // Variáveis de $scope END


        // Variáveis de Função $scope BEGIN
        $scope.adicionarMetodo = adicionarMetodo;
        $scope.editarMetodo = editarMetodo;
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

        // Método
        function adicionarMetodo(metodo) {
            $scope.$broadcast('show-errors-check-validity');

            if ($scope.metodoForm.$invalid) return;

            if (isEdit) {
                if (metodo.id) {
                    metodoService.update(metodo.id, metodo)
                        .then(function () {
                            alertFactory.success(messagesFactory.Common.ATUALIZADO_SUCESSO);
                            $uibModalInstance.close(true);
                        })
                        .catch(function (error) {
                            showError(error);
                            $uibModalInstance.close(false);
                        });
                } else {
                    metodoService.save(metodo)
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
                // se for uma inclusão, retorna o método para o controller principal
                $uibModalInstance.close(metodo);
            }

        }

        function editarMetodo(metodo) {
            $scope.metodo = metodo;
            getParametroByIdMetodo(metodo.id);
        };

        // Parâmetro
        function adicionarParametro(parametro) {

            if ($scope.parametroForm.$invalid) return;

            parametro.metodoId = $scope.metodo.id;

            if (parametro.id) {
                parametroMetodoService.update(parametro.id, parametro)
                    .then(function () {
                        getParametroByIdMetodo(parametro.metodoId);
                        
                    })
                    .catch(showError);
			} else {
				// se o método já estiver cadastrado
				if (parametro.metodoId) {
					parametroMetodoService.save(parametro)
                        .then(function () {
                            getParametroByIdMetodo(parametro.metodoId);
                        })
                        .catch(showError);
				} else {
                    $scope.metodo.parametrosMetodo.push(parametro);
                    // buscar um objeto baseado no id para ser renderizado corretamente no card
                    mapearTipoParametro();
				}
            }

            atualizarCardsMetodo();

            limparParametro();
        };

        function mapearTipoParametro() {
            $scope.metodo.parametrosMetodo.map(function (parametro) {
                parametro.tipo = buscarTipo(parametro.tipoId);
            });
        }

        function buscarTipo(id) {
            let objetoTipo = {};

            $scope.tiposParametro.filter(function (tipo) {
                if (tipo.id == id) {
                    objetoTipo = tipo;
                }
            });

            return objetoTipo;
        } 

        function atualizarCardsMetodo() {
            $scope.configMetodo.data = $scope.metodo.parametrosMetodo;
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
            $scope.parametro.tipoId = parametro.tipo.id;
        }

        function deleteParametro(parametro) {
            if (parametro.id) {
                parametroMetodoService.delete(parametro.id)
                    .then(function () {
                        getParametroByIdMetodo($scope.metodo.id);
                    })
                    .catch(showError);
			} else {
                popParametro(parametro);
			}
        }

        function popParametro(parametro) {
            $scope.metodo.parametrosMetodo.splice($scope.metodo.parametrosMetodo.indexOf(parametro), 1);
        }

        function getParametroByIdMetodo(metodoId) {
            parametroMetodoService.getByIdMetodo(metodoId)
                .then(function (data) {
                    $scope.metodo.parametrosMetodo = data;
                    atualizarCardsMetodo();
                })
                .catch(showError);
		}

        function carregarTipos() {

            tipoService.getTiposRetorno()
                .then(function (data) {
                    $scope.tiposMetodo = data;
                })
                .catch(showError);

            tipoService.getTiposParametro()
                .then(function (data) {
                    $scope.tiposParametro = data;
                })
                .catch(showError);
        };

        function init() {
            carregarTipos();
            atualizarCardsMetodo();
        }

        init();
        
        //Funções $scope END

        // Tooltip
        $(".form-control").ready(function () {
            $('[data-toggle="tooltip"]').tooltip();
        });
    }
}());