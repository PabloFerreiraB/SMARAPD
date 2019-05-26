angular.module("app").directive("uiNome", function () {
    return {
        require: "ngModel",
        link: function (scope, element, attrs, ctrl) {
            var _formatNome = function (value) {
                if (!value) return "";
                var value = value.toString().replace(/[^A-Za-zÀ-ÖØ-öø-ÿ:\s]+/g, "");
                return value;
            };

            element.bind("keyup", function () {
                ctrl.$setViewValue(_formatNome(ctrl.$viewValue));
                ctrl.$render();
            });

            ctrl.$parsers.push(function (value) {
                return value;
            });

            ctrl.$formatters.push(_formatNome);
        }
    }
});