<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta
	content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0'
	name='viewport' />
<link rel="icon" type="image/png" href="assets/img/favicon.ico">
<meta name="viewport" content="width=device-width" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>KHBiz_Drafting</title>
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
	$(document).ready(function() {
		$('.wait_view').click(function () {
			$.ajax({
				url:"getWaitView",
				type:"GET",
				data:{d_num:$(this).attr("id")},
				success:function(data){
					$(".modal-content").html(data);
				}
			});
		});
		$('.fin_view').click(function () {
			$.ajax({
				url:"getFinView",
				type:"GET",
				data:{d_num:$(this).attr("id")},
				success:function(data){
					$(".modal-content").html(data);
				}
			});
		});
		$('.back_view').click(function () {
			$.ajax({
				url:"getBackView",
				type:"GET",
				data:{d_num:$(this).attr("id")},
				success:function(data){
					$(".modal-content").html(data);
				}
			});
		});
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
					<li><a href="/erp/dash"> <i
							class="pe-7s-graph"></i>
							<p>Dashboard</p>
					</a></li>
					<c:if test="${member.department=='인사팀' }">
						<li><a href="/erp/attendmanage/attendmanage"> <i
								class="pe-7s-user"></i>
								<p>근태관리</p>
						</a></li>
					</c:if>
					<li class="active"><a> <i class="pe-7s-mail-open-file"></i>
							<p>
								전자결재<span class="sub-arrow"></span>
							</p>
					</a>
						<ul>
							<li><a href="/erp/draft/draftWriteForm"><p>문서작성</p></a></li>
							<li><a href="/erp/draft/draft_main"><p>보낸 결재함</p></a></li>
							<li class="active"><a href="/erp/draft/draft_main2"><p>받은 결재함</p></a></li>
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
						<a class="navbar-brand" href="/erp/draft/draft_main2">받은 결재함</a>
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
						<div class="col-md-4">
							<div class="card">
								<div class="header">
									<h4 class="title" onclick="location.href='getWaitList '">결재대기함</h4>
									<p class="category"></p>
								</div>
							<div class="content" >
							<div class="table-full-width"  >
									
									<table class="table" style = "margin-bottom: 0%; text-align:  center;">
											<tr>
												<td  style = "font-weight: bolder; background-color: #f2f2f2; width :  23%;">문서 유형</td>
												<td  style = "font-weight: bolder; background-color: #f2f2f2; width : 24%;">제목</td>
												<td  style = "font-weight: bolder; background-color: #f2f2f2; width : 23%;">기안자</td>
												<td  style = "font-weight: bolder; background-color: #f2f2f2; width :  30%;">결재 만료 일자 </td>
											</tr>
										</table>
										
										<table class="table table-hover" style="text-align:  center;">
											<c:forEach items="${getWaitBox10}" var="wb10">
												<input type="hidden" value="${wb10.d_num }" id="d_num">
												<tr id="${wb10.d_num}" class="wait_view" data-backdrop="true" data-toggle="modal" data-target="#modal-testNew123">
													<td  style = "width : 23%;">${wb10.sheet_kind}</td>
													<td  style = "width : 24%;">${wb10.title }</td>
													<td  style = "width : 23%;">${wb10.name}</td>
													<td  style = "width : 30%;">${wb10.due_per_date}</td>
												</tr>
											</c:forEach>
											<tr>
                                    <td colspan="5" class="divider"></td>
                                 </tr>
										</table>
									</div>
									<div class="footer">
										<div class="legend">
											<button class="btn btn-defalut" onclick="location.href='getWaitList'">더보기</button>
										</div>
										<hr>
									
									</div>
								</div>
							</div>
						</div>

						<div class="col-md-4">
							<div class="card">
								<div class="header">
									<h4 class="title" onclick="location.href='getFinList'">결재완료함</h4>
									<p class="category"></p>
								</div>
								<div class="content">
									<div class="table-full-width"  style="text-align:  center;">
									<table class="table" style = "margin-bottom: 0%; text-align:  center;">
											<tr>
												<td  style = "font-weight: bolder; background-color: #f2f2f2; width : 23%;">문서 유형</td>
												<td  style = "font-weight: bolder; background-color: #f2f2f2; width : 24%;">제목</td>
												<td  style = "font-weight: bolder; background-color: #f2f2f2; width : 23%;">기안자</td>
												<td  style = "font-weight: bolder; background-color: #f2f2f2; width :  30%;">결재 완료 일자</td>
											</tr>
										</table>
										<table class="table table-hover" style=" text-align:  center;">
											<c:forEach items="${getFinBox10}" var="fb10">
												<input type="hidden" value="${fb10.d_num }" id="d_num">
												<tr id="${fb10.d_num }" class="fin_view" data-backdrop="true" data-toggle="modal" data-target="#modal-testNew123">
													<td  style = "width : 23%;">${fb10.sheet_kind}</td>
													<td  style = "width : 24%;">${fb10.title }</td>
													<td  style = "width : 23%;">${fb10.name}</td>
													<td  style = "width : 30%;">${fb10.approve_date }</td>
												</tr>
											</c:forEach>
											<tr>
                                    <td colspan="5" class="divider"></td>
                                 </tr>
										</table>
									</div>
									<div class="footer">
										<div class="legend">
											<button class="btn btn-defalut" onclick="location.href='getFinList '">더보기</button>
										</div>
										<hr>
							
									</div>
								</div>
							</div>
						</div>
						<div class="col-md-4">
							<div class="card">
								<div class="header">
									<h4 class="title" onclick="location.href='getBackList'">반려함</h4>
									<p class="category"></p>
								</div>
								<div class="content">
									<div class="table-full-width">
									<table class="table" style = "margin-bottom: 0%; text-align:  center;">
											<tr>
												<td  style = "font-weight: bolder; background-color: #f2f2f2; width : 25%;">문서 유형</td>
												<td  style = "font-weight: bolder; background-color: #f2f2f2; width :25%;">제목</td>
												<td  style = "font-weight: bolder; background-color: #f2f2f2; width :25%;">기안자</td>
												<td  style = "font-weight: bolder; background-color: #f2f2f2; width : 25%;">반려 일자</td>
											</tr>
										</table>
										<table class="table table-hover" style=" text-align:  center;">
											<c:forEach items="${getBackBox10}" var="bb10">
												<input type="hidden" value="${bb10.d_num }" id="d_num">
												<tr id="${bb10.d_num }" class="back_view" data-backdrop="true" data-toggle="modal" data-target="#modal-testNew123">
													<td style = "width : 25%;">${bb10.sheet_kind}</td>
													<td  style = "width : 25%;">${bb10.title }</td>
													<td  style = "width : 25%;">${bb10.name}</td>
													<td  style = "width : 25%;">${bb10.approve_date }</td>
												</tr>
											</c:forEach>
											<tr>
                                    <td colspan="5" class="divider"></td>
                                 </tr>
										</table>
									</div>
									<div class="footer">
										<div class="legend">
											<button class="btn btn-defalut" onclick="location.href='getBackList '">더보기</button>
										</div>
										<hr>
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
	<div id="modal-testNew123" class="modal fade" tabindex="-1" role="dialog"
		aria-labelledby="테스트정보 등록" aria-describedby="테스트 모달">
		<div class="modal-dialog">
			<div class="modal-content"></div>
		</div>
	</div>
</body>
</html>