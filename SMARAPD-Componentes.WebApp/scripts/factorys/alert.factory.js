(function () {
    var service = angular.module('app');
    service.factory('alertFactory', function () {
        return {
            success: function (mensagem) {
                $.notify({
                    message: mensagem
                }, {
                        type: 'success',
                        placement: {
                            from: "top",
                            align: "center"
                        },
                        animate: {
                            enter: 'animated fadeInDown',
                            exit: 'animated fadeOutUp'
                        },
                        delay: 1000,
                        allow_dismiss: true,
                        z_index: 9999
                    });
            },

            danger: function (mensagem) {
                $.notify({
                    message: mensagem
                }, {
                        type: 'danger',
                        placement: {
                            from: "top",
                            align: "center"
                        },
                        animate: {
                            enter: 'animated fadeInDown',
                            exit: 'animated fadeOutUp'
                        },
                        delay: 1000000,
                        allow_dismiss: true,
                        z_index: 9999
                    });
            },

            warning: function (mensagem) {
                $.notify({
                    message: mensagem
                }, {
                        type: 'warning',
                        placement: {
                            from: "top",
                            align: "center"
                        },
                        animate: {
                            enter: 'animated fadeInDown',
                            exit: 'animated fadeOutUp'
                        },
                        delay: 1000,
                        allow_dismiss: true,
                        z_index: 9999
                    });
            }


        };
    });
}());

