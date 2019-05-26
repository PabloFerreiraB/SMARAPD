(function () {
    var service = angular.module('app');
    service.factory('dialogService', function ($uibModal, messagesFactory) {
        return {
            confirm: function (title, message) {
                var modalInstance = $uibModal.open({
                    templateUrl: 'modules/common/modal/view/yesNoConfirm.html',
                    controller: 'yesNoConfirmController',
                    size: 'lg',
                    backdrop: 'static',
                    resolve: {

                        title: function () {
                            return title ? title : 'Confirmação';
                        },
                        message: function () {
                            return message;
                        }
                    }
                });

                return modalInstance.result;

            },

            confirmDelete: function (title, message) {

                var modalInstance = $uibModal.open({
                    templateUrl: 'modules/common/modal/view/yesNoConfirm.html',
                    controller: 'yesNoConfirmController',
                    size: 'lg',
                    backdrop: 'static',
                    resolve: {
                        title: function () {
                            return 'Remover registro';
                        },
                        message: function () {
                            return messagesFactory.Common.CONFIRMA_DELETE;
                        }
                    }
                });

                return modalInstance.result;
            },
        };
    });
}());

