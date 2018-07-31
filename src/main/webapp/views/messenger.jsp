<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
<title>Facebook Messenger</title>

<!-- Bootstrap -->

<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="css/style.css">
<link rel="stylesheet" type="text/css" href="css/font-awesome.css">
<link rel="stylesheet" type="text/css" href="css/messenger.css">

<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"> </script>
<!--<script type="text/javascript" src="js/holder.js"  ></script>-->

<script type="text/javascript"
	src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.4/angular.min.js"></script>
<script type="text/javascript">
function currentDate() {
    var d = new Date(),
        month = '' + (d.getMonth() + 1),
        day = '' + d.getDate(),
        year = d.getFullYear(),
        hour = d.getHours(),
        min = d.getMinutes(),
        sec = d.getSeconds();
		
    if (month.length < 2) month = '0' + month;
    if (day.length < 2) day = '0' + day;
    if (hour.length < 2) day = '0' + hour;
    if (min.length < 2) day = '0' + min;
    if (sec.length < 2) day = '0' + sec;

    return [[day,month,year].join('/'),hour,min,sec].join('-');
}

    var App = angular.module('appX', []);
    App.filter('unique', function() {
    	   // we will return a function which will take in a collection
    	   // and a keyname
    	   return function(collection, keyname) {
    	      // we define our output and keys array;
    	      var output = [], 
    	          keys = [];
    	      
    	      // we utilize angular's foreach function
    	      // this takes in our original collection and an iterator function
    	      angular.forEach(collection, function(item) {
    	          // we check to see whether our object exists
    	          var key = item[keyname];
    	          // if it's not already part of our keys array
    	          if(keys.indexOf(key) === -1) {
    	              // add it to our keys array
    	              keys.push(key); 
    	              // push this item to our final output array
    	              output.push(item);
    	          }
    	      });
    	      // return our array which should be devoid of
    	      // any duplicates
    	      return output;
    	   };
    	});		
    App.controller("controllerX", function($scope,$interval,$http) {
    	$http({
            method : "POST",
            url : "/myChatHeads/"
           }).then(function mySuccess(response) {
               $scope.chatheads = response.data;
               }, function myError(response) {
            $scope.messages = response.statusText;          
                });
          $scope.form={};
        $scope.findX = function(data){
            $http({
             method : "POST",
             url : "/findUser",
             params : data,
             headers : { 'Content-Type': 'application/x-www-form-urlencoded' }
            }).then(function mySuccess(response) {
                $scope.results = response.data;
                }, function myError(response) {
             $scope.results = response.statusText;          
                 });
             };
             $scope.dateTime = currentDate();
             $scope.form = {};
             $scope.getChatX = function(data){
                 $http({
                  method : "POST",
                  url : "/myMessages/"+data,
                  headers : { 'Content-Type': 'application/x-www-form-urlencoded' }
                 }).then(function mySuccess(response) {
                     $scope.chatX = response.data;
                     }, function myError(response) {
                  $scope.chatX = response.statusText;          
                      });
                  };
  });
		
  </script>

</head>
<body ng-app="appX" ng-controller="controllerX">
	<nav class="navbar navbar-default" data-spy="affix" data-offset-top="1">
		<div class="container">
			<!-- Brand and toggle get grouped for better mobile display -->
			<div class="navbar-header">
				<button type="button" class="navbar-toggle collapsed"
					data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
					aria-expanded="false">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand icon-brand fa fa-2x fa-facebook-square"
					href="/home"></a>
			</div>

			<!-- Collect the nav links, forms, and other content for toggling -->
			<div class="collapse navbar-collapse"
				id="bs-example-navbar-collapse-1">
				<form class="navbar-form navbar-left" ng-submit="findX()"
					role="search">
					<div class="form-group">
						<div class="search">
							<input type="text" class="form-control dropdown-toggle"
								data-toggle="dropdown" name="uname" ng-model="find.uname"
								ng-keyup="findX(find)"
								placeholder="Search peoples, places and more" /> <span
								class="fa fa-search"></span>
							<ul
								style="width: 400px; background-color: white; appearance: pull-down-menu;"
								class="dropdown-menu" ng-repeat="u in results">
								<div class="well-sm">
									<a href="{{u.username}}"><img src="{{u.dp}}" height="50px"
										width="50px">{{u.name}}</a>
								</div>
							</ul>
						</div>
					</div>
				</form>
				<ul class="nav navbar-nav navbar-right">
					<li><a href="/home">Home</a></li>
					<li><a href="#" class="fa fa-user" alt="resquest"></a></li>
					<li><a href="/messenger" class="fa fa-comments" alt="inbox"></a></li>
					<li><a href="#" class="fa fa-bell" alt="notifications"></a></li>
					<li class="dropdown"><a href="#" class="dropdown-toggle"
						data-toggle="dropdown" role="button" aria-haspopup="true"
						aria-expanded="false"><span class="caret"></span></a>
						<ul class="dropdown-menu">
							<li><a href="#">Groups</a></li>
							<li><a href="#">Pages</a></li>
							<li role="separator" class="divider"></li>
							<li><a href="#">Configuration</a></li>
							<li><a href="/logout">Logout</a></li>
							<li role="separator" class="divider"></li>
							<li><a href="#">Help</a></li>
						</ul></li>
				</ul>
			</div>
			<!-- /.navbar-collapse -->
		</div>
		<!-- /.container-fluid -->
	</nav>
	
	<div class="content container-fluid bootstrap snippets">
      <div class="row row-broken">
        <div class="col-sm-3 col-xs-12">
          <div class="col-inside-lg decor-default chat" style="overflow: auto; outline: none;" >
            <div class="chat-users">
              <h6>Messenger</h6>
                <div class="user" ng-repeat="x in chatheads | unique : '0'"  >
              
                	<div ng-click="getChatX(x[2])" data-toggle="tab" data-target="{{'#' + x[2]}}">
                    <div class="avatar" >
                    <img src="{{x[1]}}" alt="User name">
                    <div class="status online"></div>
                    </div>
                    <div class="name">{{x[0]}}</div>
                    <div class="mood">&nbsp;{{x[3]}}</div>
                    </div>
                </div>
            </div>
          </div>
        </div>
        <div class="tab-content">
        <div id="{{x[2]}}" class="col-sm-9 col-xs-12 chat tab-pane fade" style="overflow: auto; outline: none;" ng-repeat="x in chatheads | unique : '0'">
          <div class="col-inside-lg decor-default " >
            <!-- 0 is the index of element in array for comparison -->
            <div class="chat-body "  >
              <h6>{{x[0]}}</h6>
              <div ng-repeat="c in chatX">
		              <div ng-if="c[4]===1" class="answer right">
		                <div class="avatar">
		                  <img src="{{c[1]}}" alt="User name">
		                  <div class="status online"></div>
		                </div>
		                <div class="name">{{c[0]}}</div>
		                <div class="text">
		                  {{c[3]}}
		                </div>
		                <div class="time" ng-if="(dateTime.substring(0,2))-1===(c[5].substring(0,2))">Yesterday</div>
		                <div class="time" ng-if="(dateTime.substring(0,2))-(c[5].substring(0,2))===0">{{c[5].substring(11,16)}}</div>
		                <div class="time" ng-if="(dateTime.substring(0,2))!==(c[5].substring(0,2))">{{c[5].substring(0,10)}}</div>
		              </div>
		              <div ng-if="c[4]!==1" class="answer left">
		                <div class="avatar">
		                  <img src="{{c[1]}}" alt="User name">
		                  <div class="status offline"></div>
		                </div>
		                <div class="name" >{{c[0]}}</div>
		                <div class="text">
		                  {{c[3]}}
		                </div>
		                <div class="time" ng-if="(dateTime.substring(0,2))-1===(c[5].substring(0,2))">Yesterday</div>
		                <div class="time" ng-if="(dateTime.substring(0,2))-(c[5].substring(0,2))===0">{{c[5].substring(11,16)}}</div>
		                <div class="time" ng-if="(dateTime.substring(0,2))!==(c[5].substring(0,2))">{{c[5].substring(0,10)}}</div>
		              </div>
              </div>
            
              <div class="answer-add">
                <input placeholder="Write a message">
                <span class="answer-btn answer-btn-1"></span>
                <span class="answer-btn answer-btn-2"></span>
              </div>
            </div>
          </div>
        </div>
        </div>
        
      </div>
    </div>
</body>
</html>