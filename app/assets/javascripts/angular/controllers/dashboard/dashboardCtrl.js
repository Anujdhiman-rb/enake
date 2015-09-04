angular.module('clinikoApp').controller('dashboardCtrl', function ($scope, $location, $rootScope, $timeout, $http) {
$scope.status = {
    isopen: false
  };
  $scope.$broadcast('rebuild:me');
  $scope.postmessage = '';
  $scope.postMessage = function(postmessage){

  }


   

});
	