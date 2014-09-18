# Define App and dependencies
TodosApp = angular.module("TodosApp", ["ngRoute", "templates"])

# Setup the angular router
TodosApp.config ["$routeProvider", "$locationProvider", ($routeProvider, $locationProvider) ->
  $routeProvider
    .when '/',
      templateUrl: "index.html",
      controller: "GamesCtrl"
  .otherwise
      redirectTo: '/'

  $locationProvider.html5Mode(true)

]
#CRUD Action takes place
# Games Controller
TodosApp.controller "GamesCtrl", ["$scope", "$http", ($scope, $http) ->
  # $scope.itemss = []
  $scope.items = []
  $scope.getItems = ->
    # make a GET request to /items.json
    $http.get("/games.json").success (data) ->
      console.log data
      # do something with the response..
      # set the value of my response to $scope.items
      $scope.items = data

  $scope.getItems()

  #CREATE
  $scope.addItem = ->
    $http.post("/games.json", {item:$scope.newItem}).success (data) ->
      console.log $scope.newItem
      # console.log data
      #cleared the form
      $scope.newItem = {}
      # the newItem object is empty now
      # add each items to items array
      $scope.items.push(data)
]

# Define Config for CSRF token
TodosApp.config ["$httpProvider", ($httpProvider)->
  $httpProvider.defaults.headers.common['X-CSRF-Token'] = $('meta[name=csrf-token]').attr('content')
]