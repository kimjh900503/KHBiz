<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>KHBiz_Wellcome</title>
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
<script src="//cdnjs.cloudflare.com/ajax/libs/wow/1.1.2/wow.js"></script>
<link href="/erp/css/bootstrap.css" rel="stylesheet" />
<link
	href="//cdnjs.cloudflare.com/ajax/libs/animate.css/3.1.1/animate.min.css"
	rel="stylesheet" />
<link href="/erp/css/navi.css" rel="stylesheet" />
<link href="/erp/css/firstmod.css" rel="stylesheet" />
<!-- alert -->
<script src="/erp/js/sweetalert.min.js"></script>
<link rel="stylesheet" type="text/css" href="/erp/css/sweetalert.css">
<!-- Count To javascript -->
<script type="text/javascript" src="/erp/js/jquery.countTo.js"></script>
<script type="text/javascript">
	$(function() {
		var chk1 = /[a-z]/i; //적어도 한개의 a-z가 있는지 확인
		var chk2 = /\d/; //적어도 한개의 0-9가 있는지 확인
		var height = $('body').height();
		var docH = $(document).height();
		var wHeight = $(window).height();
		var newHeight = $(window).height();
		var scrollBtm = docH - wHeight;
		$('.parallax-bg').css("height", newHeight + "px");
		$('body').scrollspy({
			target : '.navbar-fixed-top',
			offset : 60
		});
		$('#topNav').affix({
			offset : {
				top : 200
			}
		});
		$('.navbar-collapse ul li a').click(function() {
			/* always close responsive nav after click */
			$('.navbar-toggle:visible').click();
		});
		var message = "${message}";
		if (message != "") {
			swal(message);
		}
		var count = 0;

		$("#idCheck").click(function() {
			var id_1 = $("#id_1").val();
			var id_2 = $("#id_2").val();
			var id = $("#id_1").val() + "@" + $("#id_2").val();
			var regexp = /^[a-z][a-z0-9_-]{1,11}$/;
			var chk1 = /^[a-z][./a-z]$/; //적어도 한개의 a-z가 있는지 확인
			var chk2=/^([a-z/.]+)[.]([a-z]+)$/;
			if (id_1.length < 4 || !regexp.test(id_1)) {
				swal("에러", "4~12자리의 영문,숫자 조합만 사용가능합니다", "error");
				$('#id').addClass('has-error');
				count = 0;
				return false;
			}else if(!chk2.test(id_2)){
				swal("에러", "mail주소를 정확이 입력해주세요", "error");
				$('#id').addClass('has-error');
				count = 0;
				return false;
			}

			$.ajax({
				url : "memberIdCheck",
				data : {
					id : id
				},
				success : function(result) {
					if (result > 0) {
						swal("에러", "중복된 아이디입니다", "error");
						$('#id').addClass('has-error');
						count = 0;

					} else {
						swal("OK", "사용가능한 아이디입니다", "success");
						$('#id').addClass('has-success');
						count = 1
					}
				}
			});
		});

		$('#id_1').change(function() {
			$('#id').removeClass('has-success');
			$('#id').removeClass('has-error');
			count = 0;
		});
		$('#id_2').change(function() {
			$('#id').removeClass('has-success');
			$('#id').removeClass('has-error');
			count = 0;
		});
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


		$("#joinBtn").click(function() {
			var pw = $("#pw").val();
			var pwCheck = $("#pwCheck").val();
			var name = $("#name").val()
			var address = $("#sample4_roadAddress1").val();
			var phone1 = $("#phone1").val();
			var phone2 = $("#phone2").val();
			var pic=$("#pic").val();

			var chk1 = /[a-z]/i; //적어도 한개의 a-z가 있는지 확인
			var chk2 = /\d/; //적어도 한개의 0-9가 있는지 확인
			var chk3 = /^[가-힣]*$/;

			if (count == 0) {
				swal("에러", "아이디 중복확인을 하세요 ", "error");
				return false;
			} else if (pw.length < 6 || pw == '') {
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
			}else if(pic==''){
				swal("에러", "사진을 넣어주세요", "error");
		  		return false;
		  	} else {
				$("#frm").submit();
			}

		});
		$('#reset').click(function() {
			$('#blah').addClass('hidden');
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
</script>
</head>
<body>
	<nav id="topNav" class="navbar navbar-default navbar-fixed-top">
		<div class="container-fluid">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle collapsed"
					data-toggle="collapse" data-target="#bs-navbar">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand page-scroll" href="/erp/"><i
					class="ion-ios-analytics-outline"></i> KH Biz</a>
			</div>
			<div class="navbar-collapse collapse" id="bs-navbar">
				<ul class="nav navbar-nav navbar-right">
					<li><a class="page-scroll" data-toggle="modal"
						title="A free Bootstrap video landing theme" href="#aboutModal">About</a>
					</li>
				</ul>
			</div>
		</div>
	</nav>
	<div class="content" id="first">
		<div class="scrollToTop circle">
			<i class="icon-up-open-big"></i>
		</div>
		<div class="parallax-bg">
			<video id="video-elem" preload="auto" loop="100" muted="muted"
				autoplay="autoplay" poster="/erp/images/31a43150.main_image.png">
				<%-- <source
					src="/erp/images/2015121711353535351ba.mp4"
					type="video/mp4">
				<source
					src="/erp/images/201512180103383381qk.mp4"
					type="video/mp4"> --%>
			</video>
			<div class="media video-overlay" style="margin: 0">
				<section>
					<div class="container">
						<div class="row">
							<div class="col-lg-12 col-md-12">
							<div id="content">
								<div class="title text-center">
									<h2>사용자 정보 입력하기</h2>
								</div>
								<form action="memberFirstMod" method="post" id="frm" enctype="multipart/form-data">
									<input type="hidden" name="code" value="${member.code}" class="form-control" readonly>
									<div class="col-lg-6 col-md-6">
										<table>
											<tr>
										<td class="form-group has-feedback text-left col-md-4">
											<label>사원 번호</label>
											<p>${member.code}</p>
										</td>
										<td class="form-group has-feedback text-left col-md-4">
											<label>부서</label>
											<p>${member.department}</p>
										</td>
										<td class="form-group has-feedback text-left col-md-4">
											<label>직급</label>
											<p>${member.position}</p>
										</td>
											</tr>
										</table>
										<div class="text-left">
											<label>프로필 사진</label>
										</div>
										<div class="form-group has-feedback text-left input-group form-inline">
											<img id="blah" class="hidden" style="width:120px; height: 160px;"/>
											<input type="file" id="pic" accept="image/*" name="pic">
										</div>
										<div class="text-left">
											<label>아이디</label>
										</div>
										<div id="id" class="form-group has-feedback text-left input-group form-inline">
											<input type="text" name="id_1" class="form-control" id="id_1" maxlength="12"
												placeholder="아이디">
											<div class="input-group-addon" id="basic-addon1">@</div>
											<input type="text" class="form-control"
												placeholder="mail.com" id="id_2" name="id_2"
												aria-describedby="basic-addon1"> <span
												class="input-group-btn">
												<button class="btn btn-info" type="button" id="idCheck">중복확인</button>
											</span>
										</div>
										<div class="form-group has-feedback text-left">
											<label>비밀번호</label> <input type="password" name="pw" id="pw"
												class="form-control">
										</div>
										<div class="form-group has-feedback text-left">
											<label>비밀번호 확인</label> <input type="password" id="pwCheck"
												class="form-control">
										</div>
									</div>
									<div class="col-lg-6 col-md-6">
										<div class="form-group has-feedback text-left">
											<label>이름</label> <input type="text" id="name" name="name"
												class="form-control" id="name">
										</div>
										<div class="form-group has-feedback text-left">
											<label>성별</label> <select name="gender" class="form-control">
												<option value="남자">남자</option>
												<option value="여자">여자</option>
											</select>
										</div>
										<div class="form-group form-inline has-feedback text-left">
											<label>생년월일</label>
											<div class="row" style="margin-left: 1%">
												<div class="form-group input-group col-lg-3.5 col-md-3.5">
													<select name="year" id="year" class="birth form-control">
														<c:forEach var="i" begin="1950" end="2016" step="1">
															<option value="${2016 - i + 1950}">${2016 - i + 1950}</option>
														</c:forEach>
													</select> <span class="input-group-addon">년</span>
												</div>
												<div class="form-group input-group col-lg-3.5 col-md-3.5">
													<select name="month" id="month" class="birth form-control">
														<c:forEach var="j" begin="1" end="12" step="1">
															<option value="${j}">${j}</option>
														</c:forEach>
													</select> <span class="input-group-addon">월</span>
												</div>
												<div class="form-group input-group col-lg-3.5 col-md-3.5">
													<select name="day" id="day" class="birth form-control">
														<c:forEach var="k" begin="1" end="31" step="1">
															<option value="${k}">${k}</option>
														</c:forEach>
													</select> <span class="input-group-addon">일</span>
												</div>
											</div>
										</div>
										<div class="text-left">
											<label>전화번호</label>
										</div>
										<div
											class="form-group has-feedback text-left input-group form-inline">
											<input type="text" class="form-control phone" value="010"
												readonly>
											<div class="input-group-addon" id="basic-addon1">-</div>
											<input type="text" name="phone1" class="form-control phone" maxlength="4"
												id="phone1">
											<div class="input-group-addon" id="basic-addon1">-</div>
											<input type="text" name="phone2" class="form-control phone" maxlength="4"
												id="phone2">
										</div>
										<div class="text-left">
											<label>주소</label>
										</div>
										<div
											class="form-group has-feedback text-left input-group form-inline">
											<input type="text" id="sample4_postcode" placeholder="우편번호"
												class="join_text form-control"> <span
												class="input-group-btn">
												<button class="btn btn-info " type="button" id="join_btn2"
													onclick="sample4_execDaumPostcode()">우편번호 찾기</button>
											</span>
										</div>
										<div class="form-group has-feedback text-left">
											<label>도로명 주소</label> <input type="hidden"
												id="sample4_roadAddress1" name="address1"> <input
												class="join_text form-control" type="text"
												id="sample4_roadAddress2" placeholder="도로명주소"
												disabled="disabled"> <input type="hidden"
												id="sample4_jibunAddress1" name="address2"> <input
												class="join_text form-control" type="hidden"
												id="sample4_jibunAddress2" placeholder="지번주소"
												disabled="disabled"><span id="guide" style="color:#999"></span>
										</div>
									</div>
									<div class="row" style="margin-bottom: 15px">
										<div class="col-lg-6 col-md-6 col-lg-offset-3 col-md-offset-3 text-center">
										<button class="btn btn-info" id="joinBtn">등록</button>
										<button class="btn btn-defalut" type="reset" id="reset">다시쓰기</button>
										<button class="btn btn-defalut" onclick="location.href='/erp/'; return false;">취소</button>
										</div>
									</div>
								</form>
							</div>
							</div>
						</div>
					</div>
				</section>
			</div>
		</div>
	</div>
	<!-- <footer id="footer">
		<div class="container-fluid">
			<div class="row">
				<div class="col-xs-6 col-sm-3 column">
					<h4>Information</h4>
					<ul class="list-unstyled">
						<li><a href="">Products</a></li>
						<li><a href="">Services</a></li>
						<li><a href="">Benefits</a></li>
						<li><a href="">Developers</a></li>
					</ul>
				</div>
				<div class="col-xs-6 col-sm-3 column">
					<h4>About</h4>
					<ul class="list-unstyled">
						<li><a href="#">Contact Us</a></li>
						<li><a href="#">Delivery Information</a></li>
						<li><a href="#">Privacy Policy</a></li>
						<li><a href="#">Terms &amp; Conditions</a></li>
					</ul>
				</div>
				<div class="col-xs-12 col-sm-3 column">
					<h4>Stay Posted</h4>
					<form>
						<div class="form-group">
							<input type="text" class="form-control"
								title="No spam, we promise!" placeholder="Tell us your email">
						</div>
						<div class="form-group">
							<button class="btn btn-primary" data-toggle="modal"
								data-target="#alertModal" type="button">Subscribe for
								updates</button>
						</div>
					</form>
				</div>
				<div class="col-xs-12 col-sm-3 text-right">
					<h4>Follow</h4>
					<ul class="list-inline">
						<li><a rel="nofollow" href="" title="Twitter"><i
								class="icon-lg ion-social-twitter-outline"></i></a>&nbsp;</li>
						<li><a rel="nofollow" href="" title="Facebook"><i
								class="icon-lg ion-social-facebook-outline"></i></a>&nbsp;</li>
						<li><a rel="nofollow" href="" title="Dribble"><i
								class="icon-lg ion-social-dribbble-outline"></i></a></li>
					</ul>
				</div>
			</div>
			<br /> <span class="pull-right text-muted small"><a
				href="http://www.bootstrapzero.com">Landing Zero by
					BootstrapZero</a> ©2015 Company</span>
		</div>
	</footer> -->
	<div id="aboutModal" class="modal fade in" tabindex="-1" role="dialog"
		aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-body">
					<h2 class="text-center">Landing Zero Theme</h2>
					<h5 class="text-center">A free, responsive landing page theme
						built by BootstrapZero.</h5>
					<p class="text-justify">This is a single-page Bootstrap
						template with a sleek dark/grey color scheme, accent color and
						smooth scrolling. There are vertical content sections with subtle
						animations that are activated when scrolled into view using the
						jQuery WOW plugin. There is also a gallery with modals that work
						nicely to showcase your work portfolio. Other features include a
						contact form, email subscribe form, multi-column footer. Uses
						Questrial Google Font and Ionicons.</p>
					<p class="text-center">
						<a href="http://www.bootstrapzero.com">Download at
							BootstrapZero</a>
					</p>
					<br />
					<button class="btn btn-primary btn-lg center-block"
						data-dismiss="modal" aria-hidden="true">OK</button>
				</div>
			</div>
		</div>
	</div>
	<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
	<script>
		//본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
		function sample4_execDaumPostcode() {
			new daum.Postcode(
					{
						oncomplete : function(data) {
							// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

							// 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
							// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
							var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
							var extraRoadAddr = ''; // 도로명 조합형 주소 변수

							// 법정동명이 있을 경우 추가한다. (법정리는 제외)
							// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
							if (data.bname !== ''
									&& /[동|로|가]$/g.test(data.bname)) {
								extraRoadAddr += data.bname;
							}
							// 건물명이 있고, 공동주택일 경우 추가한다.
							if (data.buildingName !== ''
									&& data.apartment === 'Y') {
								extraRoadAddr += (extraRoadAddr !== '' ? ', '
										+ data.buildingName : data.buildingName);
							}
							// 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
							if (extraRoadAddr !== '') {
								extraRoadAddr = ' (' + extraRoadAddr + ')';
							}
							// 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
							if (fullRoadAddr !== '') {
								fullRoadAddr += extraRoadAddr;
							}

							// 우편번호와 주소 정보를 해당 필드에 넣는다.
							document.getElementById('sample4_postcode').value = data.zonecode; //5자리 새우편번호 사용
							document.getElementById('sample4_roadAddress1').value = fullRoadAddr;
							document.getElementById('sample4_roadAddress2').value = fullRoadAddr;
							document.getElementById('sample4_jibunAddress1').value = data.jibunAddress;
							document.getElementById('sample4_jibunAddress2').value = data.jibunAddress;

							// 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
							if (data.autoRoadAddress) {
								//예상되는 도로명 주소에 조합형 주소를 추가한다.
								var expRoadAddr = data.autoRoadAddress
										+ extraRoadAddr;
								document.getElementById('guide').innerHTML = '(예상 도로명 주소 : '
										+ expRoadAddr + ')';

							} else if (data.autoJibunAddress) {
								var expJibunAddr = data.autoJibunAddress;
								document.getElementById('guide').innerHTML = '(예상 지번 주소 : '
										+ expJibunAddr + ')';

							} else {
								document.getElementById('guide').innerHTML = '';
							}
						}
					}).open();
		}
	</script>
</body>
</html>