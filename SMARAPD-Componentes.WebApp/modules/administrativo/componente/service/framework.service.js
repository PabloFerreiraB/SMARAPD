angular.module('app').factory('frameworkService', function ($http, APIConfig, responseService) {
    var defaultRoute = APIConfig.smarAPD_COMPONENTES + '/';

    return {
        getAll: function () {
            return $http.get(defaultRoute + 'Framework')
                .then(responseService.doResponse)
                .catch(responseService.doError)
        }
    }
});