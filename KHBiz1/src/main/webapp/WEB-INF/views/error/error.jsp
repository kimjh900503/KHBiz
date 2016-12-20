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
			
		</div>
	</nav>
	<div class="content" id="first">
		<div class="scrollToTop circle">
			<i class="icon-up-open-big"></i>
		</div>
		<div class="parallax-bg">
			<video id="video-elem" preload="auto" loop="100" muted="muted"
				autoplay="autoplay" poster="/erp/images/31a43150.main_image.png">
			
			</video>
			<div class="media video-overlay">
				<section>
					<div class="container" style="width : 58%; height : 650px; ">
							<div class="col-md-12 col-md-offset-1" style = "margin-left: 20%;">
								<div class="feature">
									<div id="img" style=" margin-top: 7%;margin-left: 17%;">
										<img src ="/erp/images/khbiz(1).png">
									</div>
								
								</div>						
						</div>
						<div class="row" style="margin-top: 17%; height : 450px; width : 100%;">
						<div class="col-md-6 col-md-offset -1" id="index_login" style =" width: 630px; height : 350px; margin-left: 210px; margin-top: 50px;">
							<div style="color: white;">
								<img src="/erp/images/느낌표2.png">
								<h2 style="color:white; font-weight: bolder;display: inline;">페이지를 찾을수 없습니다</h2><br>
									<span style="font-size: large;">
									요청하신 페이지를 찾을수 없습니다<br>
									찾으시려는 페이지는 주소를 잘못 입력하였거나<br>
									페이지 주소의 변경 또는 삭제 등의 이유로 페이지를 찾을수 없습니다<br></span>
									<span style="font-weight: bolder; font-size: large;">입력하신 페이지의 주소와 경로가 정확한지 한번더 확인 후 이용하시기 바랍니다<br></span>
								
								<a href="/erp"><input type="button" class="btn btn-info btn-lg" value="home" style="width: 100px; height: 40px; margin-left: 40%; margin-top: 30px;"></a>
							</div>
						</div>
						
						
				
					</div>
					</div>
				</section>
			</div>
		</div>
	</div>


</body>
</html>