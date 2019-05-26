angular.module('app').factory('tipoService', function ($http, APIConfig, responseService) {

    var defaultRoute = APIConfig.smarAPD_COMPONENTES + '/';

    return {
        getTiposParametro: function () {
            return $http.get(defaultRoute + 'tipo/parametro')
                .then(responseService.doResponse)
                .catch(responseService.doError);
        },
        getTiposRetorno: function () {
            return $http.get(defaultRoute + 'tipo/retorno')
                .then(responseService.doResponse)
                .catch(responseService.doError);
        }
    }
});