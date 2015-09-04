app.controller('settingCtrl', function ($scope, $location, $rootScope, $http) {
	$scope.account = [];
	$scope.settingSubmit= function(data){
		console.log(data);
	}
	$http.get('assets/angular/common/timezone.json')
	 	.success(function(response){
	 	 	$scope.timezone = response;
	 	 	
	});
	 $http.get('assets/angular/common/countries.json')
	 	.success(function(response){
	 	 	$scope.country = response;
	});
});
