(function () {
    'use strict';
    var app = angular.module('app');

    //var host = window.location.hostname;

    var host = 'localhost';
    let defaultComponenteImage = '../../../../../assets/img/img-placeholder.png';
    let defaultUserImage = '../../../../../assets/img/img-user-placeholder.png';

    app.constant('APIConfig', {
        smarAPD_COMPONENTES: 'https://' + host + ':5001',
    });

    app.constant('routeConfig', {
        Administrativo: '/administrativo/',
    });

    app.constant('defaultImages', {
        componente: defaultComponenteImage,
        usuario: defaultUserImage
    });

}());

