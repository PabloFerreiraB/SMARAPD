angular.module("app").controller("deniedController", function ($scope, $location) {

    $scope.$parent.title = "Acesso Negado";

    $scope.navigateToHome = function (){
        $location.url('/home');
    }
});