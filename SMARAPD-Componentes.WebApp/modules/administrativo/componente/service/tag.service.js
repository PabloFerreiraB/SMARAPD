angular.module('app').factory('tagService', function ($http, APIConfig, responseService) {

    var defaultRoute = APIConfig.smarAPD_COMPONENTES + '/';

    return {
        getAll: function () {
            return $http.get(defaultRoute + 'tag')
                .then(responseService.doResponse)
                .catch(responseService.doError);
        }
    }
});