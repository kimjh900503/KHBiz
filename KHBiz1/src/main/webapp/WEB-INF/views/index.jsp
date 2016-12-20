<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>KHBiz_Home</title>
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
<link href="/erp/css/main.css" rel="stylesheet" />
<!-- alert -->
<script src="/erp/js/sweetalert.min.js"></script>
<link rel="stylesheet" type="text/css" href="/erp/css/sweetalert.css">
<!-- Count To javascript -->
<script type="text/javascript" src="/erp/js/jquery.countTo.js"></script>
<script src="/erp/js/jquery.cookie.js"></script>
<script type="text/javascript">
	$(function() {
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
		$('#id').focus();
		var id = $.cookie("id");
	    var pw = $.cookie("pw");
	    if(id != undefined && pw !=undefined) {
	        //아이디에 쿠키값을 담는다
	        $("#id").val(id);
	        $("#pw").val(pw);
	        //아이디저장 체크박스 체크를 해놓는다
	        $("#userSave").prop("checked",true);
	    } 
	     
	    //로그인 버튼 클릭시
	    $("#loginBTN").click(function(){
	        //아이디 미입력시
	        if($.trim($("#id").val()) == "" && $.trim($("#pw").val()) ) {
	            alert("아이디를 입력하세요");
	            return;
	        //아이디 입력시
	        } else {
	            //아이디저장 체크되어있으면 쿠키저장
	            if($("#userSave").prop("checked")) {
	                $.cookie("id", $("#id").val());
	                $.cookie("pw", $("#pw").val());
	            //아이디저장 미체크면 쿠키에 정보가 있던간에 삭제
	            } else {
	                $.removeCookie("id");
	                $.removeCookie("pw");
	            }
	          
	        }
	    });

	});
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
				<a class="navbar-brand page-scroll" href="#first"><i
					class="ion-ios-analytics-outline"></i> KH Biz</a>
			</div>
			<div class="navbar-collapse collapse" id="bs-navbar">
				<ul class="nav navbar-nav">
					<!-- <li><a class="page-scroll" href="#one">Intro</a></li>
					<li><a class="page-scroll" href="#two">Highlights</a></li>
					<li><a class="page-scroll" href="#three">Gallery</a></li>
					<li><a class="page-scroll" href="#four">Features</a></li>
					<li><a class="page-scroll" href="#last">Contact</a></li> -->
				</ul>
				<!-- <ul class="nav navbar-nav navbar-right">
					<li><a href="#" class="page-scroll"> Sign Up</a></li>
				</ul>
				<ul class="nav navbar-nav navbar-right">
					<li><a class="page-scroll" data-toggle="modal"
						href="#login-form">Login</a></li>
				</ul>
				<ul class="nav navbar-nav navbar-right">
					<li><a class="page-scroll" data-toggle="modal"
						title="A free Bootstrap video landing theme" href="#aboutModal">About</a>
					</li>
				</ul> -->
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
				<!-- <source
					src="/erp/images/background-video-banner.mp4"
					type="video/mp4">
				<source
					src="/erp/images/background-video-banner.webm"
					type="video/webm"> -->
			</video>
			<div class="media video-overlay">
				<section>
					<div class="container" style="width : 58%; height : 650px; ">
							<div class="col-md-12 col-md-offset-1" style = "margin-left: 20%;">
								<div class="feature">
									<div id="img" style=" margin-top: 7%;margin-left: 17%;">
										<img src ="/erp/images/khbiz(1).png">
									</div>
								<!-- 	<h2 style="color: #fff">
										<small style="color: #0000a0">HELLO</small><br> KH Biz
									</h2>
									<h1 style="color: #fff" class="text-faded">효과적인 업무. KH Biz
										를 시작하세요</h1>
									<h3 style="color: #fff" class="text-faded">간편한 소통, 원하던 기능을
										전부 담았습니다.</h3> -->
								</div>						
						</div>
						<div class="row" style="margin-top: 17%; height : 450px; width : 100%;  ">
						<div class="col-md-6 col-md-offset -1" id="index_login" style = "margin-left:10%; height : 350px; ">
							<div >
							<form class="login-form" action="member/memberLogin"
									method="post">
									<div class="form-group has-feedback text-left" style="margin-top: 3%;">
										<label class="control-label" style="color: #fff">아이디</label> <input
											type="text" style="height: 45px;" name="id" id="id"
											autofocus="autofocus"
											class="form-control lowercase ng-invalid ng-invalid-required ng-touched"
											placeholder="아이디"> <i
											class="fa fa-user form-control-feedback"></i>
									</div>
									<div class="form-group has-feedback text-left">
										<label class="control-label" style="color: #fff">비밀번호</label>
										<input style="height: 45px;" name="pw" type="password" id="pw"
											class="form-control" placeholder="비밀번호"> <i
											class="fa fa-lock form-control-feedback"></i>
									</div>
									<div class="text-left form-inline">
										<input type="checkbox" id="userSave"> <label for="userSave"
											class="control-label" style="color: #fff">아이디&비밀번호 저장</label>
									</div>
									<div class="text-center" style="margin-top: 5%">
										<button type="submit" class="btn btn-info btn-lg" id="loginBTN"
											aria-hidden="true" style="width: 100px;">Log In</button>
									</div>
									<ul style="margin-top: 10px">
										<li class="text-center"><a href="#idModal"
											aria-hidden="true" data-toggle="modal">ID/PW 찾기</a></li>
									</ul>
								</form>
						</div>
						</div>
						
						<div id = "images" style="width : 25%; margin-left : 68%; height : 500px;" >
                     <div style="width : 100%; ">
                        <img src = "/erp/images/inbox1.png" style="float:left; width: 25%;">
                        <h2 style="float:left; color:white; font-weight: bolder; margin-top: 5%;">전자결재</h2>
                     </div>
                     
                     <div style="height:62px; width : 100%;"></div>
                     
                     <div style="width : 100%; margin-top: 2%;float:left;">
                        <img src = "/erp/images/chat.png" style="float:left; width: 25%;">
                        <h2 style="float:left; color:white; font-weight: bolder; margin-top: 5%;">채팅 기능</h2>
                     </div>
                        
                        <div style="height:62px; width : 100%;"></div>
                     
                     <div style="width : 100%;  margin-top: 5%;float:left;">
                        <img src = "/erp/images/calendar.png" style="float:left; width: 25%;">
                        <h2 style="float:left; color:white; font-weight: bolder; margin-top: 5%;">일정관리</h2>
                     </div>
                     
                           <div style="height:62px; width : 100%;"></div>
                     
                     <div style="width : 100%;  margin-top: 5%;float:left;">
                        <img src = "/erp/images/members.png" style="float:left; width: 25%;">
                        <h2 style="float:left; color:white; font-weight: bolder; margin-top: 5%;">사원관리</h2>
                     </div>
                     
                        <div style="height:62px; width : 100%;"></div>
                     
                     <!-- <div style="width : 100%; margin-top: 5%;float:left;">
                        <img src = "/erp/images/exclamation.png" style="float:left; width: 25%;">
                        <h2 style="float:left; color:white; font-weight: bolder; margin-top: 5%;">공지사항</h2>
                     </div> -->
							
						
						</div>
				
					</div>
				</section>
			</div>
		</div>
	</div>

	<div id="idModal" class="modal fade in" tabindex="-1" role="dialog"
		aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content" style="margin-top: 100px;">
				<div class="modal-header">
					<h4 id="modalTitle" class="modal-title">
						<span style="color: #0000a0">아이디/비밀번호</span> 찾기
					</h4>
				</div>
				<div class="modal-body">
					<div class="row">
						<div class="col-md-12">
							<form action="/erp/member/memberIdFind" method="post">
								<table class="table">
									<tr>
										<td class="col-md-2">이름</td>
										<td><input type="text" name="name" class="form-control"></td>
									</tr>
									<tr>
										<td>생년월일</td>
										<td class="form-group form-inline has-feedback text-left">
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
										</td>
									</tr>
									<tr>
										<td>핸드폰</td>
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
										</td>
									</tr>
								</table>
								<button class="find_btn btn btn-info">아이디 찾기</button>
							</form>
						</div>
					</div>
					<div class="row">
						<div class="col-md-12">
							<form action="/erp/member/memberPwFind" method="post">
								<table class="table">
									<tr>
										<td class="col-md-2">아이디</td>
										<td class="form-group has-feedback text-left input-group form-inline">
										<input type="text" name="id_1" class="form-control" id="id_1"
												placeholder="아이디">
											<div class="input-group-addon" id="basic-addon1">@</div>
											<input type="text" class="form-control"
												placeholder="mail.com" id="id_2" name="id_2"
												aria-describedby="basic-addon1">
										</td>
									</tr>
									<tr>
										<td>이름</td>
										<td><input type="text" name="name" class="form-control"></td>
									</tr>

									<tr>
										<td>핸드폰</td>
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
										</td>
									</tr>
								</table>
								<button class="find_btn btn btn-info">비밀번호 찾기</button>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>


</body>
</html>