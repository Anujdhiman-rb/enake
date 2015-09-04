app.controller('UserSettingCtrl', function ($scope, $location, $rootScope, $http, filterFilter) {
    $scope.counter=0;
	$scope.acounter=0;
     $scope.parctitioner = [ {id:$scope.counter} ];
	 $scope.abreak = [ {id:$scope.acounter} ];


	  $scope.newPractitioner = function($event){
        $scope.counter++;
        $scope.parctitioner.push(  { id:$scope.counter} );
         $scope.$broadcast('rebuild:me');
        
    }
    $scope.removePractitioner = function(data){
    	if($scope.parctitioner.length > 1){
	    	$scope.parctitioner.splice(data, 1)
            $scope.$broadcast('rebuild:me');
	    }

    }
    $scope.NewBreak = function($event){
        $scope.acounter++;
        $scope.abreak.push(  {id:$scope.acounter} );
         $scope.$broadcast('rebuild:me');
        
    }
    $scope.RemoveBreak = function(data){
            $scope.abreak.splice(data, 1)
            $scope.$broadcast('rebuild:me');

    }
});



