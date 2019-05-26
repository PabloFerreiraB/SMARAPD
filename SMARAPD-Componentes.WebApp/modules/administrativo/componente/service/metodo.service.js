(function () {
    var service = angular.module('app');
    service.factory('metodoService', function ($http, APIConfig, responseService) {

        var defaultRoute = APIConfig.smarAPD_COMPONENTES + '/';

        return {
            getById: function (metodoId) {
                return $http.get(defaultRoute + 'metodo/' + metodoId)
                    .then(responseService.doResponse)
                    .catch(responseService.doError);
            },
            getByIdComponente: function (componenteId) {
                return $http.get(defaultRoute + 'metodo/getbyidcomponente/' + componenteId)
                    .then(responseService.doResponse)
                    .catch(responseService.doError);
            },
            save: function (data) {
                return $http.post(defaultRoute + 'metodo', data)
                    .then(responseService.doResponse)
                    .catch(responseService.doError);
            },
            update: function (id, data) {
                return $http.put(defaultRoute + 'metodo/' + id, data)
                    .then(responseService.doResponse)
                    .catch(responseService.doError);
            },
            delete: function (metodoId) {
                return $http.delete(defaultRoute + 'metodo/' + metodoId)
                    .then(responseService.doResponse)
                    .catch(responseService.doError);
            }
        };
    });
}());