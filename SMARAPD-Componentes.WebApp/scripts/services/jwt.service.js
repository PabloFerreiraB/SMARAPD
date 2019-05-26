(function () {
	var app = angular.module('app');
	app.service('jwtService', function () {

		var keySessionStorage = 'SMARAPD-Componentes.Token'

		return {

			save: function (token) {
				sessionStorage[keySessionStorage] = token;
			},

			get: function () {
                return sessionStorage[keySessionStorage];
			},
			isLogged: function () {
                return !!sessionStorage[keySessionStorage];
			},
			destroy: function () {
                sessionStorage.removeItem(keySessionStorage);
			},
			parseJwt: function (token) {				
				return {
					Header: JSON.parse(window.atob(token.split('.')[0].replace(/-/g, '+').replace(/_/g, '/'))),
					Payload: JSON.parse(window.atob(token.split('.')[1].replace(/-/g, '+').replace(/_/g, '/')))
				};
			},
			getUser: function () {
				
				let token = this.get();

				if (token) {
					return this.parseJwt(token).Payload;
				}
            },
            isSuperUser: function () {

                let token = this.get();

                if (token) {
                    let user = this.parseJwt(token).Payload;

                    return user.isSuperUser == "True";
                }

                return false;
            }
		};
	});
}());

