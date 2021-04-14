"use strict";
var app = angular.module("Crawl", []).run();

app.controller('CrawlShopee', ['$scope', '$timeout', '$http', function ($scope, $timeout, $http) {
  $scope.AllItem = [];
  var value = "88201679";
  Init();

  function GetCategory(value) {
    var url = "/api/apple_flagship_store?shopid=" + value;
    $http.get(url)
    .then(function(response) {
        $scope.Category = response.data.data.items;
    });
  }

  $scope.GetDetail = function(id) {
    $scope.isloading = true;

    //setTimeout(() => {
      var url = "/api/apple_flagship_store_detail?shopid=" + value + "&shop_detailid=" + id;
      $http.get(url)
      .then(function(response) {
          $scope.items = response.data;
          $scope.isloading = false;
      }, function error(response){
          $scope.GetDetail(id);
      });
    //}, 1000);
  }

  function Init() {
    $scope.isloading = true;
    GetCategory(value);
    var url = "/api/apple_flagship_store_detail?shopid=" + value + "&shop_detailid=0";
      $http.get(url)
      .then(function(response) {
          $scope.items = response.data;
          $scope.isloading = false;
      }, function error(response){
          $scope.GetDetail(id);
      });
  };
}])