<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta
	content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0'
	name='viewport' />
<meta name="viewport" content="width=device-width" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>KHBiz_Schedule</title>
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
	var code = ${member.code};
	var position_rank = ${member.position_Rank};
	$(document).ready(function() {
		var message="${message}";
		if(message !=""){
			swal(message);
		}
		var events_array = [];
		$.ajax({
			url : "../s_json/getSchedule?code=${member.code}",
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
						modi : '<form action="modiSchedule" method="post" id="frm">'
								+'<div class="table-full-width">'
								+'<input type="hidden" name="s_num" value="'+data[i].s_num+'">'
								+'<table class="table">'
								+'<tr><td>시작일<input type="date" name="startdate" id="sd" class="form-control" pattern="yyyy-mm-dd" required="required" value="'+data[i].startdate+'">'
								+'<input type="time" name="starttime" id="st" class="form-control" pattern="HH24:MI" value="'+data[i].starttime+'"><td>'
								+'<td>종료일<input type="date" name="enddate" id="ed" class="form-control" pattern="yyyy-mm-dd" required="required" value="'+data[i].enddate+'">'
								+'<input type="time" name="endtime" id="et" class="form-control" pattern="HH24:MI" value="'+data[i].endtime+'"><td></tr>'
								+'<tr><td colspan="2">제목</td><td>'
								+'<input type="text" value="'+data[i].title+'" class="form-control" name="title" id="title" required="required"></td></tr>'
								+'<tr><td colspan="2">내용</td><td>'
								+'<input type="text" value="'+data[i].contents+'" class="form-control" name="contents" id="contents"></td></tr>'
					};
					events_array.push(schedule_object);
				}
				$('#calendar').fullCalendar({
					defaultDate : now,
					editable : true,
					eventLimit : true, // allow "more" link when too many events
					events : events_array,
					eventClick:  function(event, jsEvent, view) {
						var s_num = event.id;
						$('#clo').html('닫기');
			            $('#modalTitle').html(event.title);
			            $('#modalBody').html(event.content);
			            if(event.color=='#cc0000' && position_rank>2){
			            	$('#del_btn').addClass('hidden');
			            	$('#modi_btn').addClass('hidden');
			            }else if(event.color=='#cc0000' && position_rank<3){
			            	$('#del_btn').removeClass('hidden');
			            	$('#modi_btn').removeClass('hidden');
			            }else if(event.color!='#cc0000'){
			            	$('#del_btn').removeClass('hidden');
			            	$('#modi_btn').removeClass('hidden');
			            }
			            $('#del').click(function () {
			    			swal({
			    				  title: "일정 삭제",
			    				  text: "휴가 삭제시 불이익이 발생할수 있습니다",
			    				  type: "warning",
			    				  showCancelButton: true,
			    				  confirmButtonColor: "#DD6B55",
			    				  confirmButtonText: "확인",
			    				  closeOnConfirm: false
			    				},
			    				function(){
			    					location.href='delSchedule?s_num='+s_num
			    				});
						});
			            /* $('#del').attr('href','delSchedule?s_num='+event.id); */
			            $('#modi').html('수정');
			            $('#modi').click(function () {
			            	$('#fullCalModal').modal('hide');
			            	if(event.title=='휴가'){
			            		swal("에러", "휴가는 수정 불가합니다", "error");
			            	}
			            	else{
			            	setTimeout(function () {
			            		$('#modalTitle').html('수정');
			            		$('#clo').html('취소');
					            $('#modalBody').html(event.modi);
					            $('#modi').html('완료');
					            $('#del_btn').addClass('hidden');
					            $('#modi').click(function () {
					            	$('#frm').submit();
					            });
					            $('#fullCalModal').modal();
					            	//과거날짜 선택 불가
						            $('#sd').change(function() {
						            	var select = new Date($('#sd').val());

						            	if (select.toYmdDateString() < now.toYmdDateString()) {
						            		$('#sd').val('');
						            	}
						            });
						            //시작날짜 이전 선택 불가
						            $('#ed').change(function() {
						            	var select = new Date($('#sd').val());
						            	var end = new Date($('#ed').val());
						            	if (select == '') {
						            		$('#ed').val('');
						            	}
						            	if (select.toYmdDateString() > end.toYmdDateString()) {
						            		$('#ed').val('');
						            	}
						            });
						            $('#st').change(function () {
						    			var select = $('#sd').val();
						    			if(select ==''){
						    				$('#st').val('');				
						    			}
						    		});
						    		$('#et').change(function () {
						    			var select = $('#sd').val();
						    			var end = $('#ed').val();
						    			if(end ==''){
						    				$('#et').val('');				
						    			}else{
						    				if(select == end && $('#st').val()>$('#endtime').val()){
						    					$('#et').val('');	
						    				}
						    			}
						    		});
					          
			        		},450);
			            	}
			            	
						});
			            $('#fullCalModal').modal();
			        }
				});
			}
		});
		//과거날짜 선택 불가
		$('#startdate').blur(function() {
			var select = new Date($('#startdate').val());
			if (select.toYmdDateString() < now.toYmdDateString()) {
				$('#startdate').val('');
				swal("에러", "과거날짜 입니다", "error");
			}
		});
		//시작날짜 이전 선택 불가
		$('#enddate').blur(function() {
			var select = new Date($('#startdate').val());
			var end = new Date($('#enddate').val());
			if (select == '') {
				$('#enddate').val('');
				swal("에러", "시작일 부터 입력해주세요", "error");
			}
			if (select.toYmdDateString() > end.toYmdDateString()) {
				$('#enddate').val('');
				swal("에러", "종료일은 시작일 이후여야합니다", "error");
			}
		});
		$('#starttime').blur(function () {
			var select = $('#startdate').val();
			if(select ==''){
				$('#starttime').val('');				
			}
		});
		$('#endtime').blur(function () {
			var select = $('#startdate').val();
			var end = $('#enddate').val();
			if(end ==''){
				$('#endtime').val('');				
			}else{
				if(select == end && $('#starttime').val()>$('#endtime').val()){
					$('#endtime').val('');	
				}
			}
		});
		$('#setSchedule').click(function() {
			var start = $('#startdate').val();
			var startdate = start;
			if ($('#starttime').val() != null) {
				startdate = startdate + 'T' + $('#starttime').val();
			}

		});
		$('#setSchedule').click(function() {
			var check = false;
			var startdate = $('#startdate').val();
			var enddate = $('#enddate').val();
			var title = $('#title').val();
			if($('#company').prop("checked")){
				code=0;
			}
			if (startdate == '') {
				check = false;
				swal("에러", "시작일을 적어주세요.", "error");
			} else if (title == '') {
				check = false;
				swal("에러", "제목을 적어주세요.", "error");
			} else if (title == '휴가') {
				check = false;
				swal("에러", "휴가는 결재시 등록됩니다.", "error");
			} else if(enddate ==''){
				check = false;
				swal("에러", "종료일을 적어주세요.", "error");
			}else{
				check = true;	
			}
			if (check) {
				$.ajax({
					url : "../s_json/setschedule",
					type : "post",
					data : {
						code : code,
						startdate : $('#startdate').val(),
						starttime : $('#starttime').val(),
						enddate : $('#enddate').val(),
						endtime : $('#endtime').val(),
						title : title,
						contents : $('#contents').val()
					},
					success : function(data) {
						$('#startdate').val('');
						$('#starttime').val('');
						$('#enddate').val('');
						$('#endtime').val('');
						$('#title').val('');
						$('#contents').val('');
						location.reload();
					}
				});
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
					<li class="active"><a href="/erp/schedule/scheduler"> <i
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
						<a class="navbar-brand" href="/erp/schedule/scheduler">Schedule</a>
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
						<div class="col-md-8">
							<div class="card">
								<div class="header">
									<h4 class="title">일정</h4>
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
											<i class="fa fa-history"></i> 
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="col-md-4">
							<div class="container-fluid">
								<div class="row">
									<div class="col-md-12">
										<div class="card ">
											<div class="header">
												<h4 class="title">Today</h4>
												<p class="category">금일 일정</p>
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
													<div class="legend">
													</div>
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
												<h4 class="title">일정 등록</h4>
												<p class="category"></p>
											</div>
											<div class="content">
												<table class="table table-responsive">
													<tr>
														<td style="width: 50%;">시작일 <input type="date" id="startdate"
															class="form-control" pattern="yyyy-mm-dd"> <input
															type="time" id="starttime" class="form-control"
															pattern="HH24:MI">
														</td>
														<td style="width: 50%;">종료일 <input type="date" id="enddate"
															class="form-control" pattern="yyyy-mm-dd"> <input
															type="time" id="endtime" class="form-control"
															pattern="HH24:MI">
														</td>
													</tr>
													<tr>
														<td colspan="2">제목 <input type="text" id="title"
															class="form-control"></td>
													</tr>
													<tr>
														<td colspan="2">내용 <input type="text" id="contents"
															class="form-control"></td>
													</tr>
													<c:if test="${member.department=='인사팀' && member.position_Rank<3}">
													<tr>
														<td colspan="2"><input type="checkbox" id="company"
															value="0">회사 일정</td>
													</tr>
													</c:if>
												</table>
												<div class="footer">
													<div class="text-right">
														<button class="btn btn-info" id="setSchedule">등록</button>
													</div>
													<hr>
													<div class="stats">
														<i class="fa fa-check"></i> 
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
                <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">×</span> <span class="sr-only"></span></button>
                <h4 id="modalTitle" class="modal-title"></h4>
            </div>
            <div id="modalBody" class="modal-body"></div>
            <div class="modal-footer">
                <button class="btn btn-default" id="del_btn"><a id="del">삭제</a></button>
                <button class="btn btn-default" id="modi_btn">
                <a id="modi">수정</a></button>
                <button type="button" class="btn btn-info" data-dismiss="modal" id="clo">닫기</button>
            </div>
        </div>
    </div>
</div>
</body>
</html>