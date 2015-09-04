angular.module('clinikoApp').controller('authCtrl', function ($scope, $location, $rootScope, $timeout, $http ) {
	$scope.user = [];
	$scope.error = false;
	$scope.loading = false;
	$scope.user.remember = false;

	$scope.doLogin = function(user){
		$scope.loading = true;
		$http.post('http://192.168.1.205:3000/sign_in',{ 'email': user.username, 'password': user.password, 'remember_me' : $scope.user.remember})
	 		 .success(function(response){
	 		 	if(response.flag == true){
	 		 		$location.path("/dashboard");
	 		 	}
	 		 	else{
					$scope.error = true ;
					 $timeout(function(){$scope.error = false}, 3000);
					$scope.loading = false ;
				}
		});
	 		

		
	}
});
