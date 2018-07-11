<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
<title>Facebook</title>

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
        
       // $interval(function(){
         $http({
             method : "POST",
             url : "/myTimeLine/"
            }).then(function mySuccess(response) {
                $scope.timeline = response.data;
                }, function myError(response) {
             $scope.timeline = response.statusText;          
                 });
         $http({
             method : "POST",
             url : "/myFriendz/"
            }).then(function mySuccess(response) {
                $scope.friendz = response.data;
                }, function myError(response) {
             $scope.friendz = response.statusText;          
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
  //},10000);
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
							<!-- <div class="thumbnail thumbnail-post" ng-repeat="u in results">
                      <div><img src="{{u.dp}}" height="50px" width="50px">{{u.name}}</div>
                        </div>-->
						</div>
					</div>
				</form>
				<ul class="nav navbar-nav navbar-right">
					<li><a href="/home">Home</a></li>
					<li><a href="#" class="fa fa-user" alt="resquest"></a></li>
					<li><a href="#" class="fa fa-comments" alt="inbox"></a></li>
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




	<div class="container">

		<div class="col-sm-12">
			<div class="thumbnail thumbnail-grand-profile">
				<div class="caption caption-grand-profile">
					<img class="caption img-thumbnail" src="${dp}" style="width: 240px; height: 240px;"/>
					<h3 class="title-grand-profile">${name}</h3>
				</div>
				<img src="${cover}" class="img-responsive"
					style="width: 100%; height: 300px; background: #269abc;" />

				<ul class="nav nav-pills nav-grand-profile">
					<li role="presentation" class="active"><a data-toggle="tab"
						href="#timeline">Wall</a></li>
					<li role="presentation"><a data-toggle="tab" href="#">Information</a></li>
					<li role="presentation"><a data-toggle="tab" href="#friends">Friends</a></li>
					<li role="presentation"><a data-toggle="tab" href="#">Pictures</a></li>
				</ul>
			</div>
		</div>

		<aside class="col-sm-3">
			<div class="panel panel-default">
				<div class="panel-heading">About</div>
				<div class="panel-body">Panel content</div>
			</div>
		</aside>


		<!--timeline-->
		<section class="timeline col-sm-9">
			<div class="tab-content">

				<div id="timeline" class="tab-pane fade in active">
					<div id="statusdiv" class='thumbnail thumbnail-post'>
						<!--caption-->
						<div class='caption'>
							<div class="panel panel-heading"></div>
							<form action="/postStatus" method="POST">
							<div class='media'>
								<div class='media-left'>
									<a href='/home' class='image-post'> <img
										src='images/pk.jpg' width=150px height='160px'>
									</a>
								</div>
								<div class='media-body'>
									<p>
										<textarea class="statusboxmagic" cols="60" name="status"
											id="statusbox" style="height: 62px; overflow: hidden;"
											placeholder="What's on your mind ?"></textarea>
									</p>
								</div>
							</div>
							<div class="panel panel-heading"></div>
							<div class="media-bottom">
								<div id="postcofirmation"></div>
								<div class="row">
									<div class="col-md-6">
										<div class="form-group">
											<div class="btn-group">
												<button id="checkin" type="button" class="btn btn-default">
													<span class="fa fa-map-marker"></span> Location
												</button>
												<label for="photochoose" type="button"
													class="btn btn-default"><input id="photochoose"
													type="file" style="display: none"><span
													class="fa fa-picture-o"></span> Photo</label>
												<p id="loc"></p>
												<div id="map" style="width: 500px; height: 500px" hidden=""></div>
											</div>
										</div>
									</div>
									<div class="col-md-6">
										<div class="form-group">
											<select id="privacy" style="width: 100px" name="privacy"
												class="form-control privacy-dropdown pull-left input-sm">
												<option value="1" selected="selected">Public</option>
												<option value="2">Only my friends</option>
												<option value="3">Only me</option>
											</select> &nbsp; <input type="submit" class='btn btn-primary'
												style="height: 30px" id="poststatus" value="Post">
										</div>
									</div>
								</div>
							</div>
							</form>
						</div>
						<!--#caption-->
					</div>

					<div class="thumbnail thumbnail-post" ng-repeat="x in timeline">
						<div class="caption">
							<div class="media">
								<div class="media-left">
									<a href="#" class="image-post"> <img ng-if="x[1] != ''"
										src="{{x[1]}}" style="width: 50; height: 50" />
									</a>
								</div>
								<div class="media-body">
									<a class="media-heading title-post" href="/{{x[5]}}">{{x[0]}}</a>
									<h5 class="time-post">{{x[3]}} minutes ago</h5>
								</div>
							</div>
							<p>{{x[2]}}</p>

							<div ng-if="x[4] != ''">
								<a href="#" tyle="width: 100%;height: 200px;display: block;">
									<img ng-if="x[4] != ''" src="{{x[4]}}" class="image-post-full" />
								</a>
							</div>

						</div>
						<!--#caption-->
						<div class="links-post">
							<span class="fa fa-thumbs-o-up link-post"></span><a href="#"
								class="link-post" role="button">Like</a> <span
								class="fa fa-comment link-post"></span><a href="#"
								class="link-post" role="button">Comment</a> <span
								class="fa fa-reply link-post"></span><a href="#"
								class="link-post" role="button">Share</a>
						</div>
					</div>
				</div>
				<div id="friends" class="tab-pane fade">
				<div class="thumbnail row">
					<div class="thumbnail thumbnail-post col-sm-7" ng-repeat="x in friendz">
						<div class="caption">
							<div class="media">
								<div class="media-left">
									<a href="/{{x[2]}}" class="image-post"> <img ng-if="x[1] != ''"
										src="{{x[1]}}" style="width: 50px; height: 50px" />
									</a>
								</div>
								<div class="media-body">
								<h5></h5>
									<a class="media-heading title-post" href="/{{x[2]}}">{{x[0]}}</a>
								</div>
								<div class="media-right" >
									<h5></h5>
									<Button>Friends</Button>
								</div>
							</div>
						</div>
						<!--#caption-->
					</div>
					</div>
				</div>
			</div>
			<!--#post timeline-->
		</section>
		<!--#timeline-->
	</div>
	<!--#container-->
	<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->

</body>
</html>