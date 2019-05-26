(function () {
    'use strict';

    const service = angular.module('app');

    service.factory('historicoService', function ($http, APIConfig, responseService) {

        var defaultRoute = APIConfig.smarAPD_COMPONENTES + '/';

        return {
            getAll: function () {
                return $http.get(defaultRoute + 'historico')
                    .then(responseService.doResponse)
                    .catch(responseService.doError);
            },

            getByIdComponente: function (idComponente) {
                return $http.get(defaultRoute + 'historico/' + idComponente)
                    .then(responseService.doResponse)
                    .catch(responseService.doError);
            }
        };
    });
}());