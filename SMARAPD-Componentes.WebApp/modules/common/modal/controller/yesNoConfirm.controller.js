(function () {
    'use strict';
    var app = angular.module('app');
    app.controller('yesNoConfirmController', function ($scope, $uibModalInstance, title, message) {
        
        //$scope Variables BEGIN
        $scope.title = title;
        $scope.message = message;
        //$scope Variables END

        //$scope Functions BEGIN
        $scope.ok = ok;
        $scope.cancel = cancel;
        //$scope Functions END

        //Functions BEGIN
        function ok() {
            $uibModalInstance.close(true);
        };

        function cancel() {
            $uibModalInstance.dismiss(false);
        };
        //Functions END
    });
}());