angular.module("app").service("menuService", function ($http, APIConfig) {
    return {
        getAll: function () {
            return $http.get(APIConfig.smarAPD_COMPONENTES + '/componente/getcomponentemenu');
        },
    };
});