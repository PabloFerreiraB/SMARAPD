(function () {

    var service = angular.module('app');

    service.factory('categoriaService', function ($http, APIConfig, responseService) {

        var defaultRoute = APIConfig.smarAPD_COMPONENTES + '/';

        return {
            getAll: function () {
                return $http.get(defaultRoute + 'categoria')
                    .then(responseService.doResponse)
                    .catch(responseService.doError);
            },

            getAllHasComponente: function () {
                return $http.get(defaultRoute + 'categoria/getallhascomponente')
                    .then(responseService.doResponse)
                    .catch(responseService.doError);
            },

            getById: function (id) {
                return $http.get(defaultRoute + 'categoria/' + id)
                    .then(responseService.doResponse)
                    .catch(responseService.doError);
            },

            save: function (data) {
                return $http.post(defaultRoute + 'categoria', data)
                    .then(responseService.doResponse)
                    .catch(responseService.doError);
            },

            view: function () {
                return $http.put(defaultRoute + 'categoria/view/' + id)
                    .then(responseService.doResponse)
                    .catch(responseService.doError);
            },

            update: function (data, id) {
                return $http.put(defaultRoute + 'categoria/' + id, data)
                    .then(responseService.doResponse)
                    .catch(responseService.doError);
            },

            remove: function (id) {
                return $http.delete(defaultRoute + 'categoria/' + id)
                    .then(responseService.doResponse)
                    .catch(responseService.doError);
            }
        };
    });
}());