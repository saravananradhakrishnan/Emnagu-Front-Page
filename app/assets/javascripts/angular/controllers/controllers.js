// //Controllers

// myApp.controller("PostListCtr", ['$scope', '$http', '$resource', 'Posts', 'Post', '$location', function ($scope, $http, $resource, Posts, Post, $location) {

//     alert("hello");
//     $scope.posts = Posts.query();
//     alert(Posts.query());
//     // $scope.deletePost = function (Post) {
//     //     if (confirm("Are you sure you want to delete this Post?")) {
//     //         Post.delete({ id: Post }, function () {
//     //             $scope.posts = Posts.query();
//     //             $location.path('/');
//     //         });
//     //     }
//     // };
// }]);
myApp.controller("PostsListCtr", ['$scope', '$http', '$resource', 'Posts', '$location', function ($scope, $http, $resource, Posts, $location) {

    $scope.posts = Posts.list();

//    $scope.deletePost = function (Post) {
//        if (confirm("Are you sure you want to delete this Post?")) {
//            Post.delete({ id: Post }, function () {
//                $scope.posts = Posts.list();
//                $location.path('/');
//            });
//        }
//    };
}]);

myApp.controller("LoginCtr", ['$scope', '$http', '$resource', 'Posts', '$location', function ($scope, $http, $resource, Posts, $location) {




}]);
