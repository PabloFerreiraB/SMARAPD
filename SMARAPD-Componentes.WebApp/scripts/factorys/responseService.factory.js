(function () {
    angular.module('app').factory('responseService', responseService);

    function responseService() {        

        return {
            doResponse: function (response) {
                return response.data;
            },
            doError: function (response) {
                throw response.data;
            }
        };
    }

})();