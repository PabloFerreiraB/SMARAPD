
function functionDiretive() {
    return {
        restrict: 'EA',
        templateUrl: 'templates/directives/card.html',
        link: start,
        scope: {config: '=?'},
        controller: 'ctrl',
    }

    function start(scope) {
        setScope(scope);
    }

    function setScope(scope) {
        scope.array = scope.array || []
    }
}

function ctrl() { }

angular.module('card', []).directive('card', functionDiretive).controller('ctrl', ctrl);