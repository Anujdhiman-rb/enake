app.controller('businessSettingCtrl', function ($scope, $location, $rootScope, $http, filterFilter) {
	$scope.account = [];
	$scope.cntry = '';
	$scope.country = '';
	$scope.settingSubmit= function(data){
		console.log(data);
	}

	 $http.get('assets/angular/common/countries.json')
	 	.success(function(response){
	 	 	$scope.country = response;
	});
	 $scope.GetStates = function(data){
	 	$scope.state = '';
	 	 $http.get('assets/angular/common/countries.json')
		 	.success(function(response){
		 	 	$scope.country = response;
		 	 	$scope.Jfilename = filterFilter($scope.country, {code:data});
				$http.get('assets/angular/common/countries/'+$scope.Jfilename[0].filename+'.json')
					.success(function(response){
					 	$scope.state = response;
					 	console.log(response);
				});		
	});

	}
});
