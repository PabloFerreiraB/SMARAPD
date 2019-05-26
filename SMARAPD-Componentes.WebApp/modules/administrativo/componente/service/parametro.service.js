(function () {
    var service = angular.module('app');
    service.factory('parametroService', function ($http, APIConfig, responseService) {

        var defaultRoute = APIConfig.smarAPD_COMPONENTES + '/';

        return {            
            getByComponente: function (componenteId) {
                return $http.get(defaultRoute + 'parametro/getbyidcomponente/' + componenteId)
                    .then(responseService.doResponse)
                    .catch(responseService.doError);
            },
            save: function (data) {
                return $http.post(defaultRoute + 'parametro', data)
                    .then(responseService.doResponse)
                    .catch(responseService.doError);
            },
            update: function (id, data) {
                return $http.put(defaultRoute + 'parametro/' + id, data)
                    .then(responseService.doResponse)
                    .catch(responseService.doError);
            },
            delete: function (parametroId) {
                return $http.delete(defaultRoute + 'parametro/' + parametroId)
                    .then(responseService.doResponse)
                    .catch(responseService.doError);
            }
        };
    });
}());