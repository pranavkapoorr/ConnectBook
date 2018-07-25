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

<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"> </script>
<!--<script type="text/javascript" src="js/holder.js"  ></script>-->

<script type="text/javascript"
	src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.4/angular.min.js"></script>
<script type="text/javascript">
      
    var App = angular.module('appX', []);
		// create angular controller and pass in $scope and $http
    App.controller("controllerX", function($scope,$interval,$http) {
        
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
  });
  </script>
<style type="text/css">
.chat {
  list-style-type: none;
  width: 100%;
}
html, body, .container, .row {
    height:100%;
}
.col-xs-3 ,.col-xs-6{
	overflow:auto;
    border: 1px solid black;
    height: 100vh;
}
.chat__bubble {
  margin-bottom: 3px;
  padding: 5px 5px;
  clear: both;
  border-radius: 10px 10px 2px 2px ;
}

.chat__bubble--rcvd {
  background: #f2f2f2;
  color: black;
  float: left;
  border-bottom-right-radius: 10px;
}

.chat__bubble--sent {
  background: #0066ff;
  color: white;
  float: right;
  border-bottom-left-radius: 10px;
}

.chat__bubble--sent + .chat__bubble--sent {
  border-top-right-radius: 2px;
}

.chat__bubble--rcvd + .chat__bubble--rcvd {
  border-top-left-radius: 2px;
}

.chat__bubble--stop {
  border-bottom-right-radius: 10px;
  border-bottom-left-radius: 10px;
}</style>
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
							<!-- <div class="thumbnail thumbnail-post" ng-repeat="u in results">
                      <div><img src="{{u.dp}}" height="50px" width="50px">{{u.name}}</div>
                        </div>-->
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
<div class="row">
<div class="col-xs-3 thumbnail ">
<ul class="nav nav-pills nav-stacked list-group">
  <li class="active list-group-item"><a data-toggle="pill" href="#home">Menu 1</a></li>
  <li class="list-group-item"><a data-toggle="pill" href="#home1">Menu 2</a></li>
  <li class="list-group-item"><a data-toggle="pill" href="#home2">Menu 3</a></li>
  <li class="list-group-item"><a data-toggle="pill" href="#home3">Menu 3</a></li>
</ul>
</div>


<div class="col-xs-6 thumbnail">
<div class="tab-content"  >
<div id="home" class="tab-pane fade in active"  >
<ul class="chat">
 <li class="chat__bubble chat__bubble--rcvd chat__bubble--stop">What are you up to?</li>
 <li class="chat__bubble chat__bubble--sent">Not much.</li>
 <li class="chat__bubble chat__bubble--sent">Just writing some CSS.</li>
 <li class="chat__bubble chat__bubble--sent">I just LOVE writing CSS.</li>
 <li class="chat__bubble chat__bubble--sent chat__bubble--stop">Do you?</li>
 <li class="chat__bubble chat__bubble--rcvd">Yeah!</li>
 <li class="chat__bubble chat__bubble--rcvd">It's super fun.</li>
 <li class="chat__bubble chat__bubble--rcvd chat__bubble--stop">... SUPER fun.</li>
 <li class="chat__bubble chat__bubble--rcvd chat__bubble--stop">What are you up to?</li>
 <li class="chat__bubble chat__bubble--sent">Not much.</li>
 <li class="chat__bubble chat__bubble--sent">Just writing some CSS.</li>
 <li class="chat__bubble chat__bubble--sent">I just LOVE writing CSS.</li>
 <li class="chat__bubble chat__bubble--sent chat__bubble--stop">Do you?</li>
 <li class="chat__bubble chat__bubble--rcvd">Yeah!</li>
 <li class="chat__bubble chat__bubble--rcvd">It's super fun.</li>
 <li class="chat__bubble chat__bubble--rcvd chat__bubble--stop">... SUPER fun.</li>
 <li class="chat__bubble chat__bubble--rcvd chat__bubble--stop">What are you up to?</li>
 <li class="chat__bubble chat__bubble--sent">Not much.</li>
 <li class="chat__bubble chat__bubble--sent">Just writing some CSS.</li>
 <li class="chat__bubble chat__bubble--sent">I just LOVE writing CSS.</li>
 <li class="chat__bubble chat__bubble--sent chat__bubble--stop">Do you?</li>
 <li class="chat__bubble chat__bubble--rcvd">Yeah!</li>
 <li class="chat__bubble chat__bubble--rcvd">It's super fun.</li>
 <li class="chat__bubble chat__bubble--rcvd chat__bubble--stop">... SUPER fun.</li>
 <li class="chat__bubble chat__bubble--rcvd chat__bubble--stop">What are you up to?</li>
 <li class="chat__bubble chat__bubble--sent">Not much.</li>
 <li class="chat__bubble chat__bubble--sent">Just writing some CSS.</li>
 <li class="chat__bubble chat__bubble--sent">I just LOVE writing CSS.</li>
 <li class="chat__bubble chat__bubble--sent chat__bubble--stop">Do you?</li>
 <li class="chat__bubble chat__bubble--rcvd">Yeah!</li>
 <li class="chat__bubble chat__bubble--rcvd">It's super fun.</li>
 <li class="chat__bubble chat__bubble--rcvd chat__bubble--stop">... SUPER fun.</li>
 <li class="chat__bubble chat__bubble--rcvd chat__bubble--stop">What are you up to?</li>
 <li class="chat__bubble chat__bubble--sent">Not much.</li>
 <li class="chat__bubble chat__bubble--sent">Just writing some CSS.</li>
 <li class="chat__bubble chat__bubble--sent">I just LOVE writing CSS.</li>
 <li class="chat__bubble chat__bubble--sent chat__bubble--stop">Do you?</li>
 <li class="chat__bubble chat__bubble--rcvd">Yeah!</li>
 <li class="chat__bubble chat__bubble--rcvd">It's super fun.</li>
 <li class="chat__bubble chat__bubble--rcvd chat__bubble--stop">... SUPER fun.</li>
 <li class="chat__bubble chat__bubble--rcvd chat__bubble--stop">What are you up to?</li>
 <li class="chat__bubble chat__bubble--sent">Not much.</li>
 <li class="chat__bubble chat__bubble--sent">Just writing some CSS.</li>
 <li class="chat__bubble chat__bubble--sent">I just LOVE writing CSS.</li>
 <li class="chat__bubble chat__bubble--sent chat__bubble--stop">Do you?</li>
 <li class="chat__bubble chat__bubble--rcvd">Yeah!</li>
 <li class="chat__bubble chat__bubble--rcvd">It's super fun.</li>
 <li class="chat__bubble chat__bubble--rcvd chat__bubble--stop">... SUPER fun.</li>
</ul>
</div>

<div id="home1" class="tab-pane fade ">
<ul class="chat">
 <li class="chat__bubble chat__bubble--rcvd chat__bubble--stop">What are you up to?</li>
 <li class="chat__bubble chat__bubble--sent">Not much.</li>
 <li class="chat__bubble chat__bubble--sent">Just writing some CSS.</li>
 <li class="chat__bubble chat__bubble--sent">I just LOVE writing CSS.</li>
 <li class="chat__bubble chat__bubble--sent chat__bubble--stop">Do you?</li>
 <li class="chat__bubble chat__bubble--rcvd">Yeah!</li>
 <li class="chat__bubble chat__bubble--rcvd">It's super fun.</li>
 <li class="chat__bubble chat__bubble--rcvd chat__bubble--stop">... SUPER fun.</li>
</ul>
</div>

<div id="home2" class="tab-pane fade">
<ul class="chat">
 <li class="chat__bubble chat__bubble--rcvd chat__bubble--stop">What are you up to?</li>
 <li class="chat__bubble chat__bubble--sent">Not much.</li>
 <li class="chat__bubble chat__bubble--sent">Just writing some CSS.</li>
 <li class="chat__bubble chat__bubble--sent">I just LOVE writing CSS.</li>
 <li class="chat__bubble chat__bubble--sent chat__bubble--stop">Do you?</li>
 <li class="chat__bubble chat__bubble--rcvd">Yeah!</li>
 <li class="chat__bubble chat__bubble--rcvd">It's super fun.</li>
 <li class="chat__bubble chat__bubble--rcvd chat__bubble--stop">... SUPER fun.</li>
</ul>
</div>

<div id="home3" class="tab-pane fade">
<ul class="chat">
 <li class="chat__bubble chat__bubble--rcvd chat__bubble--stop">What are you up to?</li>
 <li class="chat__bubble chat__bubble--sent">Not much.</li>
 <li class="chat__bubble chat__bubble--sent">Just writing some CSS.</li>
 <li class="chat__bubble chat__bubble--sent">I just LOVE writing CSS.</li>
 <li class="chat__bubble chat__bubble--sent chat__bubble--stop">Do you?</li>
 <li class="chat__bubble chat__bubble--rcvd">Yeah!</li>
 <li class="chat__bubble chat__bubble--rcvd">It's super fun.</li>
 <li class="chat__bubble chat__bubble--rcvd chat__bubble--stop">... SUPER fun.</li>
</ul>
</div>
</div>
</div>
</div>
</body>
</html>