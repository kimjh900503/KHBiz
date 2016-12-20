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
<title>KHBiz_Reference</title>
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
<!-- 엑셀 export -->
<script type="text/javascript"
	src="/erp/js/jquery.techbytarun.excelexportjs.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		var message = "${message}";
		if (message != "") {
			swal(message);
		}
		var type="${type}";
		$(".typeOption").each(function(){
			if($(this).val()==type){
				 $(this).attr("checked", true);
			}
		});
		$('.view').click(function () {
			$.ajax({
				url:"databoardView",
				type:"GET",
				data:{num:$(this).attr("id")},
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
					<li class="active"><a href="/erp/databoardList"> <i
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
						<a class="navbar-brand" href="/erp/databoardList">자료실</a>
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


			<div class="content" id="body">
				<div class="container-fluid">
					<div class="row">
						<div class="col-md-12">
							<div class="card">
								<div class="header">
									<h4 class="title">자료실</h4>
								</div>
								<div class="content">
									<div id="MemberListView">
										<table class="table" style = "margin-bottom: 0%; text-align:  center;">
												<tr>
													<td  style = "font-weight: bolder; background-color: #f2f2f2; width : 25%;">번호</td>
													<td  style = "font-weight: bolder; background-color: #f2f2f2;width : 25%;">제목</td>
													<td  style = "font-weight: bolder; background-color: #f2f2f2; width : 25%;">작성자</td>
													<td  style = "font-weight: bolder; background-color: #f2f2f2;width : 25%;">작성일</td>
												</tr>
												</table>
									
										<table class="table table-hover" id="tblExport"  style="text-align:  center;">

											<c:forEach items="${boardList}" var="board">
												<tr id="${board.num}" class="view" data-backdrop="true" data-toggle="modal" data-target="#modal-testNew123" style="cursor:pointer">
													<td style="width : 25%;">${board.num}</td>
													<td style="width : 25%;">${board.title}</td>
													<td style="width : 25%;">${board.writer}</td>
													<td style="width : 25%;">${board.reg_date}</td>
												</tr>
											</c:forEach>
											
											<tr>
                                   				 <td colspan="5" class="divider"></td>
                                 			</tr>
										</table>
									</div>

									<div class="content" style="border-top: 2px solid #cccccc">
										<div class="row">
										<div class="col-md-4">
												<div class="container-fluid" style=" height : 50px;">
													<form action="databoardList" method="post">
													<!-- <div class="col-md-5">
													</div> -->
														<div
															class="form-group has-feedback text-left input-append form-search" >
															<div class="col-md-5">
															<select name="type" id="type" class="form-control">
																<option value="title" class="typeOption">제목</option>
																<option value="writer" class="typeOption">작성자</option>
															</select>
															</div>
															<input type="search" class="search-query span3"
																 id="str" name="str" value="${str}" style ="height :35px; margin-top: 2%;">
													 <button type="submit" class="btn btn-defalut" style ="height:34px; margin-bottom: 4px; ">검색</button> 
														</div>
													</form>
												</div>
												</div>
												<div class="col-md-4 form-inline col-md-offset-1">
													<c:if test="${boardList.size() != 0 }">
														<c:if test="${page.curBlock>1}">
															<a href="databoardList?curPage=${page.startNum-1}&type=${type}&str=${str}">[이전]</a>
														</c:if>
														<c:forEach begin="${page.startNum}" end="${page.lastNum}" var="i">
															<a href="databoardList?curPage=${i}&type=${type}&str=${str}">${i}</a>
														</c:forEach>
														<c:if test="${page.curBlock<page.totalBlock}">
															<a href="databoardList?curPage=${page.lastNum+1}&type=${type}&str=${str}">[다음]</a>
														</c:if>
													</c:if>
												</div>
												<div class="com-md-2">
													<button id="write" class="btn btn-info" style ="height:34px; margin-bottom: 4px;" onclick="location.href='databoardWriteForm'">글쓰기</button>
												</div>
											</div>
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