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
<title>KHBiz_MemberView</title>
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
	$(function() {
		var phone = '${memberView.phone}';

		var ph = phone.split("-");
		$("#phone1").val(ph[1]);
		$("#phone2").val(ph[2]);

		
		$("#pic").on('change', function(){
			var fileext = $('#pic').val();
			fileext = fileext.slice(fileext.indexOf(".")+1).toLowerCase();
			if(fileext != "jpg" && fileext != "png" && fileext != "gif" && fileext != "bmp"){
				swal("에러", "이미지 파일을 올려주세요 ", "error");
				$('#storefile').val("");
				return false;
			}else{
            	readURL(this);				
			}
        });

		
		
		
		$("#modBtn").click(function() {
			var pw = $("#pw").val();
			var pwCheck = $("#pwCheck").val();
			var name = $("#name").val()
			var phone1 = $("#phone1").val();
			var phone2 = $("#phone2").val();

			var chk1 = /[a-z]/i; //적어도 한개의 a-z가 있는지 확인
			var chk2 = /\d/; //적어도 한개의 0-9가 있는지 확인
			var chk3 = /^[가-힣]*$/;

			if (pw.length < 6 || pw == '') {
				swal("에러", "비밀번호는 6자 이상으로 입력하세요", "error");
				return false;

			} else if (!(chk1.test(pw) && chk2.test(pw))) {
				swal("에러", "비밀번호는 영문 숫자 조합으로 입력하세요", "error");
				return false;
			} else if (pw != pwCheck) {
				swal("에러", "비밀번호가 일치하지 않습니다", "error");
				return false;
			} else if (name == '') {
				swal("에러", "이름을 입력하세요", "error");
				return false;
			} else if (!chk3.test(name)) {
				swal("에러", "이름을 한글로 입력하세요", "error");
				return false;
			}  else if (name.length < 2) {
				swal("에러", "이름을 2글자 이상 입력하세요", "error");
				return false;
			} else if (phone1 == '') {
				swal("에러", "핸드폰 번호를 입력하세요", "error");
				return false;
			} else if (phone2 == '') {
				swal("에러", "핸드폰 번호를 입력하세요", "error");
				return false;
			} else if (isNaN(phone1) || phone1.length != 4) {
				swal("에러", "핸드폰 번호를 다시 확인하세요", "error");
				return false;
			} else if (isNaN(phone2) || phone2.length != 4) {
				swal("에러", "핸드폰 번호를 다시 확인하세요", "error");
				return false;
			} else if (address == '') {
				swal("에러", "주소를 입력하세요", "error");
				return false;
			} else {
				$("#frm").submit();
			}

		});
		var chk1 = /[a-z]/i; //적어도 한개의 a-z가 있는지 확인
		var chk2 = /\d/; //적어도 한개의 0-9가 있는지 확인
		$("#pwCheck").blur(function() {
			var pw = $("#pw").val();
			var pwCheck = $("#pwCheck").val();
			if (pw == pwCheck && pw != ''&& pw.length > 6 && chk1.test(pw) &&chk2.test(pw)) {
				$('#pw').css("background-color","#bcebad");
				$('#pwCheck').css("background-color","#bcebad");
			} else {
				$('#pw').css("background-color","");
				$('#pwCheck').css("background-color","");
			}
		});
		$("#pwCheck").keyup(function() {
			var pw = $("#pw").val();
			var pwCheck = $("#pwCheck").val();
			if (pw == pwCheck && pw != ''&& pw.length > 6 && chk1.test(pw) &&chk2.test(pw)) {
				$('#pw').css("background-color","#bcebad");
				$('#pwCheck').css("background-color","#bcebad");
			} else {
				$('#pw').css("background-color","");
				$('#pwCheck').css("background-color","");

			}
		});
		$("#pwCheck").focus(function() {
			var pw = $("#pw").val();
			var pwCheck = $("#pwCheck").val();
			if (pw == pwCheck && pw != ''&& pw.length > 6 && chk1.test(pw) &&chk2.test(pw)) {
				$('#pw').css("background-color","#bcebad");
				$('#pwCheck').css("background-color","#bcebad");
			} else {
				$('#pw').css("background-color","");
				$('#pwCheck').css("background-color","");
			}
		});
		$("#pw").keyup(function() {
			var pw = $("#pw").val();
			var pwCheck = $("#pwCheck").val();
			if (pw == pwCheck && pw != ''&& pw.length > 6 && chk1.test(pw) &&chk2.test(pw)) {
				$('#pw').css("background-color","#bcebad");
				$('#pwCheck').css("background-color","#bcebad");
			} else {
				$('#pw').css("background-color","");
				$('#pwCheck').css("background-color","");
			}
		});
		$("#pw").blur(function() {
			var pw = $("#pw").val();
			var pwCheck = $("#pwCheck").val();
			if (pw == pwCheck && pw != ''&& pw.length > 6 && chk1.test(pw) &&chk2.test(pw)) {
				$('#pw').css("background-color","#bcebad");
				$('#pwCheck').css("background-color","#bcebad");
			} else {
				$('#pw').css("background-color","");
				$('#pwCheck').css("background-color","");
			}
		});
		$("#pw").focus(function() {
			var pw = $("#pw").val();
			var pwCheck = $("#pwCheck").val();
			if (pw == pwCheck && pw != ''&& pw.length > 6 && chk1.test(pw) &&chk2.test(pw)) {
				$('#pw').css("background-color","#bcebad");
				$('#pwCheck').css("background-color","#bcebad");
			} else {
				$('#pw').css("background-color","");
				$('#pwCheck').css("background-color","");
			}
		});
		$("#pw").change(function() {
			$('#pw').css("background-color","");
			$('#pwCheck').css("background-color","");
		});
		$("#pwCheck").change(function() {
			$('#pw').css("background-color","");
			$('#pwCheck').css("background-color","");
		});

	});
	
	function readURL(input){
        if (input.files && input.files[0]) {
        var reader = new FileReader();

        reader.onload = function (e) {
        		$('#blah').removeClass('hidden');
                $('#blah').attr('src', e.target.result);
            }

          reader.readAsDataURL(input.files[0]);
        }
   
    }
	function AutoResize(MaxWidth) {
		  for(var i=0;i<document.images.length;i++) {
		    if(document.images[i].width > MaxWidth) {
		      document.images[i].width=MaxWidth;
		      document.images[i].height-=document.images[i].height*(document.images[i].width-MaxWidth)/document.images[i].width;
		    }
		  }
	}
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
					<c:if test="${member.department=='인사팀' && member.position_Rank<3}">
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
						<a class="navbar-brand" href="/erp/member/memberView">MemberView</a>
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
						<div class="col-md-12">
							<div class="card">
								<div class="header">
									<h4 class="title">회원 정보 수정</h4>
									<p class="category"></p>
								</div>
								<form action="/erp/member/memberMod" method="post" id="frm" enctype="multipart/form-data">
								<input type="hidden" value="${memberView.code}" name="code">
								<input type="hidden" value="${memberView.pic}" name="originalPic"> 
									<div class="content">						
										<div class="table-full-width">
											<table class="table">
												<tr>
													<td class="col-md-4">사원번호</td>
													<td>${memberView.code}</td>
												</tr>
												<tr>
													<td>부서</td>
													<td>${memberView.department}</td>

												</tr>
												<tr>
													<td>직급</td>
													<td>${memberView.position}</td>
												</tr>
												<tr>
													<td>프로필 사진</td>
													<td>
														<img src="/erp/resources/upload/${memberView.pic}" style="width:120px; height: 160px;"id="blah">
														<input type="file" id="pic" accept="image/*" name="pic">
													</td>
												</tr>
												<tr>
													<td>아이디</td>
													<td>${memberView.id}</td>
												</tr>
												<tr>
													<td>비밀번호</td>
													<td><input type="password" class="form-control"
														name="pw" id="pw"></td>
												</tr>
												<tr>
													<td>비밀번호 확인</td>
													<td><input type="password" class="form-control"
														id="pwCheck"></td>
												</tr>
												<tr>
													<td>이름</td>
													<td><input type="text" value="${memberView.name}"
														class="form-control" name="name" id="name"></td>
												</tr>
												<tr>
													<td>생년월일</td>
													<td>${memberView.birth}</td>
												</tr>
												<tr>
													<td>핸드폰 번호</td>
													<td
														class="form-group has-feedback text-left input-group form-inline">
														<input type="text" class="form-control phone" value="010"
														readonly>
														<div class="input-group-addon" id="basic-addon1">-</div> <input
														type="text" name="phone1" class="form-control phone"
														maxlength="4" id="phone1">
														<div class="input-group-addon" id="basic-addon1">-</div> <input
														type="text" name="phone2" class="form-control phone"
														maxlength="4" id="phone2">
												</tr>
												<tr>
													<td rowspan="2">주소</td>
													<td
														class="form-group has-feedback text-left input-group form-inline">
														<input type="text" id="sample4_postcode"
														placeholder="우편번호" class="form-control"> <span
														class="input-group-btn">
															<button class="btn btn-info " type="button"
																id="join_btn2" onclick="sample4_execDaumPostcode()">우편번호
																찾기</button>
													</span>
												</tr>
												<tr>
													<td><label>도로명 주소</label> <input type="hidden"
														id="sample4_roadAddress1" name="address1"
														value="${memberView.address1}"> <input
														class="join_text form-control" type="text"
														value="${memberView.address1}" id="sample4_roadAddress2"
														placeholder="도로명주소" disabled="disabled"> <input
														type="hidden" id="sample4_jibunAddress1" name="address2"
														value="${memberView.address2}"> <input
														class="join_text form-control" type="hidden"
														value="${memberView.address2}" id="sample4_jibunAddress2"
														placeholder="지번주소" disabled="disabled">
														<span id="guide" style="color:#999"></span></td>
												
												</tr>
											</table>
										</div>

										<div class="footer">
											<div class="legend">
												<button class="btn btn-info" id="modBtn">등록</button>
												<button class="btn btn-default" id="backBtn" onclick="location.href='/erp/member/memberMod?code=${memberView.code}'; return false;">다시쓰기</button>
												<button class="btn btn-default" id="cancle" onclick="location.href='/erp/member/memberView'; return false;">취소</button>
											</div>
											<hr>
											<div class="stats">
												<i class="fa fa-clock-o"></i> ${memberView.hired_date}
											</div>
										</div>
									</div>
								</form>
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
						&copy; 2016 <a href="/erp/home">2ㄱㄹㅇ</a>, made with love for a
						better web
					</p>
				</div>
			</footer>

		</div>
	</div>
	
	<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
			<script>
					    //본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
					    function sample4_execDaumPostcode() {
					        new daum.Postcode({
					            oncomplete: function(data) {
					                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
					
					                // 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
					                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
					                var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
					                var extraRoadAddr = ''; // 도로명 조합형 주소 변수
					
					                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
					                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
					                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
					                    extraRoadAddr += data.bname;
					                }
					                // 건물명이 있고, 공동주택일 경우 추가한다.
					                if(data.buildingName !== '' && data.apartment === 'Y'){
					                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
					                }
					                // 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
					                if(extraRoadAddr !== ''){
					                    extraRoadAddr = ' (' + extraRoadAddr + ')';
					                }
					                // 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
					                if(fullRoadAddr !== ''){
					                    fullRoadAddr += extraRoadAddr;
					                }
					
					                // 우편번호와 주소 정보를 해당 필드에 넣는다.
					                document.getElementById('sample4_postcode').value = data.zonecode; //5자리 새우편번호 사용
					                document.getElementById('sample4_roadAddress1').value = fullRoadAddr;
					                document.getElementById('sample4_roadAddress2').value = fullRoadAddr;
					                document.getElementById('sample4_jibunAddress1').value = data.jibunAddress;
					                document.getElementById('sample4_jibunAddress2').value = data.jibunAddress;
							
					                // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
					                if(data.autoRoadAddress) {
					                    //예상되는 도로명 주소에 조합형 주소를 추가한다.
					                    var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
					                    document.getElementById('guide').innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
					
					                } else if(data.autoJibunAddress) {
					                    var expJibunAddr = data.autoJibunAddress;
					                    document.getElementById('guide').innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
					
					                } else {
					                    document.getElementById('guide').innerHTML = '';
					                }
					            }
					        }).open();
					    }
					</script>
</body>
</html>