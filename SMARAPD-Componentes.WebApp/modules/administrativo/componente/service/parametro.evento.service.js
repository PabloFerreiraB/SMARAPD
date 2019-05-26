(function () {
    var service = angular.module('app');
    service.factory('parametroEventoService', function ($http, APIConfig, responseService) {

        var defaultRoute = APIConfig.smarAPD_COMPONENTES + '/';

        return {
            getByIdEvento: function (eventoId) {
                return $http.get(defaultRoute + 'parametroEvento/getbyidevento/' + eventoId)
                    .then(responseService.doResponse)
                    .catch(responseService.doError);
            },
            save: function (data) {
                return $http.post(defaultRoute + 'parametroEvento', data)
                    .then(responseService.doResponse)
                    .catch(responseService.doError);
            },
            update: function (id, data) {
                return $http.put(defaultRoute + 'parametroEvento/' + id, data)
                    .then(responseService.doResponse)
                    .catch(responseService.doError);
            },
            delete: function (id) {
                return $http.delete(defaultRoute + 'parametroEvento/' + id)
                    .then(responseService.doResponse)
                    .catch(responseService.doError);
            }
        };
    });
}());