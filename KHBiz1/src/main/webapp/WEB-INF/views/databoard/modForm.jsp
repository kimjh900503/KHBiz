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
	var rowIndex = 0;
	var checkIndex = 0;
	var saveName = "";

	$(function() {
		//테이블 row 개수 
		rowIndex = $("#insertTable tr").length;

		//저장 버튼을 눌렀을 경우 
		$("#saveBtn").click(function() {
			var check = true;
			if ($("#title").val() == '') {
				alert("제목을 입력해주세요");
				check = false;
			}
			if ($("#contents").val() == '') {
				alert("내용을 입력해주세요");
				check = false;
			}
			if (check == true) {
				$("#frm").submit();
			}
		});

		//삭제할 파일을 선택했을 경우 
		$(".check").click(function() {
			checkIndex = $(".check").index(this) + 1;
			var index = 0;
			$(".files").each(function() {
				index++;
				if (index == checkIndex) {
					//삭제할 파일의 saveName 
					saveName = $(this).val();
				}
			});
		});

		//추가버튼을 눌렀을 경우 
		$("#fileAdd")
				.click(
						function() {
							if (rowIndex > 5)
								return false;
							rowIndex++;
							var getTable = document
									.getElementById("insertTable");
							var oCurrentRow = getTable
									.insertRow(getTable.rows.length);
							var oCurrentCell = oCurrentRow.insertCell(0);
							oCurrentCell.innerHTML = "<tr class='trcount'><td colspan=2><INPUT TYPE='FILE' class='files' NAME='files'  size='1048576000000'></td></tr>";
						});

		//삭제 버튼을 눌렀을 경우 
		$("#fileDel")
				.click(
						function() {
							//rowIndex가 null이면 파일 선택 없음 하나 append 해주기 
							//rowIndex = $("#insertTable tr").length;
							var checktotal = $(".check").length;
							var i = 0;
							var check = "";
							$(".files").each(function() {
								i++;
								if (i == (rowIndex - 1)) {
									check = $(this).val();
								}
							});

							//기존에 파일이 존재할 경우 
							if (check != '') {
								if ($("input:checkbox[class='check']").is(
										":checked")) {
									if (rowIndex < 2) {
										return false;
									} else {
										rowIndex--;
										var getTable = document
												.getElementById("insertTable");
										getTable.deleteRow(checkIndex);

										//파일 하나 지워주기 
										$.ajax({
											method : 'POST',
											url : 'datafileDelete',
											data : {
												saveName : saveName
											},
											error : function(request, status,
													error) {
												alert("code: " + request.status
														+ "\n" + "message: "
														+ request.responseText
														+ "\n"
														+ "error(send): "
														+ error);
											},
											success : function(result) {
											}
										});

										if (rowIndex == 1) {
											$("#insertTable")
													.append(
															"<tr class='trcount'><td colspan=2><INPUT TYPE='FILE' class='files' NAME='files'  size='1048576000000'></td></tr>");
											rowIndex++;
										}
									}
								} else {
									alert("삭제할 파일을 선택해주세요");
								}
							}
							//기존 파일이 존재하지 않을 경우 
							else {
								if (rowIndex <= 2) {
									return false;
								} else {
									rowIndex--;
									var getTable = document
											.getElementById("insertTable");
									getTable.deleteRow(rowIndex);
								}
							}

						});

		//리스트로 가기 버튼을 눌렀을 경우 
		$("#listBtn").click(function() {
			$(location).attr('href', "databoardList");
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
<!-- ckeditor -->
<script type="text/javascript" src="/erp/js/ckeditor/ckeditor.js"></script>
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
						<div class="col-md-7 col-md-offset-2">
							<div class="card">
								<div class="header">
									<h4 class="title">수정</h4>
								</div>
								<div class="content">
									<form action="databoardMod" method="post" id="frm"
										enctype="multipart/form-data">
										<input type="hidden" name="num" value="${board.num}" /> <input
											type="hidden" name="writer" class="form-control"
											value="${member.name}" readonly>
										<table class="table">
											<tr>
												<%-- <td
														style="width: 20%; background-color: #f2f2f2; font-weight: bold;">작성자</td>
													<td>${member.name}</td> --%>
												<td>제목</td>
												<td><input type="text" name="title" id="title"
													class="td2" value="${board.title}"></td>
											</tr>
										</table>
										<table id='insertTable' class="table">
											<tr>
												<td colspan="2"><input type="button" value="파일 추가" id="fileAdd" class="btn btn-default">
												<input type="button" value="삭제" id="fileDel" class="btn btn-default"></td>
											</tr>
											<c:forEach items="${fileList}" var="list">
												<c:if test="${list.originName ==null}">
													<tr class="trcount">
														<td colspan="2"><INPUT type='file' maxLength='100'
															name='files' id="files" size='1048576000000'></td>
													</tr>
												</c:if>
												<c:if test="${list.originName !=null}">
													<tr class="trcount">
														<td colspan=2><input type="checkbox" class="check"><span>${list.originName}</span>
															<INPUT TYPE="hidden" class="files" NAME="files"
															size="1048576000000" value="${list.saveName}"></td>
													</tr>
												</c:if>
											</c:forEach>
										</table>
										<table class="table">
											<tr>
												<td colspan="2"><textarea rows="20" cols="90"
														name="contents" id="contents">${board.contents}</textarea></td>
											</tr>
										</table>
									</form>

									<div class="content">
										<div class="row">
											<div class="container-fluid">
												<input type="button" value="취소" id="listBtn"
													class="btn btn-default"> <input type="button"
													value="저장" id="saveBtn" class="btn btn-info">
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
</body>
</html>