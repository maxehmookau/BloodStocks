app = angular.module('bloodApp', ['restangular'])

app.controller 'bloodController', ($scope, $http) ->
  $http.get('records?authority=welshbloodservice').success (data) ->
    $scope.results = data

  $http.get('blood_types').success (data) ->
    $scope.bloodTypes = data

  $scope.bloodTypeForID = (id) ->
    _.find $scope.bloodTypes, (type) ->
             type.id == id