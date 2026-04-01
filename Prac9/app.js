var app = angular.module("authApp", ["ngRoute"]);

app.config(function($routeProvider) {

    $routeProvider

    .when("/register", {
        templateUrl: "views/register.html",
        controller: "RegisterController"
    })

    .when("/login", {
        templateUrl: "views/login.html",
        controller: "LoginController"
    })

    .otherwise({
        redirectTo: "/register"
    });

});


// Register Controller
app.controller("RegisterController", function($scope) {
    $scope.user = {};

    $scope.register = function() {

        let users = JSON.parse(localStorage.getItem("users")) || [];

        users.push({
            firstName: $scope.user.firstName,
            lastName: $scope.user.lastName,
            username: $scope.user.username,
            password: $scope.user.password
        });

        localStorage.setItem("users", JSON.stringify(users));

        $scope.message = "Registration Successful!";
        $scope.user = {};
    };

});


// Login Controller
app.controller("LoginController", function($scope) {
    $scope.loginUser = {};

    $scope.login = function() {

        let users = JSON.parse(localStorage.getItem("users")) || [];

        let found = users.find(function(u) {
            return u.username === $scope.loginUser.username &&
                   u.password === $scope.loginUser.password;
        });

        if(found) {
            $scope.message = "Login Successful! Welcome " + found.firstName;
        } 
        else {
            $scope.message = "Invalid Username or Password";
        }
    };

});