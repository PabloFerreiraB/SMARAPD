(function () {

    const service = angular.module('app');

    service.factory('usuarioService', function ($http, APIConfig, responseService) {

        var defaultRoute = APIConfig.smarAPD_COMPONENTES + '/';

        return {
            getAll: function () {
                return $http.get(defaultRoute + 'usuario/gridgetall')
                    .then(responseService.doResponse)
                    .catch(responseService.doError);
            },
            getallbyautorizacao: function () {
                return $http.get(defaultRoute + 'usuario/getallbyautorizacao')
                    .then(responseService.doResponse)
                    .catch(responseService.doError);
            },
            getById: function (id) {
                return $http.get(defaultRoute + 'usuario/' + id)
                    .then(responseService.doResponse)
                    .catch(responseService.doError);
            },
            countNaoAutorizados: function () {
                return $http.get(defaultRoute + 'usuario/countNaoAutorizados')
                    .then(responseService.doResponse)
                    .catch(responseService.doError);
            },
            save: function (data) {
                return $http.post(defaultRoute + 'usuario/save', data)
                    .then(responseService.doResponse)
                    .catch(responseService.doError);
            },
            usuarioExternoSave: function (data) {
                return $http.post(defaultRoute + 'usuario/usuarioExternoSave', data)
                    .then(responseService.doResponse)
                    .catch(responseService.doError);
            },
            update: function (id, data) {
                return $http.put(defaultRoute + 'usuario/' + id, data)
                    .then(responseService.doResponse)
                    .catch(responseService.doError);
            },
            updateAutorizacao: function (id) {
                return $http.put(defaultRoute + 'usuario/editAutorizacao/' + id)
                    .then(responseService.doResponse)
                    .catch(responseService.doError);
            },
            updateAllAutorizacao: function () {
                return $http.put(defaultRoute + 'usuario/editAllAutorizacao')
                    .then(responseService.doResponse)
                    .catch(responseService.doError);
            },
            updatePassword: function (id, senha) {
                debugger;
                return $http.put(defaultRoute + 'usuario/editPassword/' + id, senha)
                    .then(responseService.doResponse)
                    .catch(responseService.doError);
            },
            updatePasswordUsuarioExterno: function (id, senha) {
                debugger;
                return $http.put(defaultRoute + 'usuario/editPasswordPerfil/' + id, senha)
                    .then(responseService.doResponse)
                    .catch(responseService.doError);
            }
        };
    });
}());