var myApp = angular.module('Emangu', ['ngRoute', 'ngResource']);

//Routes

myApp.config([
    '$routeProvider', '$locationProvider', function ($routeProvider, $locationProvider) {
        $routeProvider.when('/index', {
            templateUrl: '/template/index.html',
            controller: 'PostsListCtr'
        }).when('/login', {
            templateUrl: '/template/login.html',
            controller: 'LoginCtr'
        }). otherwise({
            templateUrl: '/template/index.html'
        })

    }
]);




//Controllers




myApp.factory('Posts', ['$resource', function ($resource) {
    return $resource('/posts.json', {}, {
        list: { method: 'GET', isArray: true },
        create: { method: 'POST' }
    })
}]);
