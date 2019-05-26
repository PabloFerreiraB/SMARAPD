angular.module('app').directive('showErrors', function ($timeout, showErrorsConfig) {

    var getShowSuccess, linkFn;

    getShowSuccess = function (options) {

        var showSuccess;
        showSuccess = showErrorsConfig.showSuccess;

        if (options && options.showSuccess != null) {
            showSuccess = options.showSuccess;
        }

        return showSuccess;
    };


    linkFn = function (scope, element, attrs, formCtrl) {
        var blurred, inputElemento, inputName, inputNgEl, options, showSuccess, toggleClasses;
        blurred = false;
        options = scope.$eval(attrs.showErrors);
        showSuccess = getShowSuccess(options);

        // encontrando o elemento que possui o atributo 'name'
        inputElemento = element[0].querySelector('[name]');
        inputNgEl = angular.element(inputElemento);

        // obter o nome no elemento para que possamos saber a propriedade para verificar no controlador de formulário
        inputName = inputNgEl.attr('name');

        if (!inputName) {
            throw 'Para o show-errors funcionar é necessário usar o elemento: \'name\' attribute';
        }

        inputNgEl.bind('blur', function () {
            blurred = true;
            return toggleClasses(formCtrl[inputName].$invalid);
        });

        scope.$watch(function () {
            return formCtrl[inputName] && formCtrl[inputName].$invalid;
        },
            function (invalid) {
                if (!blurred) {
                    return;
                }
                return toggleClasses(invalid);
            });


        scope.$on('show-errors-check-validity', function () {          
            return toggleClasses(formCtrl[inputName].$invalid);
        });


        scope.$on('show-errors-reset', function () {
            return $timeout(function () {
                element.removeClass('was-validated');
                element.removeClass('has-success');
                element.removeClass('has-error');

                return blurred = false;
            },
                0, false);
        });

        


        return toggleClasses = function (invalid) {
            element.toggleClass('was-validated', invalid);

            if (showSuccess) {
                return element.toggleClass('has-success', !invalid);
            }
        };
    };

    return {
        restrict: 'A',
        require: '^form',
        compile: function (elememts) {

            if (!elememts.hasClass('form-group')) {
                throw 'Não foi adicionado o elemento show-errors no: \'form-group\' class';
            }

            return linkFn;
        }
    };
});