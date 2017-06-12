<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!--to make responsive according to device screen-->
<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
<title>pkzite</title>

<!-- Bootstrap -->
<link href="<c:url value="/css/bootstrap.min.css" />" rel="stylesheet" />
<link href="<c:url value="/css/font-awesome.min.css" />"
	rel="stylesheet" />
<link href="<c:url value="/css/style.css" />" rel="stylesheet" />
<script type="text/javascript" src="<c:url value="/js/jquery.js"/>"></script>
<script type="text/javascript" src="<c:url value="/js/jqueryval.js"/>"></script>
<script type="text/javascript" src="<c:url value="/js/holder.js"/>"></script>
</head>
<body>
	<%@include file="header.jsp"%>
	<div class="container">

		<!--//dp part and left part-->
		<div class="col-sm-12">


			<div class="thumbnail thumbnail-grand-profile">
				<table>
					<tr>
						<td><div class="caption" id="dp">
								<img class='img-thumbnail img-responsive'
									src="<c:url value="/images/${dp}" />" width=150px
									height='160px'>
							</div></td>

						<td>
							<div class="caption caption-grand-profile">
								<h3 class="title-grand-profile">${name}</h3>
							</div>
						</td>
					</tr>
				</table>
				<ul class="nav nav-pills nav-grand-profile">
					<li role="presentation" class="active"><a data-toggle="tab"
						href="#wall-home">Timeline</a></li>
					<li role="presentation"><a data-toggle="pill" href="#">Information</a></li>
					<li role="presentation"><a id="friendz" data-toggle="tab"
						href="#dost">Friends</a></li>
					<li role="presentation"><a data-toggle="tab"
						href="#photos-home">Pictures</a></li>
				</ul>
			</div>
		</div>

		<aside class="col-sm-3">
			<div class="panel panel-default">
				<div class="panel-heading">
					<a href="about.jsp">About</a>
				</div>
				<div class="panel-body">Panel content</div>
			</div>
		</aside>

		<!--timeline-->
		<section class="timeline col-sm-6">
			<div class="tab-content">

				<div id="wall-home" class="tab-pane fade in active">
					<!--wall posts-->



					<!--post Timeline-->
					<div id="statusdiv" class='thumbnail thumbnail-post'>
						<!--caption-->
						<div class='caption'>

							<div class="panel panel-heading"></div>
							<div class='media'>
								<div class='media-left'>
									<a href='${id}' class='image-post'> <img
										src="<c:url value="/images/${dp}" />" width=150px
										height='160px'>

									</a>
								</div>
								<div class='media-body'>
									<p>
										<textarea class="statusboxmagic" cols="60" name="statusbox"
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
											</select> &nbsp; <input type="button" class='btn btn-primary'
												style="height: 30px" id="poststatus" value="Post">
										</div>
									</div>
								</div>
							</div>

						</div>
						<!--#caption-->

					</div>
					<div id="timeline"></div>


				</div>
				<!--wallhome-->

				<div id="dost" class="tab-pane fade">
					<!--friends area-->
					<h1 align="center">FriendList</h1>
					<div id="friend-content"></div>

				</div>
				<div id="photos-home" class="tab-pane fade">
					<!--photos area-->

				</div>


			</div>
			<!--#post timeline-->
			<!--post Timeline-->
			<div class="thumbnail thumbnail-post">
				<!--caption-->
				<div class="caption">
					<div class="media">
						<div class="media-left">
							<a href="#" class="image-post"> <img
								data-src="holder.js/50x50?theme=social">
							</a>
						</div>
						<div class="media-body">
							<a class="media-heading title-post" href="#">Your Comment
								Title</a>
							<h5>
								3 minutes ago <i class="fa fa-users"></i>
							</h5>
						</div>
						<div class="media-right ">
							<div class="dropdown">
								<a href="#" class="dropdown-toggle" data-toggle="dropdown"
									role="button" aria-haspopup="true" aria-expanded="false"><span
									style="color: gray" class="caret"></span></a>
								<ul class="dropdown-menu dropdown-menu-right">
									<li><a href="#"><span
											class='glyphicon glyphicon-trash'>Groups</span></a></li>
								</ul>
							</div>
						</div>
					</div>
					<a href="#" tyle="width: 100%;height: 200px;display: block;"> <img
						data-src="holder.js/700x200?theme=social"
						data-holder-rendered="true" class="image-post-full">
					</a>
				</div>
				<!--#caption-->
				<div class="links-post">
					&nbsp;&nbsp;&nbsp;&nbsp;
					<div>
						<a href="#">14 likes</a>&nbsp;<a href="#">14 dislikes</a>
					</div>
					<span class="fa fa-thumbs-up link-post active "></span><a href="#"
						class="link-post active " role="button">Like</a> <span
						class="fa fa-thumbs-o-down link-post active"></span><a href="#"
						class="link-post active" role="button">Dislike</a> <span
						class="fa fa-comment link-post"></span><a href="#"
						class="link-post" role="button">Comment</a> <span
						class="fa fa-reply link-post"></span><a href="#" class="link-post"
						role="button">Share</a>
				</div>
			</div>
			<!--#post timeline-->




			<div id="loadingx" align="center" hidden="">
				<span class="fa ">Loading More..<img src="images/loader.gif"
					width="25px"></span>
			</div>

		</section>
		<!--#timeline-->
	</div>
	<!--#container-->
	<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->

</body>
</html>