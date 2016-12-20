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

<script type="text/javascript">
	$(document).ready(function() {
		var message="${message}";
		if(message !=""){
			alert(message);
		}
		$("#departmentFind").change(function() {
			var department = $("#departmentFind").val();
			$.ajax({
				url : "./memberDepartmentList",
				data : {
					department : department
				},
				success : function(result) {
					if (result != null) {
						$("#MemberListView").html(result);

					}

				}
			});
			if (department == "*") {
				location.href = "memberOriginList";
			}

		});
		$(".departmentSelect").change(function() {
		  var idx = $(this).attr("id");
		  var department = this.value;
			swal({
				  title: "부서 변경?",
				  text: "확인클릭시 변경됩니다.",
				  type: "warning",
				  showCancelButton: true,
				  confirmButtonColor: "#00ff00",
				  confirmButtonText: "확인",
				  closeOnConfirm: false
				},
				function(){
					$.post("./memberDepartmentMod", {
						department : department,
						code : idx
					}, function(result) {
						swal("변경", "부서 이동 완료", "success");
						location.href="memberOriginList"							
					});
				});
		});

		$(".positionSelect").change(function() {
			var idx = $(this).attr("id");
			var position = this.value;
			swal({
				  title: "직급 변경?",
				  text: "확인클릭시 변경됩니다.",
				  type: "warning",
				  showCancelButton: true,
				  confirmButtonColor: "#00ff00",
				  confirmButtonText: "확인",
				  closeOnConfirm: false
				},
				function(){
					$.post("./memberPositionMod", {
						position : position,
						code : idx
					}, function(result) {
						swal("변경", "직급 변경 완료", "success");
						location.href="memberOriginList"							
					});
				});
		});
		$(".del").click(function () {
			var idx = $(this).attr("id");
			swal({
				  title: "사원 삭제",
				  text: "확인클릭시 삭제됩니다.",
				  type: "warning",
				  showCancelButton: true,
				  confirmButtonColor: "#DD6B55",
				  confirmButtonText: "확인",
				  closeOnConfirm: false
				},
				function(){
					$.post("./memberDelete", {
						code : idx
					}, function(result) {
						swal("삭제", "직원 삭제 완료", "success");
						location.href="memberOriginList"							
					});
				});
		});
		$("#join_btn").click(function() {
			
			$("#frm").submit();
			$('#fullCalModal').modal('hide')
		
		});
		var docH       = $(window).height();
		var wScrollTop = $(window).scrollTop();
	    var wHeight    = $('#body').height();
	    var scrollBtm  = wHeight - docH+170;
		$('.main-panel').scroll(function () {
			if($('.main-panel').scrollTop()>($('#body').height()-$(window).height()+170)){
				var max = ${memberList.size()};
				if(max<20){	
				}else{
					setTimeout(function(){
						if($('#departmentFind').val() == "*"){
						$.ajax({
							url:"memberAjaxList",
							type:"get",
							data:{
								perPage:max*1+20,
							},
							success:function(data){
								$("#MemberListView").html(data);
							}
						});							
						}else{
						}
					},500);	
				}
			}
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
					<li><a href="/erp/databoardList"> <i
							class="pe-7s-drawer"></i>
							<p>자료실</p>
					</a></li>
					<c:if test="${member.department=='인사팀' && member.position_Rank<3 || member.position_Rank==1}">
					<li class="active"><a href="/erp/member/memberOriginList"> <i
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
						<a class="navbar-brand" href="/erp/member/memberOriginList">MemberList</a>
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
									<h4 class="title">사원 관리</h4>
									<p class="category">Member List & Management</p>
								</div>
								<div class="content">
									<div id="listFind" class="text-right">
										<a href="#fullCalModal" data-toggle="modal">사원 등록</a> &nbsp; <select id="departmentFind">
											<option value="*">전체보기</option>
											<option value="인사팀">인사팀</option>
											<option value="회계팀">회계팀</option>
											<option value="편집팀">편집팀</option>
											<option value="디자인팀">디자인팀</option>
											<option value="개발팀">개발팀</option>

										</select>
									</div>
									<div id="MemberListView">
										<table class="table">
											<tr>
												<td class="col-md-0.5">사번</td>
												<td class="col-md-1">부서</td>
												<td class="col-md-1">직급</td>
												<td class="col-md-1">아이디</td>
												<td class="col-md-0.5">이름</td>
												<td class="col-md-0.5">성별</td>
												<td class="col-md-1">생년월일</td>
												<td class="col-md-1">핸드폰 번호</td>
												<td class="addressView">주소</td>
												<td class="col-md-1">입사일</td>
												<td>삭제</td>

											</tr>

											<c:forEach items="${HumanFind}" var="member">
												<tr>
													<td>${member.code}</td>
													<td><select class="departmentSelect form-control"
														id="${member.code}">
															<c:choose>
																<c:when test="${member.department eq '인사팀'}">
																	<option value="${member.department}">${member.department}</option>
																	<option value="회계팀">회계팀</option>
																	<option value="편집팀">편집팀</option>
																	<option value="디자인팀">디자인팀</option>
																	<option value="개발팀">개발팀</option>
																</c:when>
																<c:when test="${member.department eq '회계팀'}">
																	<option value="${member.department}">${member.department}</option>
																	<option value="인사팀">인사팀</option>
																	<option value="편집팀">편집팀</option>
																	<option value="디자인팀">디자인팀</option>
																	<option value="개발팀">개발팀</option>
																</c:when>
																<c:when test="${member.department eq '편집팀'}">
																	<option value="${member.department}">${member.department}</option>
																	<option value="인사팀">인사팀</option>
																	<option value="회계팀">회계팀</option>
																	<option value="디자인팀">디자인팀</option>
																	<option value="개발팀">개발팀</option>
																</c:when>
																<c:when test="${member.department eq '디자인팀'}">
																	<option value="${member.department}">${member.department}</option>
																	<option value="인사팀">인사팀</option>
																	<option value="회계팀">회계팀팀</option>
																	<option value="편집팀">편집팀</option>
																	<option value="개발팀">개발팀</option>
																</c:when>
																<c:when test="${member.department eq '개발팀'}">
																	<option value="${member.department}">${member.department}</option>
																	<option value="인사팀">인사팀</option>
																	<option value="회계팀">개발팀</option>
																	<option value="편집팀">편집팀</option>
																	<option value="디자인팀">디자인팀</option>
																</c:when>
															</c:choose>
													</select></td>
													<td><select class="positionSelect form-control"
														id="${member.code}">
															<c:choose>
																<c:when test="${member.position eq '사원'}">
																	<option value="${member.position}">${member.position}</option>
																	<option value="대리">대리</option>
																	<option value="과장">과장</option>
																	<option value="차장">차장</option>
																	<option value="팀장">팀장</option>
																</c:when>
																<c:when test="${member.position eq '대리'}">
																	<option value="${member.position}">${member.position}</option>
																	<option value="사원">사원</option>
																	<option value="과장">과장</option>
																	<option value="차장">차장</option>
																	<option value="팀장">팀장</option>
																</c:when>
																<c:when test="${member.position eq '과장'}">
																	<option value="${member.position}">${member.position}</option>
																	<option value="사원">사원</option>
																	<option value="대리">대리</option>
																	<option value="차장">과장</option>
																	<option value="팀장">팀장</option>
																</c:when>
																<c:when test="${member.position eq '과장'}">
																	<option value="${member.position}">${member.position}</option>
																	<option value="사원">사원</option>
																	<option value="대리">대리</option>
																	<option value="차장">차장</option>
																	<option value="팀장">팀장</option>
																</c:when>
																<c:when test="${member.position eq '차장'}">
																	<option value="${member.position}">${member.position}</option>
																	<option value="사원">사원</option>
																	<option value="대리">대리</option>
																	<option value="과장">과장</option>
																	<option value="팀장">팀장</option>
																</c:when>
																<c:when test="${member.position eq '팀장'}">
																	<option value="${member.position}">${member.position}</option>
																	<option value="사원">사원</option>
																	<option value="대리">대리</option>
																	<option value="과장">과장</option>
																	<option value="차장">차장</option>
																</c:when>
																<c:when test="${member.position eq '사장'}">
																	<option value="${member.position}">${member.position}</option>
																</c:when>

															</c:choose>
													</select></td>
													<td>${member.id}</td>
													<td>${member.name}</td>
													<td>${member.gender}</td>
													<td>${member.birth}</td>
													<td>${member.phone}</td>
													<td>${member.address1}</td>
													<td>${member.hired_date}</td>
													<td>
														<button class="btn btn-default del" id="${member.code}">삭제</button>
													</td>

												</tr>
											</c:forEach>
										</table>
									</div>

									<div class="content">
										<div class="row">
											<div class="container-fluid">
												<div class="col-md-4">
													<form action="memberHumanFind" method="post">
														<div
															class="form-group has-feedback text-left input-append form-search">
															<input type="search" class="search-query span3"
																placeholder="이름" name="code">
															<button type="submit" class="btn btn-defalut">검색</button>
														</div>
													</form>
												</div>
											</div>
										</div>
										<hr>
										<div class="stats">	
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
					<h4 id="modalTitle" class="modal-title">사원 등록</h4>
				</div>
				<div id="modalBody" class="modal-body">
					<form action="memberJoin" method="post" id="frm">
					<div class="form-group has-feedback text-left">
						<label>부서</label>
						<select name="department" class="form-control">
							<option value="인사팀">인사팀</option>
							<option value="회계팀">회계팀</option>
							<option value="편집팀">편집팀</option>
							<option value="디자인팀">디자인팀</option>
							<option value="개발팀">개발팀</option>
						</select>
					</div>
					<div class="form-group has-feedback text-left">
						<label>직급</label>
						<select name="position" class="form-control">
							<option value="사원">사원</option>
							<option value="대리">대리</option>
							<option value="과장">과장</option>
							<option value="차장">차장</option>
							<option value="팀장">팀장</option>
							<!--사장 : amdin-->
						</select>
					</div>
					<input type="hidden" name="pw" value="0000">
					</form>
				</div>
				<div class="modal-footer">
					<input type="button" class="btn btn-info" id="join_btn" value="등록">
					<button type="button" class="btn btn-default" data-dismiss="modal"
						id="clo">닫기</button>
				</div>
			</div>
		</div>
	</div>
</body>
</html>