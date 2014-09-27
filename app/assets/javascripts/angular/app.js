var myApp = angular.module('Emangu', ['ngRoute', 'ngResource']);

//Routes

myApp.config([
    '$routeProvider', '$locationProvider', function ($routeProvider, $locationProvider) {
        $routeProvider.when('/posts', {
            templateUrl: '/templates/posts/index.html',
            controller: 'PostsListCtr'
        });

    }
]);

//Controllers

myApp.controller("PostsListCtr", ['$scope', '$http', '$resource', 'Blogs', '$location', function ($scope, $http, $resource, Blogs, $location) {

    $scope.posts = Blogs.list();

//    $scope.deletePost = function (Post) {
//        if (confirm("Are you sure you want to delete this Post?")) {
//            Post.delete({ id: Post }, function () {
//                $scope.posts = Blogs.list();
//                $location.path('/');
//            });
//        }
//    };
}]);


myApp.factory('Blogs', ['$resource', function ($resource) {
    return $resource('/blog.json', {}, {
        list: { method: 'GET', isArray: true },
        create: { method: 'POST' }
    })
}]);