(function () {

    var service = angular.module('app');

    service.factory('authService', function ($http, APIConfig, responseService) {

        var defaultRoute = APIConfig.smarAPD_COMPONENTES + '/';

        return {
            logar: function (data) {
                return $http.post(defaultRoute + 'auth', data)
                    .then(responseService.doResponse)
                    .catch(responseService.doError);
            },
            refreshToken: function () {
                return $http.get(defaultRoute + 'auth/refresh')
                    .then(responseService.doResponse)
                    .catch(responseService.doError);
            }
        };
    });
}());