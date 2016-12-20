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
<title>KHBiz_AttendManage</title>
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
	$(document).ready(
			function() {
				$("#departmentFind").change(function() {
					var department = $("#departmentFind").val();
					$.ajax({
						url : "./attenddepartmentmanage",
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
						location.href = "attendmanage";
					}

				});
				function itoStr($num) {
					$num < 10 ? $num = '0' + $num : $num;
					return $num.toString();
				}

				var btn = $('#btnExport');
				var tbl = 'tblExport';

				btn.on('click', function() {
					var dt = new Date();
					var year = itoStr(dt.getFullYear());
					var month = itoStr(dt.getMonth() + 1);
					var day = itoStr(dt.getDate());
					var hour = itoStr(dt.getHours());
					var mins = itoStr(dt.getMinutes());

					var postfix = year + month + day + "_" + hour + mins;
					var fileName = "AttendManage_" + postfix + ".xls";

					var uri = $("#" + tbl).excelexportjs({
						containerid : tbl,
						datatype : 'table',
						returnUri : true
					});

					$(this).attr('download', fileName).attr('href', uri).attr(
							'target', '_blank');
				});
				$('.attend_modi').click(function () {
					var cod = $(this).attr("id");
					$.ajax({
						url : "../s_json/getAttend?code="+cod,
						type : "get",
						success : function (data) {
							$('#modalTitle').html(data.name);
							$('#modal_code').html(data.code);
							$('#modal_code_hidden').val(data.code);
							$('#modal_depart').html(data.department);
							$('#modal_position').html(data.position);
							$('#modal_vacation').val(data.vacation);
							$('#modal_used').val(data.used);
							$('#modal_late').val(data.late);
							$('#modal_absence').val(data.absence);
							$('#modal_over').val(data.over);
							$('#fullCalModal').modal();
						}
				});
				});
				$('#modi_btn').click(function() {
					if($('#modal_vacation').val() ==''){
						swal("에러", "연차를 입력하세요", "error");
						return false;
					}else if($('#modal_used').val()==''){
						swal("에러", "사용일수를 입력하세요", "error");
						return false;
					}else if($('#modal_late').val()==''){
						swal("에러", "지각일수를 입력하세요", "error");
						return false;
					}else if($('#modal_absence').val()==''){
						swal("에러", "결근일수를 입력하세요", "error");
						return false;
					}else if($('#modal_over').val()==''){
						swal("에러", "초과근무 시간을 입력하세요", "error");
						return false;
					}else{
						$('#modi_frm').submit();
						$('#fullCalModal').modal('hide');
					}
				});
				var docH       = $(window).height();
				var wScrollTop = $(window).scrollTop();
			    var wHeight    = $('#body').height();
			    var scrollBtm  = wHeight - docH+170;
				$('.main-panel').scroll(function () {
					if($('.main-panel').scrollTop()>($('#body').height()-$(window).height()+170)){
						var max = ${list.size()};
						if(max<20){	
						}else{
							setTimeout(function(){
								if ($('#departmentFind').val() == "*"){
								$.ajax({
									url:"attendmanageAjax",
									type:"get",
									data:{
										perPage:max*1+20,
									},
									success:function(data){
										$("#MemberListView").html(data);
									}
								});									
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
						<li class="active"><a href="/erp/attendmanage/attendmanage"> <i
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
						<a class="navbar-brand" href="/erp/attendmanage/attendmanage">근태관리</a>
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
									<h4 class="title">근태 관리</h4>
									<p class="category">Attend Management</p>
								</div>
								<div class="content">
									<div id="listFind" class="text-right">
										<select id="departmentFind">
											<option value="*">전체보기</option>
											<option value="인사팀">인사팀</option>
											<option value="회계팀">회계팀</option>
											<option value="편집팀">편집팀</option>
											<option value="디자인팀">디자인팀</option>
											<option value="개발팀">개발팀</option>
										</select>
									</div>
									<div id="MemberListView">
										<table class="table table-hover" id="tblExport">
											<tr>
												<td>사번</td>
												<td>부서</td>
												<td>직급</td>
												<td>이름</td>
												<td>총 연차</td>
												<td>사용 일수</td>
												<td>잔여 일수</td>
												<td>지각 일수</td>
												<td>결근 일수</td>
												<td>초과근무(h)</td>
											</tr>

											<c:forEach items="${list}" var="list">
												<tr id="${list.code}" class="attend_modi" style="cursor:pointer">
													<td>${list.code}</td>
													<td>${list.department}</td>
													<td>${list.position}</td>
													<td>${list.name}</td>
													<td>${list.vacation}</td>
													<td>${list.used}</td>
													<td>${list.vacation - list.used}</td>
													<td>${list.late}</td>
													<td>${list.absence}</td>
													<td>${list.over}</td>

												</tr>
											</c:forEach>
										</table>
									</div>

									<div class="content">
										<div class="row">
											<div class="container-fluid">
												<div class="col-md-4">
													<form action="attendsearch" method="post">
														<div
															class="form-group has-feedback text-left input-append form-search">
															<input type="search" class="search-query span3"
																placeholder="사번 또는 이름" name="search">
															<button type="submit" class="btn btn-defalut">검색</button>
														</div>
													</form>
												</div>
												<div class="col-md-2 col-md-offset-6">
													<button type='button' class="btn btn-info">
														<a id="btnExport" href="#" download="">엑셀출력</a>
													</button>
												</div>
											</div>
										</div>
										<hr>
										<div class="stats">
											<i class="fa fa-clock-o"></i> 매일 8시,9시,13시에 업데이트 됩니다.
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
					<h4 id="modalTitle" class="modal-title"></h4>
				</div>
				<div id="modalBody" class="modal-body container-fluid">
					<div class="table-full-width">
					<table class="table">
						<tr>
							<td>사번</td>
							<td>부서</td>
							<td>직급</td>
						</tr>
						<tr>
							<td id="modal_code"></td>
							<td id="modal_depart"></td>
							<td id="modal_position"></td>
						</tr>
					</table>
					</div>
					<form action="attendmodi" id="modi_frm">
					<div class="col-md-6">
						<input type="hidden" id="modal_code_hidden" class="form_control" name="code">
						<div class="form-group has-feedback text-left">
						<label>총 연차</label>
						<input type="number" max="23" id="modal_vacation" class="form_control" name="vacation">
						</div>
						<div class="form-group has-feedback text-left">
						<label>지각 일수</label>
						<input type="number" id="modal_late" class="form_control" name="late">
						</div>
						<div class="form-group has-feedback text-left">
						<label>초과근무(h)</label>
						<input type="number" id="modal_over" class="form_control" name="over">
						</div>
					</div>
					<div class="col-md-6">
						<div class="form-group has-feedback text-left">
							<label>사용 일수</label>
							<input type="number" id="modal_used" class="form_control">
						</div>
						<div class="form-group has-feedback text-left">
							<label>결근 일수</label>
							<input type="number" id="modal_absence" class="form_control">
						</div>
					</div>
					</form>
				</div>
				<div class="modal-footer">
					<input type="button" class="btn btn-info" id="modi_btn" value="수정">
					<button type="button" class="btn btn-default" data-dismiss="modal"
						id="clo"><i class="ace-icon fa fa-times"></i>닫기</button>
				</div>
			</div>
		</div>
	</div>
</body>
</html>