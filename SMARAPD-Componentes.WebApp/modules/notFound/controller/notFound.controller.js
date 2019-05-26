angular.module("app").controller("notFoundController", function ($scope, $location) {

    $scope.$parent.title = "Página não encontrada"

    $scope.navigateToHome = function () {
        $location.url('/home');
    }
});