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

<!-- Light Bootstrap Table Core javascript and methods for Demo purpose -->
<script src="/erp/js/light-bootstrap-dashboard.js"></script>

<script type="text/javascript">
var now = new Date();
	$(document).ready(function() {
						$.ajax({
									url : "http://apis.skplanetx.com/weather/current/minutely",
									type : "GET",
									beforeSend : function(request) {
										request
												.setRequestHeader("appKey",
														"26f2f47c-73b8-398c-b042-f1593a17265b");
									},
									data : {
										version : 1,
										lat : 37.4988407,
										lon : 127.0326051
									},
									success : function(data) {
										$('#weather_today_sky')
												.attr(
														'src',
														"/erp/img/weather_icons/"
																+ data.weather.minutely[0].sky.code
																+ ".png");
										$('#today_temp')
												.html(
														data.weather.minutely[0].temperature.tc
																+ "℃");
										$('#weather_time')
												.html(
														data.weather.minutely[0].timeObservation
																+ " 발표");
									}
								});
						$
								.ajax({
									url : "http://apis.skplanetx.com/weather/forecast/3days",
									type : "GET",
									beforeSend : function(request) {
										request
												.setRequestHeader("appKey",
														"26f2f47c-73b8-398c-b042-f1593a17265b");
									},
									data : {
										version : 1,
										lat : 37.4988407,
										lon : 127.0326051,
										city : '서울',
										county : '강남구',
										village : '역삼'
									},
									success : function(data) {
										$('#weather_tomorrow7_sky')
												.attr(
														'src',
														"/erp/img/weather_icons/"
																+ data.weather.forecast3days[0].fcst3hour.sky.code22hour
																+ ".png");
										$('#weather_tomorrow19_sky')
												.attr(
														'src',
														"/erp/img/weather_icons/"
																+ data.weather.forecast3days[0].fcst3hour.sky.code28hour
																+ ".png");
										$('#tomorrow7_temp')
												.html(
														data.weather.forecast3days[0].fcst3hour.temperature.temp22hour
																+ "℃");
										$('#tomorrow19_temp')
												.html(
														data.weather.forecast3days[0].fcst3hour.temperature.temp28hour
																+ "℃");
									}
								});
						var events_array = [];
						$.ajax({
							url : "/erp/s_json/getSchedule?code=${member.code}",
							type : "get",
							success : function (data) {
								
								for ( var i in data) {
									var start="";
									var end="";
									var color ="#3a87ad";
									if(data[i].starttime == null){
										data[i].starttime = '--:--';
										start = data[i].startdate;
									}else{
										start = data[i].startdate+"T"+data[i].starttime;
									}
									if(data[i].endtime == null){
										data[i].endtime = '--:--';
										end = data[i].enddate;
									}else{
										end = data[i].enddate+"T"+data[i].endtime;
									}
									if(data[i].contents == null){
										data[i].contents = data[i].title;
									}
									if(data[i].code ==0){
										color = '#cc0000';
									}
									var schedule_object = {
										title : data[i].title,			
										start : start,
										end : end,
										color : color,
										content : data[i].startdate+'T'+data[i].starttime+'&nbsp;~&nbsp;'+data[i].enddate+'T'+data[i].endtime+'<br>'+data[i].contents,
										id : data[i].s_num,
									};
									events_array.push(schedule_object);
								}
								
								$('#calendar').fullCalendar({
									defaultDate : now,
									editable : true,
									eventLimit : true, // allow "more" link when too many events
									events : events_array,
								});
									
							}
						});
			/* $.notify({
	            	icon: 'pe-7s-bell',
	            	message: "새로운 메세지"
            },{
                type: 'info',
                timer: 4000
            }); */
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
<!-- 제작 -->
<link rel="stylesheet" type="text/css" href="/erp/css/dashboard.css">
<!-- scheduler -->
<link href='/erp/css/fullcalendar.css' rel='stylesheet' />
<link href='/erp/css/fullcalendar.print.css' rel='stylesheet'
	media='print' />
<script src='/erp/js/moment.min.js'></script>
<script src='/erp/js/fullcalendar.min.js'></script>
<script src='/erp/js/datepicker.js'></script>
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
					<a href="/erp/dash" class="simple-text"><img alt="khbiz_log"
						src="/erp/images/khbiz.png" style="width: 60%;"></a>
				</div>

				<ul class="nav side-navi">
					<li class="active"><a href="/erp/dash"> <i
							class="pe-7s-graph"></i>
							<p>Dashboard</p>
					</a></li>
					<c:if test="${member.department=='인사팀' }">
						<li><a href="/erp/attendmanage/attendmanage"> <i
								class="pe-7s-user"></i>
								<p>근태관리</p>
						</a></li>
					</c:if>
					<li><a> <i class="pe-7s-mail-open-file"></i>
							<p>
								전자결재<span class="sub-arrow"></span>
							</p>
					</a>
						<ul>
							<li><a href="/erp/draft/draftWriteForm"><p>문서작성</p></a></li>
							<li><a href="/erp/draft/draft_main"><p>보낸 결재함</p></a></li>
							<li><a href="/erp/draft/draft_main2"><p>받은 결재함</p></a></li>
						</ul></li>
					<li><a onclick="window.open('/erp/chat')"> <i class="pe-7s-news-paper"></i>
							<p>메신저</p>
					</a></li>
					<li><a href="/erp/schedule/scheduler"> <i
							class="pe-7s-note2"></i>
							<p>일정관리</p>
					</a></li>
					<li><a href="/erp/member/memberContactList"> <i
							class="pe-7s-users"></i>
							<p>주소록</p>
					</a></li>
					<li><a href="/erp/databoardList"> <i
							class="pe-7s-drawer"></i>
							<p>자료실</p>
					</a></li>
					<c:if test="${member.department=='인사팀' && member.position_Rank<3 || member.position_Rank==1}">
					<li><a href="/erp/member/memberOriginList"> <i
							class="pe-7s-users"></i>
							<p>사원관리</p>
					</a></li>					
					</c:if>
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
							<li class="dropdown"><a href="#" class="dropdown-toggle"
								data-toggle="dropdown"> <i class="fa fa-globe"></i> <b
									class="caret"></b> <span class="notification">${getDueList.size()+reportDueList.size()}</span>
							</a>
								<ul class="dropdown-menu">
									<c:forEach items="${getDueList}" var="get">
										<li><a href="/erp/draft/getWaitList">${get.title }</a></li>
									</c:forEach>
									<li class="divider"></li>
									<c:forEach items="${reportDueList}" var="report">
										<li><a href="/erp/draft/reportWaitList">${report.title }</a></li>
									</c:forEach>
								</ul></li>
						</ul>

						<ul class="nav navbar-nav navbar-right">
							<li><a href="/erp/member/memberView">${member.name}님</a></li>
							<li><a href="/erp/member/memberView"> 정보 보기 </a></li>
							<li><a href="/erp/member/memberLogout"> Log out </a></li>
						</ul>
					</div>
				</div>
			</nav>


			<div class="content">
				<div class="container-fluid">
					<div class="row">
						<div class="col-md-6">
							<div class="card">
								<div class="header">
									<h4 class="title">달력</h4>
									<p class="category"></p>
								</div>
								<div class="content">
									<div id="calendar"></div>
									<div class="footer">
										<div class="legend">
											<i class="fa fa-circle" style="color: #3a87ad"></i> 일정
											<i class="fa fa-circle" style="color: #cc0000"></i> 회사 일정 
										</div>
										<hr>
										<div class="stats">
											
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="col-md-5">
							<div class="container-fluid">
								<div class="row">
									<div class="col-md-12">
										<div class="card">
											<div class="header">
												<h4 class="title">Weather</h4>
												<p class="category">날씨정보</p>
											</div>
											<div class="content">
												<div class="container-fluid">
													<div class="row">
														<div class="col-md-4">
															<img id="weather_today_sky"
																style="width: 80%;">
															<p>
																현재 <br> <span id="today_temp"></span>
															</p>
														</div>
														<div class="col-md-4">
															<img id="weather_tomorrow7_sky"
																style="width: 80%;">
															<p>
																내일 오전<br> <span id="tomorrow7_temp"></span>
															</p>
														</div>
														<div class="col-md-4">
															<img id="weather_tomorrow19_sky"
																style="width: 80%;">
															<p>
																내일 오후<br> <span id="tomorrow19_temp"></span>
															</p>
														</div>
													</div>
												</div>
												<div class="footer">
													<div class="legend"></div>
													<hr>
													<div class="stats">
														<i class="fa fa-clock-o"></i><span id="weather_time"></span>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
								<div class="row">
									<div class="col-md-12">
										<div class="card ">
											<div class="header">
												<h4 class="title">Today</h4>
												<p class="category">오늘 일정</p>
											</div>
											<div class="content">
												<table class="table">
													<c:forEach items="${list}" var="list">
														<tr>
															<td>${list.title}</td>
															<td>${list.contents}</td>
															<td>${list.starttime}~${list.endtime}</td>
														</tr>
													</c:forEach>
												</table>
												<div class="footer">
													<div class="legend"></div>
													<hr>
													<div class="stats">
														<i class="fa fa-check"></i> Today Schedule
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
								<div class="row">
									<div class="col-md-12">
										<div class="card ">
											<div class="header">
												<h4 class="title">Tomorrow</h4>
												<p class="category">내일 일정</p>
											</div>
											<div class="content">
												<table class="table">
													<c:forEach items="${tomorrow}" var="list">
														<tr>
															<td>${list.title}</td>
															<td>${list.contents}</td>
															<td>${list.starttime}~${list.endtime}</td>
														</tr>
													</c:forEach>
												</table>
												<div class="footer">
													<div class="legend"></div>
													<hr>
													<div class="stats">
														<i class="fa fa-check"></i> Tomorrow Schedule
													</div>
												</div>
											</div>
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