(function () {
    var app = angular.module('app');
    app.service('authInterceptor', function ($q, $location, jwtService, APIConfig, $injector, moment) {

        var defaultRoute = APIConfig.smarAPD_COMPONENTES + '/';       

        function refresh() {

            var authService = $injector.get('authService');

            var user = jwtService.getUser();
            
            var dateRefresh = new Date(user.refreshToken);

            var dateNow = new Date();

            if (dateNow.getTime() > dateRefresh.getTime()) {

                authService.refreshToken()
                    .then(function (data) {

                        jwtService.save(data.token);
                       
                    })
                    .catch(function (error) {
                        showError(error);
                        $location.url('/login');
                    });
            }

        }

        return {

            request: function (config) {                  

                if (config.url.indexOf(defaultRoute) === 0 && jwtService.get() && !config.url.endsWith('/auth')) { 

                    config.headers.Authorization = 'Bearer ' + jwtService.get();

                    // Tem que fazer esse tratamento senão ele fica em loop
                    if (!config.url.endsWith('/auth/refresh')) {
                        refresh();
                    }
                }
                return config;
            },

            // Handle 401
            responseError: function (rejection) {
                if (rejection.status === 401 || rejection.status === 403) {
                    // clear any JWT token being stored
                    jwtService.destroy();
                    // do a hard page refresh
                    $location.path('/login');

                }
                return $q.reject(rejection);
            }

        };
    });
}());

