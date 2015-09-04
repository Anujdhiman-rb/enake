var app = angular.module('clinikoApp', ['ui.router', 'ngAnimate', 'ui.bootstrap', 'oc.lazyLoad', 'ng-token-auth', 'ngScrollbar']);
app.controller('MainCntl', function ($scope) {
});
app.run(function ($rootScope, $location,  $state, $stateParams, $http) {
        $rootScope.$on("$stateChangeStart", function (event, next, current) {
           // $rootScope.cloading = true;
            //console.log($rootScope.cloading);
            //$rootScope.isLoggedIn = false;
            $rootScope.authenticated = false;
            $http.get('http://192.168.1.205:3000/getsession')
                 .success(function(response){
                        console.log(response);
                        if(response.flag == true){
                            $rootScope.User_id = response.session_id;
                            $rootScope.name = response.user_name;
                            $rootScope.isLoggedIn = true;
                        }
                        else{
                            
                             $state.go("login");
                            $rootScope.isLoggedIn = false;
                        }
                });
            $rootScope.logout = function(){
                $http.get('http://192.168.1.205:3000/signed_out')
                    .success(function(response){
                      $state.go("login");
                    });
            }
            $rootScope.range = function(min, max, step){
                step = step || 1;
                var input = [];
                for (var i = min; i <= max; i += step) input.push(i);
                return input;
              };
           
        });
        $rootScope.$on("$stateChangeSuccess", function (event, next, current) {
            $rootScope.cloading = false;
            //console.log($rootScope.cloading);
        });
        $rootScope.$state = $state;
        $rootScope.$stateParams = $stateParams;
    });




