(function () {
    var service = angular.module('app');
    service.factory('parametroMetodoService', function ($http, APIConfig, responseService) {

        var defaultRoute = APIConfig.smarAPD_COMPONENTES + '/';

        return {
            getByIdMetodo: function (metodoId) {
                return $http.get(defaultRoute + 'parametroMetodo/getbyidmetodo/' + metodoId)
                    .then(responseService.doResponse)
                    .catch(responseService.doError);
            },
            save: function (data) {
                return $http.post(defaultRoute + 'parametroMetodo', data)
                    .then(responseService.doResponse)
                    .catch(responseService.doError);
            },
            update: function (id, data) {
                return $http.put(defaultRoute + 'parametroMetodo/' + id, data)
                    .then(responseService.doResponse)
                    .catch(responseService.doError);
            },
            delete: function (id) {
                return $http.delete(defaultRoute + 'parametroMetodo/' + id)
                    .then(responseService.doResponse)
                    .catch(responseService.doError);
            }
        };
    });
}());