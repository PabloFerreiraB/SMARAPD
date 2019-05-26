(function () {
    var service = angular.module('app');
    service.factory('eventoService', function ($http, APIConfig, responseService) {

        var defaultRoute = APIConfig.smarAPD_COMPONENTES + '/';

        return {
            getById: function (eventoId) {
                return $http.get(defaultRoute + 'evento/' + eventoId)
                    .then(responseService.doResponse)
                    .catch(responseService.doError);
            },
            getByIdComponente: function (componenteId) {
                return $http.get(defaultRoute + 'evento/getbyidcomponente/' + componenteId)
                    .then(responseService.doResponse)
                    .catch(responseService.doError);
            },
            save: function (data) {
                return $http.post(defaultRoute + 'evento', data)
                    .then(responseService.doResponse)
                    .catch(responseService.doError);
            },
            update: function (id, data) {
                return $http.put(defaultRoute + 'evento/' + id, data)
                    .then(responseService.doResponse)
                    .catch(responseService.doError);
            },
            delete: function (eventoId) {
                return $http.delete(defaultRoute + 'evento/' + eventoId)
                    .then(responseService.doResponse)
                    .catch(responseService.doError);
            }
        };
    });
}());