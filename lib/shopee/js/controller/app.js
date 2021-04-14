"use strict";
var app = angular.module("Crawl", []).run();

app.controller('CrawlShopee', ['$scope', '$timeout', '$http', function ($scope, $timeout, $http) {
  $scope.AllItem = [];
  var value = "88201679";

  //GetCategory(value);
  test(0);

  function GetCategory(value) {
    var url = "/api/apple_flagship_store?shopid=" + value;
    $http.get(url)
    .then(function(response) {
        $scope.Category = response.data.data.items;
    });
  }

  $scope.GetDetail = function(id) {
    setTimeout(() => {
      var url = "/api/apple_flagship_store_detail?shopid=" + value + "&shop_detailid=" + id;
      $http.get(url)
      .then(function(response) {
          $scope.items = response.data;
      }, function error(response){
          $scope.GetDetail(id);
      });
    }, 3000);
  }

  function test(id) {
    setTimeout(() => {
      var url = "/api/apple_flagship_store_detail?shopid=" + value + "&shop_detailid=" + id;
      $http.get(url)
      .then(function(response) {
          $scope.items = response.data;
      }, function error(response){
          $scope.GetDetail(id);
      });
    }, 3000);
  }

  function AddDetail(id, item) {

  }

}])