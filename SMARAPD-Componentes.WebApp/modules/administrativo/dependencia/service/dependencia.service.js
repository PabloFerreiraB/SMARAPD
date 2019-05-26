(function () {

    var service = angular.module('app');

    service.factory('dependenciaService', function ($http, APIConfig, responseService) {

        var defaultRoute = APIConfig.smarAPD_COMPONENTES + '/';

        return {

            getAll: function () {
                return $http.get(defaultRoute + 'dependencia')
                    .then(responseService.doResponse)
                    .catch(responseService.doError);
            },

            getbyid: function (id) {
                return $http.get(defaultRoute + 'dependencia/' + id)
                    .then(responseService.doResponse)
                    .catch(responseService.doError);
            },

            save: function (data) {
                return $http.post(defaultRoute + 'dependencia', data)
                    .then(responseService.doResponse)
                    .catch(responseService.doError);
            },

            update: function (id, data) {
                return $http.put(defaultRoute + 'dependencia/' + id, data)
                    .then(responseService.doResponse)
                    .catch(responseService.doError);
            },

            remove: function (id) {
                return $http.delete(defaultRoute + 'dependencia/' + id)
                    .then(responseService.doResponse)
                    .catch(responseService.doError);
            },

            associar: function (data) {
                return $http.post(defaultRoute + 'dependencia/associar', data)
                    .then(responseService.doResponse)
                    .catch(responseService.doError);
            },

            desassociar: function (idComponente, idDependencia) {
                return $http.delete(defaultRoute + 'dependencia/desassociar/' + idComponente + '/' + idDependencia)
                    .then(responseService.doResponse)
                    .catch(responseService.doError);
            },

        };
    });
}());