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
<title>KHBiz_MemberManage</title>
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
<script type="text/javascript">
	$(function() {
		var message="${message}";
		if(message !=""){
			swal(message);
		}
		$("#writeBtn").click(function() {
			var memberPosition='${member.position}';
			if(memberPosition != '사장' && memberPosition != '팀장'){
				swal("팀장이상급만 씀");
			}else{
				location.href="noticeWrite";
			}
		});
		
	});

</script>
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
					<li><a href="#"> <i class="pe-7s-user"></i>
							<p>근태관리</p>
					</a></li>
					<li><a> <i class="pe-7s-note2"></i>
							<p>
								전자결재<span class="sub-arrow"></span>
							</p>
					</a>
						<ul>
							<li><a href="/erp/draft/draftWriteForm"><p>문서작성</p></a></li>
							<li><a href="/erp/draft/draft_main"><p>보낸 결재함</p></a></li>
							<li><a href="/erp/draft/draft_main2"><p>받은 결재함</p></a></li>
						</ul></li>
					<li><a href="#"> <i class="pe-7s-news-paper"></i>
							<p>메신저</p>
					</a></li>
					<li><a href="/erp/schedule/scheduler"> <i
							class="pe-7s-science"></i>
							<p>일정관리</p>
					</a></li>
					<li><a href="#"> <i class="pe-7s-map-marker"></i>
							<p>급여관리</p>
					</a></li>
					<li><a href="#"> <i class="pe-7s-bell"></i>
							<p>Notifications</p>
					</a></li>
					<%-- <c:if test="${member.position=='사장'}"> --%>
					<li><a href="#"> <i class="pe-7s-rocket"></i>
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
						<div class="col-md-12">
							<div class="card">
								<div class="header">
									<h4 class="title">공지사항</h4>
									<p class="category">Member List & Management</p>
								</div>
								<div class="content">
									
									<div id="NoticeCenter">
										<table border="1">
											<tr>
												<td>번호</td>
												<td>작성자</td>
												<td>제목</td>
												<td>작성일</td>
												<td>조회수</td>
											</tr>
											<c:forEach items="${notice}" var="notice">
											<tr>
												<td>${notice.notice_num}</td>
												<td>${notice.notice_writer}</td>
												<td><a href="noticeView?notice_num=${notice.notice_num}&&curPage=${page.curPage}">${notice.notice_title}</a></td>
												<td>${notice.notice_date}</td>
												<td>${notice.notice_counts}</td>
											</tr>
											</c:forEach>
											
										</table>
										<c:if test="${page.curBlock>1}">
										 	<input type="button" value="[이전]">
										</c:if>
										<c:forEach begin="${page.startNum}" end="${page.lastNum}" var="i">
											<a href="noticeList?curPage=${i}"><input type="button" value="${i}"></a>
										</c:forEach>
										<c:if test="${page.curBlock<page.totalBlock}">
											 <input type="button" value="[다음]">
										</c:if>
										<input type="button" value="글쓰기" id="writeBtn">
									</div>
									
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
	<div id="fullCalModal" class="modal fade">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">
						<span aria-hidden="true">×</span> <span class="sr-only"></span>
					</button>
					
				</div>
				
				
			</div>
		</div>
	</div>
</body>
</html>