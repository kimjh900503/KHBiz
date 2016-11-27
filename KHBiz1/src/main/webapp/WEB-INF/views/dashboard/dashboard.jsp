<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta
	content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0'
	name='viewport' />
<link rel="icon" type="image/png" href="assets/img/favicon.ico">
<meta name="viewport" content="width=device-width" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>KHBiz_DashBoard</title>
<!-- Favicon -->
<link rel="shortcut icon" href="/erp/images/favicon.ico">
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<!-- jQuery library -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>

<!-- Latest compiled JavaScript -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<!--  Checkbox, Radio & Switch Plugins -->
<script src="/erp/js/bootstrap-checkbox-radio-switch.js"></script>

<!--  Charts Plugin -->
<script src="/erp/js/chartist.min.js"></script>

<!--  Notifications Plugin    -->
<script src="/erp/js/bootstrap-notify.js"></script>

<!--  Google Maps Plugin    -->
<script type="text/javascript"
	src="https://maps.googleapis.com/maps/api/js?sensor=false"></script>

<!-- Light Bootstrap Table Core javascript and methods for Demo purpose -->
<script src="/erp/js/light-bootstrap-dashboard.js"></script>

<script type="text/javascript">
	$(document).ready(function() {

	});
</script>
<!-- Bootstrap core CSS     -->
<link href="/erp/css/dashboard/bootstrap.min.css" rel="stylesheet" />

<!-- Animation library for notifications   -->
<link href="/erp/css/dashboard/animate.min.css" rel="stylesheet" />

<!--  Light Bootstrap Table core CSS    -->
<link href="/erp/css/dashboard/light-bootstrap-dashboard.css"
	rel="stylesheet" />
<!--     Fonts and icons     -->
<link
	href="http://maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css"
	rel="stylesheet">
<link href='http://fonts.googleapis.com/css?family=Roboto:400,700,300'
	rel='stylesheet' type='text/css'>
<link href="/erp/css/dashboard/pe-icon-7-stroke.css" rel="stylesheet" />
<!-- alert -->
<script src="/erp/js/sweetalert.min.js"></script>
<link rel="stylesheet" type="text/css" href="/erp/css/sweetalert.css">

<link rel="stylesheet" type="text/css" href="/erp/css/dashboard.css">
</head>
<body>
	<div class="wrapper">
		<div class="sidebar" data-color="azure"
			data-image="/erp/images/sidebar-5.jpg">

			<!--
        Tip 1: you can change the color of the sidebar using: data-color="blue | azure | green | orange | red | purple"
        Tip 2: you can also add an image using data-image tag
    -->

			<div class="sidebar-wrapper">
				<div class="logo">
					<a href="/erp/dash" class="simple-text"> KH Biz </a>
				</div>

				<ul class="nav side-navi">
					<li class="active"><a href="/erp/dash"> <i
							class="pe-7s-graph"></i>
							<p>Dashboard</p>
					</a></li>
					<li><a href=""> <i class="pe-7s-user"></i>
							<p>근태관리</p>
					</a></li>
					<li><a> <i class="pe-7s-note2"></i>
							<p>
								전자결재<span class="sub-arrow"></span>
							</p>
					</a>
						<ul>
							<li><a href="#"><p>기안문서</p></a></li>
							<li><a href="#"><p>결재문서</p></a></li>
						</ul></li>
					<li><a href=""> <i class="pe-7s-news-paper"></i>
							<p>메신저</p>
					</a></li>
					<li><a href=""> <i class="pe-7s-science"></i>
							<p>일정관리</p>
					</a></li>
					<li><a href=""> <i class="pe-7s-map-marker"></i>
							<p>급여관리</p>
					</a></li>
					<li><a href=""> <i class="pe-7s-bell"></i>
							<p>Notifications</p>
					</a></li>
					<%-- <c:if test="${member.position=='사장'}"> --%>
					<li><a href=""> <i class="pe-7s-rocket"></i>
							<p>관리자 모드</p>
					</a></li>
					<%-- </c:if> --%>
				</ul>
			</div>
		</div>

		<div class="main-panel">
			<nav class="navbar navbar-default navbar-fixed">
				<div class="container-fluid">
					<div class="navbar-header">
						<button type="button" class="navbar-toggle" data-toggle="collapse"
							data-target="#navigation-example-2">
							<span class="sr-only">Toggle navigation</span> <span
								class="icon-bar"></span> <span class="icon-bar"></span> <span
								class="icon-bar"></span>
						</button>
						<a class="navbar-brand" href="/erp/dash">Dashboard</a>
					</div>
					<div class="collapse navbar-collapse">
						<ul class="nav navbar-nav navbar-left">
							<li><a href="#" class="dropdown-toggle"
								data-toggle="dropdown"> <i class="fa fa-dashboard"></i>
							</a></li>
							<li class="dropdown"><a href="#" class="dropdown-toggle"
								data-toggle="dropdown"> <i class="fa fa-globe"></i> <b
									class="caret"></b> <span class="notification">5</span>
							</a>
								<ul class="dropdown-menu">
									<li><a href="#">Notification 1</a></li>
									<li><a href="#">Notification 2</a></li>
									<li><a href="#">Notification 3</a></li>
									<li><a href="#">Notification 4</a></li>
									<li><a href="#">Another notification</a></li>
								</ul></li>
							<li><a href=""> <i class="fa fa-search"></i>
							</a></li>
						</ul>

						<ul class="nav navbar-nav navbar-right">
							<li><a>${member.name}님</a></li>
							<li><a href="/erp/member/memberView"> 정보 보기 </a></li>
							<li class="dropdown"><a href="#" class="dropdown-toggle"
								data-toggle="dropdown"> Dropdown <b class="caret"></b>
							</a>
								<ul class="dropdown-menu">
									<li><a href="#">Action</a></li>
									<li><a href="#">Another action</a></li>
									<li><a href="#">Something</a></li>
									<li><a href="#">Another action</a></li>
									<li><a href="#">Something</a></li>
									<li class="divider"></li>
									<li><a href="#">Separated link</a></li>
								</ul></li>
							<li><a href="/erp/member/memberLogout"> Log out </a></li>
						</ul>
					</div>
				</div>
			</nav>


			<div class="content">
				<div class="container-fluid">
					<div class="row">
						<div class="col-md-4">
							<div class="card">
								<div class="header">
									<h4 class="title">Email Statistics</h4>
									<p class="category">Last Campaign Performance</p>
								</div>
								<div class="content">
									<div id="chartPreferences" class="ct-chart ct-perfect-fourth"></div>

									<div class="footer">
										<div class="legend">
											<i class="fa fa-circle text-info"></i> Open <i
												class="fa fa-circle text-danger"></i> Bounce <i
												class="fa fa-circle text-warning"></i> Unsubscribe
										</div>
										<hr>
										<div class="stats">
											<i class="fa fa-clock-o"></i> Campaign sent 2 days ago
										</div>
									</div>
								</div>
							</div>
						</div>

						<div class="col-md-8">
							<div class="card">
								<div class="header">
									<h4 class="title">Users Behavior</h4>
									<p class="category">24 Hours performance</p>
								</div>
								<div class="content">
									<div id="chartHours" class="ct-chart"></div>
									<div class="footer">
										<div class="legend">
											<i class="fa fa-circle text-info"></i> Open <i
												class="fa fa-circle text-danger"></i> Click <i
												class="fa fa-circle text-warning"></i> Click Second Time
										</div>
										<hr>
										<div class="stats">
											<i class="fa fa-history"></i> Updated 3 minutes ago
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>



					<div class="row">
						<div class="col-md-6">
							<div class="card ">
								<div class="header">
									<h4 class="title">2014 Sales</h4>
									<p class="category">All products including Taxes</p>
								</div>
								<div class="content">
									<div id="chartActivity" class="ct-chart"></div>

									<div class="footer">
										<div class="legend">
											<i class="fa fa-circle text-info"></i> Tesla Model S <i
												class="fa fa-circle text-danger"></i> BMW 5 Series
										</div>
										<hr>
										<div class="stats">
											<i class="fa fa-check"></i> Data information certified
										</div>
									</div>
								</div>
							</div>
						</div>

						<div class="col-md-6">
							<div class="card ">
								<div class="header">
									<h4 class="title">Tasks</h4>
									<p class="category">Backend development</p>
								</div>
								<div class="content">
									<div class="table-full-width">
										<table class="table">
											<tbody>
												<tr>
													<td><label class="checkbox"> <input
															type="checkbox" value="" data-toggle="checkbox">
													</label></td>
													<td>Sign contract for "What are conference organizers
														afraid of?"</td>
													<td class="td-actions text-right">
														<button type="button" rel="tooltip" title="Edit Task"
															class="btn btn-info btn-simple btn-xs">
															<i class="fa fa-edit"></i>
														</button>
														<button type="button" rel="tooltip" title="Remove"
															class="btn btn-danger btn-simple btn-xs">
															<i class="fa fa-times"></i>
														</button>
													</td>
												</tr>
												<tr>
													<td><label class="checkbox"> <input
															type="checkbox" value="" data-toggle="checkbox"
															checked="">
													</label></td>
													<td>Lines From Great Russian Literature? Or E-mails
														From My Boss?</td>
													<td class="td-actions text-right">
														<button type="button" rel="tooltip" title="Edit Task"
															class="btn btn-info btn-simple btn-xs">
															<i class="fa fa-edit"></i>
														</button>
														<button type="button" rel="tooltip" title="Remove"
															class="btn btn-danger btn-simple btn-xs">
															<i class="fa fa-times"></i>
														</button>
													</td>
												</tr>
												<tr>
													<td><label class="checkbox"> <input
															type="checkbox" value="" data-toggle="checkbox"
															checked="">
													</label></td>
													<td>Flooded: One year later, assessing what was lost
														and what was found when a ravaging rain swept through
														metro Detroit</td>
													<td class="td-actions text-right">
														<button type="button" rel="tooltip" title="Edit Task"
															class="btn btn-info btn-simple btn-xs">
															<i class="fa fa-edit"></i>
														</button>
														<button type="button" rel="tooltip" title="Remove"
															class="btn btn-danger btn-simple btn-xs">
															<i class="fa fa-times"></i>
														</button>
													</td>
												</tr>
												<tr>
													<td><label class="checkbox"> <input
															type="checkbox" value="" data-toggle="checkbox">
													</label></td>
													<td>Create 4 Invisible User Experiences you Never Knew
														About</td>
													<td class="td-actions text-right">
														<button type="button" rel="tooltip" title="Edit Task"
															class="btn btn-info btn-simple btn-xs">
															<i class="fa fa-edit"></i>
														</button>
														<button type="button" rel="tooltip" title="Remove"
															class="btn btn-danger btn-simple btn-xs">
															<i class="fa fa-times"></i>
														</button>
													</td>
												</tr>
												<tr>
													<td><label class="checkbox"> <input
															type="checkbox" value="" data-toggle="checkbox">
													</label></td>
													<td>Read "Following makes Medium better"</td>
													<td class="td-actions text-right">
														<button type="button" rel="tooltip" title="Edit Task"
															class="btn btn-info btn-simple btn-xs">
															<i class="fa fa-edit"></i>
														</button>
														<button type="button" rel="tooltip" title="Remove"
															class="btn btn-danger btn-simple btn-xs">
															<i class="fa fa-times"></i>
														</button>
													</td>
												</tr>
												<tr>
													<td><label class="checkbox"> <input
															type="checkbox" value="" data-toggle="checkbox">
													</label></td>
													<td>Unfollow 5 enemies from twitter</td>
													<td class="td-actions text-right">
														<button type="button" rel="tooltip" title="Edit Task"
															class="btn btn-info btn-simple btn-xs">
															<i class="fa fa-edit"></i>
														</button>
														<button type="button" rel="tooltip" title="Remove"
															class="btn btn-danger btn-simple btn-xs">
															<i class="fa fa-times"></i>
														</button>
													</td>
												</tr>
											</tbody>
										</table>
									</div>

									<div class="footer">
										<hr>
										<div class="stats">
											<i class="fa fa-history"></i> Updated 3 minutes ago
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>


			<footer class="footer">
				<div class="container-fluid">
					<nav class="pull-left">
						<ul>
							<li><a href="/erp/home"> Home </a></li>
							<li><a href="#"> Company </a></li>
						</ul>
					</nav>
					<p class="pull-right">
						<!-- <a href="http://www.creative-tim.com">Creative Tim</a> -->
						&copy; 2016 <a href="/erp/home">2ㄱㄹㅇ</a>, made with love for a
						better web
					</p>
				</div>
			</footer>

		</div>
	</div>
</body>
</html>