angular.module('app').factory('statusService', function () {
    return {
        status: ['Ativo', 'Depreciado', 'Desativado']
    };
});