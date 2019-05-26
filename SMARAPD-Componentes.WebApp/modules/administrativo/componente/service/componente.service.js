(function () {
    var service = angular.module('app');
    service.factory('componenteService', function ($http, APIConfig, responseService) {

        var defaultRoute = APIConfig.smarAPD_COMPONENTES + '/';

        return {
            getByIdView: function (id) {
                return $http.get(defaultRoute + 'componente/getbyidview/' + id)
                    .then(responseService.doResponse)
                    .catch(responseService.doError);
            },
            getComponenteMenu: function () {
                return $http.get(defaultRoute + 'componente/getcomponentemenu')
                    .then(responseService.doResponse)
                    .catch(responseService.doError);
            },
            getAll: function () {
                return $http.get(defaultRoute + 'componente')
                    .then(responseService.doResponse)
                    .catch(responseService.doError);
            },
            getAllGrid: function () {
                return $http.get(defaultRoute + 'componente/getallgrid')
                    .then(responseService.doResponse)
                    .catch(responseService.doError);
            },
            getById: function (id) {
                return $http.get(defaultRoute + 'componente/' + id)
                    .then(responseService.doResponse)
                    .catch(responseService.doError);
            },
            save: function (data) {
                return $http.post(defaultRoute + 'componente', data)
                    .then(responseService.doResponse)
                    .catch(responseService.doError);
            },
            update: function (data) {
                return $http.put(defaultRoute + 'componente/' + data.id, data)
                    .then(responseService.doResponse)
                    .catch(responseService.doError);
            },
            delete: function (componenteId) {
                return $http.delete(defaultRoute + 'componente/' + componenteId)
                    .then(responseService.doResponse)
                    .catch(responseService.doError);
            },
            pesquisa: function (data) {
                return $http.post(defaultRoute + 'componente/pesquisa', data)
                    .then(responseService.doResponse)
                    .catch(responseService.doError);
            }
        };
    });
}());