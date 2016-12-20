<%@page import="javax.websocket.Session"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
a {
	text-decoration: none;
	color: black;
}

body {
	margin: 0;
	padding: 0;
	overflow-y:hidden;
}

#mask {
	position: absolute;
	z-index: 9000;
	background: rgba(120, 124, 127, 2);
	display: none;
	left: 0;
	top: 0;
	opacity: 0.9;
}

.window {
	width: 40%;
	display: none;
	position: absolute;
	left: 100px;
	top: 100px;
	z-index: 10000;
}

.chatroom {
	width: 40%;
	display: none;
	position: absolute;
	left: 100px;
	top: 100px;
	z-index: 10000;
}

.modchatroom {
	width: 40%;
	display: none;
	position: absolute;
	left: 100px;
	top: 100px;
	z-index: 10000;
}

#title {
	padding: 12px;
	background: rgb(54, 99, 128);
	height: 27px;
	color: white;
	padding-left: 3%;
	font-weight: bold;
	border-top-left-radius: 0.3em;
	border-top-right-radius: 0.3em;
}

#close {
	margin-left: 75%;
	cursor: pointer;
}

.close11 {
	margin-left: 75%;
	cursor: pointer;
}

#content {
	width: 100%;
	height: 100%;
	background: rgb(241, 244, 249);
	border-bottom-left-radius: 0.3em;
	border-bottom-right-radius: 0.3em;
}

#str {
	padding-left: 25px;
	width: 93%;
	height: 30px;
	border: 1px solid #b0b3b5;
}

#type {
	height: 34px;
	background-color: #E7E7E9;
}

#table1 {
	margin-top: 20px;
	width: 78%;
	margin: 0 auto;
}

.gray {
	background-color: gray;
}

.g {
	background-color: #EAEAEA;
}

.td1 {
	width: 80%;
}

.td2 {
	width: 20%;
}

#table2 {
	border-spacing: 5px;
}

#table2 td {
	background-color: white;
	height: 61px;
	cursor: pointer;
}

.name {
	display: inline-block;
	height: 25px;
	line-height: 25px;
	margin-top: 10px;
	font-weight: bold;
	margin-left: 10px;
}

#user {
	display: inline-block;
	margin-left: 10px;
	margin-top: 10px;
	height: 25px;
	weight: 25px;
	margin-left: 10px;
}

.left {
	float: left;
}

.right {
	float: left;
}

.mail {
	clear: both;
	margin-left: 50px;
	color: #7E7E7E;
}

#all {
	margin-left: 11%;
}

.close2 {
	margin-left: 60%;
	cursor: pointer;
	background-color: white;
	font-weight: bold;
	font-size: 12pt;
	color: #B4B4B4;
	width: 10%;
	height: 38px;
	border: 1px solid #D8D8D8;
	border-radius: 0.25em;
}

.close22 {
	margin-left: 60%;
	cursor: pointer;
	background-color: white;
	font-weight: bold;
	font-size: 12pt;
	color: #B4B4B4;
	width: 10%;
	height: 38px;
	border: 1px solid #D8D8D8;
	border-radius: 0.25em;
}

#invite {
	background: rgb(0, 178, 232);
	color: white;
	font-weight: bold;
	font-size: 12pt;
	width: 15%;
	height: 38px;
	border: 1px solid #D8D8D8;
	border-radius: 0.25em;
	cursor: pointer;
	margin-left: 70%;
}

#nameList {
	margin-left: 6%;
}

.nameBtn {
	cursor: pointer;
	padding: 4px;
	background-color: #00A8EB;
	color: white;
	font-weight: bold;
	border: 0px;
	border-radius: 0.25em;
	width: 15%;
	height: 26px;
	font-size: 11pt;
	margin-right: 4px;
	margin-bottom: 3px;
}

#cancelimg {
	width: 10px;
	height: 10px;
}

.mail {
	display: none;
}

#header {
	width: 100%;
	height: 50px;
	background: rgb(18, 69, 112);
}

#menu {
	float: left;
	width: 15%;
	background: rgb(255, 255, 255);
	border: 1px solid rgb(215, 215, 215);
}

#contents {
	float: left;
	width: 84.6%;
	height: 600px; 
	/* height:90%; */
	background: rgb(242, 247, 253);
}

#create2 {
	background: rgb(0, 178, 232);
	color: white;
	font-weight: bold;
	font-size: 12pt;
	width: 15%;
	height: 38px;
	border: 1px solid #D8D8D8;
	border-radius: 0.25em;
	cursor: pointer;
}

#modBtn {
	background: rgb(0, 178, 232);
	color: white;
	font-weight: bold;
	font-size: 12pt;
	width: 15%;
	height: 38px;
	border: 1px solid #D8D8D8;
	border-radius: 0.25em;
	cursor: pointer;
}

#name {
	border: 1px solid #b0b3b5;
	border-radius: 0.25em;
	width: 95%;
	height: 30px;
}

#group {
	border: 1px solid #b0b3b5;
	border-radius: 0.25em;
	width: 50%;
	height: 30px;
}

#explain {
	border: 1px solid #b0b3b5;
	border-radius: 0.25em;
	width: 95%;
	height: 100px;
}

#cname {
	border: 1px solid #b0b3b5;
	border-radius: 0.25em;
	width: 95%;
	height: 30px;
}

#cdetail {
	border: 1px solid #b0b3b5;
	border-radius: 0.25em;
	width: 95%;
	height: 100px;
}

#table3 {
	width: 90%;
	height: 200px;
	margin: 0 auto;
}

#plus {
	margin-left: 65%;
	cursor: pointer;
}

#submenu {
	background: rgb(255, 255, 255);
	border: 1px solid rgb(215, 215, 215);
	position: absolute;
	top: 129px;
	left: 227px;
	width: 160px;
}

.sub {
	cursor: pointer;
	height: 40px;
}

#submenu2 {
	background: rgb(255, 255, 255);
	border: 1px solid rgb(215, 215, 215);
	position: absolute;
	top: 14%;
	left: 88%;
	width: 160px;
}

.sub2 {
	cursor: pointer;
	height: 40px;
}

#submenu3 {
	background: rgb(255, 255, 255);
	border: 1px solid rgb(215, 215, 215);
	position: absolute;
	top: 14%;
	left: 81.4%;
	width: 160px;
	z-index:99999999;
}

.sub3 {
	cursor: pointer;
	height: 40px;
}

#more {
	cursor: pointer;
	margin-left: 55%;
}

#make {
	width: 60%;
	margin: 0 auto;
	margin-top: 13%;
}

#folder {
	cursor: pointer;
}

#makeBtn {
	background: rgb(0, 178, 232);
	color: white;
	font-weight: bold;
	font-size: 12pt;
	width: 17%;
	height: 38px;
	border: 1px solid #D8D8D8;
	border-radius: 0.25em;
	cursor: pointer;
}

#inputMessage {
	width: 90%;
	border: 1px solid rgb(215, 215, 215);
	height: 65px;
}

.bubble {

	margin-left: 5%;
	position: relative;
	width: 500px;
	
	padding: 10px;
	background: #FFFFFF;
	-webkit-border-radius: 6px;
	-moz-border-radius: 6px;
	border-radius: 6px;
	position: relative;
	padding-left:2px;
}

.bubble:after {
	content: '';
	position: absolute;
	border-style: solid;
	border-width: 10px 14px 10px 0;
	border-color: transparent #FFFFFF;
	display: block;
	width: 0;
	z-index: 1;
	left: -10px;
	top: 10px;
}

.bubble2 {
	margin-left: 54%;
	position: relative;
	width: 500px;
	padding: 10px;
	background: #FFE400;
	-webkit-border-radius: 6px;
	-moz-border-radius: 6px;
	border-radius: 6px;
}

.bubble2:after {
	content: '';
	position: absolute;
	border-style: solid;
	border-width: 10px 0 10px 14px;
	border-color: transparent #FFE400;
	display: block;
	width: 0;
	z-index: 1;
	right: -12px;
	top: 10px;
}

.my {
	display: inline-block;
}

#date {
	color: rgb(142, 159, 169);
	font-weight: bolder;
}

#create {
	width: 100%;
	background: rgb(225, 235, 244);
	height: 50px;
	display: hidden;
}

#ctext {
	line-height: 50px;
	color: rgb(142, 159, 169);
}

#sendWindow {
	width: 85%;
	height: 100px;
	background: rgb(255, 255, 255);
	border-top: 1px solid rgb(215, 215, 215);
	position: fixed;
	z-index: 100;
	top: 85%;
	left: 15.2%;
}

.time {
	font-size: 9pt;
	color: #878787;
}

#messageWindow {
	width: 100%;
	height: 80%;
	overflow-y: scroll;
	overflow-x: hidden;
	background: rgb(242, 247, 253);
}

.yellow {
	color: yellow;
	margin-left: 55%;
	font-weight: bold;
	display: inline-block;
	margin-top: 10px;
}

.bubble3 {
	clear: both;
	position: absolute;
	width: 60px;
	height: 30px;
	padding: 0px;
	background: #000000;
	-webkit-border-radius: 6px;
	-moz-border-radius: 6px;
	border-radius: 6px;
	color: white;
	padding: 2px;
	margin-left: 79.5%;
	margin-top: 10px;
	z-index: 10;
}

.bubble3:after {
	content: '';
	position: absolute;
	border-style: solid;
	border-width: 0 12px 13px;
	border-color: #000000 transparent;
	display: block;
	width: 0;
	z-index: 1;
	top: -10px;
	left: 20px;
}

.bubble4 {
	position: absolute;
	width: 110px;
	height: 30px;
	padding: 0px;
	background: #000000;
	-webkit-border-radius: 6px;
	-moz-border-radius: 6px;
	border-radius: 6px;
	color: white;
	padding: 2px;
	margin-left: 75%;
	margin-top: 10px;
	z-index: 10;
}

.bubble4:after {
	content: '';
	position: absolute;
	border-style: solid;
	border-width: 0 12px 13px;
	border-color: #000000 transparent;
	display: block;
	width: 0;
	z-index: 1;
	top: -10px;
	left: 45px;
}

.bubble5 {
	position: absolute;
	width: 80px;
	height: 30px;
	padding: 0px;
	background: #000000;
	-webkit-border-radius: 6px;
	-moz-border-radius: 6px;
	border-radius: 6px;
	color: white;
	padding: 2px;
	margin-left: 72%;
	margin-top: 10px;
	z-index: 10;
}

.bubble5:after {
	content: '';
	position: absolute;
	border-style: solid;
	border-width: 0 12px 13px;
	border-color: #000000 transparent;
	display: block;
	width: 0;
	z-index: 1;
	top: -10px;
	left: 30px;
}

#setting {
	width: 95%;
	background-color: white;
	height: 40px;
	border-bottom: 1px solid rgb(215, 215, 215);
	padding-left: 5%;
	display: table;
}

.ctitle {
	float: left;
}

.im {
	background: rgb(242, 247, 253);
	border-radius: 0.25em;
	cursor: pointer;
	padding: 5px;
	height: 18px;
}

ul li {
	width: 2.7%;
	height: 25px;
	list-style: none;
	float: left;
	margin-right: 5px;
}

.im1 {
	position: absolute;
	width: 6.1%;
	height: 18px;
	left: 86%;
}

.im2 {
	position: absolute;
	left: 92.7%;
}

.im3 {
	position: absolute;
	left: 96%;
}

#subTable {
	width: 100%;
}

#cnameList {
	width: 60%;
}

#countList {
	width: 15%;
	heigth: 100px;
	margin-left: 45px;
}
/* .circle1 {
 width:40px;
 height:30px;
 border-radius:60px;
 -moz-border-radius : 100px;
 -webkit-border-radius : 100px;
 -ms-border-radius :100px;
 -khtml-border-radius : 100px;
 -o-border-radius :100px;
 background:red;
 font:normal 12px/200px "나눔고딕", "돋움", "굴림";
 color:white;
 text-align:center;
} */
.circle1 {
	border: 1px solid red;
	widtih: 60px;
	height: 25px;
	border-radius: 0.85em;
	color: white;
	font-weight: bold;
	background-color: red;
	margin-bottom: 10px;
}

.circle2 {
	widtih: 60px;
	height: 25px;
	border-radius: 0.85em;
	color: white;
	font-weight: bold;
	background-color: white;
	margin-bottom: 10px;
}

.cList {
	margin-left: 20px;
	height: 25px;
}

#clip {
	width: 40px;
	height: 40px;
	cursor: pointer;
	display: inline-block;
	margin-bottom: 20px;
}

.download {
	margin-left: 85%;
	cursor: pointer;
}

.chatImg {
	padding-top: 10px;
	margin-left: 65%;
	width: 30%;
	border: 1px solid #b0b3b5;
	border-collapse: collapse;
	background-color: #F6F7FB;
}

.chatText {
	background-color: white;
	padding: 5px;
	font-weight: bold;
	border-top: 1px solid #b0b3b5;
}

.chatFile {
	background-color: white;
	padding-top: 10px;
	border: 1px solid #b0b3b5;
	margin-left: 65%;
	width: 30%;
}

.chatImg2 {
	padding-top: 10px;
	width: 30%;
	border: 1px solid #b0b3b5;
	border-collapse: collapse;
	background-color: #F6F7FB;
	margin-left: 5%;
}

.chatFile2 {
	background-color: white;
	padding-top: 10px;
	border: 1px solid #b0b3b5;
	margin-left: 5%;
	width: 30%;
}

.download2 {
	margin-left: 20%;
	cursor: pointer;
}

#profile {
	width: 99.5%;
	background-color: #F5FAFD;
	border-bottom: solid 3px #DCDCDC;
}

#userList, #moreInvite, #moreSetting {
	width: 19px;
	height: 19px;
}

#profileImg {
	width: 40px;
	height: 40px;
}

.profileImg1 {
	margin-left: 50%;
	width: 30px;
	height: 30px;
}

.profileImg2 {
	width: 30px;
	height: 30px;
}
</style>
<script src="https://code.jquery.com/jquery-latest.js"></script>
<script
	src='//cdnjs.cloudflare.com/ajax/libs/jquery.form/3.51/jquery.form.min.js'></script>
<script type="text/javascript">
	var message = '${message}';
	if (message != '') {
		alert(message);
	}
</script>
<script>
	var check2 = '';
	var check3 = '';
	var downloadPath = '';
	jQuery.fn.center = function() {
		this.css("position", "absolute");
		this.css("top", Math.max(0, (($(window).height() - $(this)
				.outerHeight()) / 2)
				+ $(window).scrollTop())
				+ "px");
		this.css("left", Math.max(0,
				(($(window).width() - $(this).outerWidth()) / 2)
						+ $(window).scrollLeft())
				+ "px");
		return this;
	}
	function wrapWindowByMask() {
		//화면의 높이와 너비를 구한다.
		var maskHeight = $(document).height();
		var maskWidth = $(window).width();

		//마스크의 높이와 너비를 화면 것으로 만들어 전체 화면을 채운다.
		$('#mask').css({
			'width' : maskWidth,
			'height' : maskHeight
		});

		//애니메이션 효과 - 일단 1초동안 까맣게 됐다가 80% 불투명도로 간다.
		$('#mask').fadeIn(1000);
		$('#mask').fadeTo("slow", 0.9);

		//윈도우 같은 거 띄운다.
		$('.window').show();
		$(".window").center();

	}
	function wrapWindowByMask2() {
		//화면의 높이와 너비를 구한다.
		var maskHeight = $(document).height();
		var maskWidth = $(window).width();

		//마스크의 높이와 너비를 화면 것으로 만들어 전체 화면을 채운다.
		$('#mask').css({
			'width' : maskWidth,
			'height' : maskHeight
		});

		//윈도우 같은 거 띄운다.
		$("#mask").show();
		$('.chatroom').show();
		$(".chatroom").center();

	}

	function wrapWindowByMask3() {
		//화면의 높이와 너비를 구한다.
		var maskHeight = $(document).height();
		var maskWidth = $(window).width();

		//마스크의 높이와 너비를 화면 것으로 만들어 전체 화면을 채운다.
		$('#mask').css({
			'width' : maskWidth,
			'height' : maskHeight
		});

		//윈도우 같은 거 띄운다.
		$("#mask").show();
		$('.modchatroom').show();
		$(".modchatroom").center();

	}

	$(document)
			.ready(
					function() {

						//contents의 높이 설정해주기 
						var newHeight = $(document).height()*0.8;
						//alert("newHeight"+newHeight);
						$("#contents").css("height", newHeight + "px");
						var allHeight = $(document).height();
						$("#menu").css("height",allHeight+"px");
						
						
						$("#submenu").hide();
						$("#submenu2").hide();
						$("#submenu3").hide();
						$(".bubble3").hide();
						$(".bubble4").hide();
						$(".bubble5").hide();

						//검색어 focus 주기 
						$("#str").focus();

						//선택한 type set해주기
						var searchType = "${type}";
						$(".typetext").each(function() {
							if ($(this).val() == searchType) {
								$(this).attr("selected", true);
							}
						});
						//입력한 검색어 set해주기 
						var str = "${str}";
						$("#str").val(str);

						//세팅해주기
						if (searchType == 'name' || searchType == '') {
							$(".name2").css("display", "block");
							$(".department2").css("display", "none");
							$(".position2").css("display", "none");
							$(".id2").css("display", "none");
							$(".phone2").css("display", "none");
						} else if (searchType == 'department') {
							$(".name2").css("display", "none");
							$(".department2").css("display", "block");
							$(".position2").css("display", "none");
							$(".id2").css("display", "none");
							$(".phone2").css("display", "none");
						} else if (searchType == 'position') {
							$(".name2").css("display", "none");
							$(".department2").css("display", "none");
							$(".position2").css("display", "block");
							$(".id2").css("display", "none");
							$(".phone2").css("display", "none");
						} else if (searchType == 'id') {
							$(".name2").css("display", "none");
							$(".department2").css("display", "none");
							$(".position2").css("display", "none");
							$(".id2").css("display", "block");
							$(".phone2").css("display", "none");
						} else {
							$(".name2").css("display", "none");
							$(".department2").css("display", "none");
							$(".position2").css("display", "none");
							$(".id2").css("display", "none");
							$(".phone2").css("display", "block");
						}
						//채팅방 생성하기 
						//검은 막 띄우기
						/* $('#chatroom').click(function(e) {
							e.preventDefault();
							wrapWindowByMask2();
						}); */
						//검은 막을 눌렀을 때
						$('#mask').click(function() {
							$(this).hide();
							$('.chatroom').hide();
						});
						//닫기 버튼을 눌렀을 경우 
						$(".close11").click(function() {
							$(location).attr('href', "chat?cname=${cname}");
						});
						//닫기버튼2를 눌렀을 경우
						$(".close22").click(function(e) {
							e.preventDefault();
							$(location).attr('href', "chat?cname=${cname}");
						});
						//닫기 버튼 hover 이벤트 
						$(".close22").hover(
								function() {
									$(this).css("background-color",
											"rgb(241, 244, 249)");
									$(this).css("color", "#7E7E7E");
								}, function() {
									$(this).css("background-color", "white");
									$(this).css("color", "#B4B4B4");
								});

						//채팅방 이름이 중복되지 않은지 검사 
						$("#name")
								.blur(
										function() {
											$
													.ajax({
														method : 'POST',
														url : 'checkCname',
														data : {
															cname : $("#name")
																	.val()
														},
														error : function(
																request,
																status, error) {
															alert("code: "
																	+ request.status
																	+ "\n"
																	+ "message: "
																	+ request.responseText
																	+ "\n"
																	+ "error: "
																	+ error);
														},
														success : function(
																result) {
															check2 = result
																	.trim();
															//alert("check 결과? "+check);
														}
													});
										});
						//다음단계로 버튼을 눌렀을 경우
						$("#create2").click(function(e) {
							e.preventDefault();
							//var check='';
							//이름은 필수사항(이름을 입력했는지 검사)
							if ($("#name").val() == '') {
								alert("채팅명을 입력해주세요");
							} else {
								if (check2 == '0') {
									alert("채팅명이 중복됩니다  채팅명을 재입력해주세요!");
									$("#name").val("");
								} else {
									$('.chatroom').hide();
									wrapWindowByMask();
								}
							}
						});

						//검은 막을 눌렀을 때
						$('#mask').click(function() {
							$(this).hide();
							$('.window').hide();
						});
						//닫기 버튼을 눌렀을 경우 
						$("#close").click(function() {
							$(location).attr('href', "chat?cname=${cname}");
						});
						//이전 버튼을 눌렀을 경우
						$(".close2").click(function(e) {
							//$(location).attr('href',"chat");
							e.preventDefault();
							$('.window').hide();
							wrapWindowByMask2();
						});
						//닫기 버튼 hover 이벤트 
						$(".close2").hover(
								function() {
									$(this).css("background-color",
											"rgb(241, 244, 249)");
									$(this).css("color", "#7E7E7E");
								}, function() {
									$(this).css("background-color", "white");
									$(this).css("color", "#B4B4B4");
								});

						//hover 이벤트 
						$(".mList").hover(function() {
							$(this).css("background-color", "#F1FBFF");
						}, function() {
							$(this).css("background-color", "white");
						});

						//검색 type 선택 변화있을 경우
						$("#type").on("change", function() {
							var type = $(this).val();
							if (type == 'name') {
								$(".name2").css("display", "block");
								$(".department2").css("display", "none");
								$(".position2").css("display", "none");
								$(".id2").css("display", "none");
								$(".phone2").css("display", "none");
							} else if (type == 'department') {
								$(".name2").css("display", "none");
								$(".department2").css("display", "block");
								$(".position2").css("display", "none");
								$(".id2").css("display", "none");
								$(".phone2").css("display", "none");
							} else if (type == 'position') {
								$(".name2").css("display", "none");
								$(".department2").css("display", "none");
								$(".position2").css("display", "block");
								$(".id2").css("display", "none");
								$(".phone2").css("display", "none");
							} else if (type == 'id') {
								$(".name2").css("display", "none");
								$(".department2").css("display", "none");
								$(".position2").css("display", "none");
								$(".id2").css("display", "block");
								$(".phone2").css("display", "none");
							} else {
								$(".name2").css("display", "none");
								$(".department2").css("display", "none");
								$(".position2").css("display", "none");
								$(".id2").css("display", "none");
								$(".phone2").css("display", "block");
							}
						});

						//검색어 입력 keyup 이벤트
						$("#str")
								.on(
										"keyup",
										function() {
											jQuery.ajaxSettings.traditional = true;

											var codes = [];
											$(".codes").each(function() {
												codes.push($(this).val());
											});

											var str = $("#str").val();
											var type = $("#type").val();

											if ($("#joinCheck").val() == 'yes') {
												//alert("여기에 참여된 리스트 추자해주기");
												$(".joinMemberCode").each(
														function() {
															codes.push($(this)
																	.val());
														});
											}

											var allData = {
												"type" : type,
												"str" : str,
												"codes" : codes
											};
											$
													.ajax({
														method : 'POST',
														url : 'memberList',
														data : allData,
														error : function(
																request,
																status, error) {
															alert("code: "
																	+ request.status
																	+ "\n"
																	+ "message: "
																	+ request.responseText
																	+ "\n"
																	+ "error: "
																	+ error);
														},
														success : function(
																result) {
															$("#table2").html(
																	result);
														}
													});
										});

						//회원리스트 중 하나를 선택했을 경우 
						$("#table2")
								.on(
										"click",
										".mList",
										function() {
											var index = $(".mList").index(this);
											var name = $(
													".name:eq(" + index + ")")
													.text();
											var code = $(
													".code:eq(" + index + ")")
													.val();

											var size = -1;
											$(".trList").each(function() {
												size++;
											});
											//마지막 자식일 경우 check 해주기 (모두 선택에)
											if (index == size) {
												$("#all").attr("checked", true);
											}
											//버튼 append하기 전에 list에서 지워주기 
											$(".trList:eq(" + index + ")")
													.remove();
											$("#nameList")
													.append(
															"<button class='nameBtn nameList'>"
																	+ name
																	+ "&nbsp;&nbsp;<img id='cancelimg' src='/erp/images/cancel1.png'/></button><input type='hidden' class='codes' name='codes' value='"+code+"'/>");
										});

						//선택한 이름을 눌렀을 경우  - 선택한 것 지워주기, list에 추가해주기 
						$("#nameList")
								.on(
										"click",
										".nameBtn",
										function() {
											var index = $(".nameBtn").index(
													this);
											$(".nameBtn:eq(" + index + ")")
													.remove();
											$(".codes:eq(" + index + ")")
													.remove();

											jQuery.ajaxSettings.traditional = true;

										

											var codes = [];
											$(".codes").each(function() {
												codes.push($(this).val());
											});

											if ($("#joinCheck").val() == 'yes') {
												//alert("여기에 참여된 리스트 추자해주기");
												$(".joinMemberCode").each(
														function() {
															codes.push($(this)
																	.val());
														});
												$("#joinCheck").val("yes");
											}

										/* 	$(".codes")
													.each(
															function() {
																alert("ajax 보내기전 값 확인"
																		+ $(
																				this)
																				.val());
															}); */

											var str = $("#str").val();
											var type = $("#type").val();

											var allData = {
												"type" : type,
												"str" : str,
												"codes" : codes
											};
											$
													.ajax({
														method : 'POST',
														url : 'memberList',
														data : allData,
														error : function(
																request,
																status, error) {
															alert("code: "
																	+ request.status
																	+ "\n"
																	+ "message: "
																	+ request.responseText
																	+ "\n"
																	+ "error: "
																	+ error);
														},
														success : function(
																result) {
															$("#table2").html(
																	result);
														}
													});
										});

						//체크박스를 선택,해제시 
						$("#all")
								.change(
										function() {
											if ($("#all").is(":checked")) {

												$(".code")
														.each(
																function() {
																	var i = $(
																			".code")
																			.index(
																					this);
																	var code = $(
																			this)
																			.val();
																	var name = $(
																			".name:eq("
																					+ i
																					+ ")")
																			.text();
																	$(
																			".trList:eq("
																					+ i
																					+ ")")
																			.remove();
																	$(
																			"#nameList")
																			.append(
																					"<button class='nameBtn nameList'>"
																							+ name
																							+ "&nbsp;&nbsp;<img id='cancelimg' src='/erp/images/cancel1.png'/></button><input type='hidden' class='codes' name='codes' value='"+code+"'/>");
																});
											} else {
												$(".nameBtn")
														.each(
																function() {
																	var i = $(
																			".nameBtn")
																			.index(
																					this);
																	$(this)
																			.remove();
																	$(
																			".codes:eq("
																					+ i
																					+ ")")
																			.remove();
																});
												jQuery.ajaxSettings.traditional = true;

												var codes = [];
												$(".codes").each(function() {
													codes.push($(this).val());
												});

												var str = $("#str").val();
												var type = $("#type").val();

												if ($("#joinCheck").val() == 'yes') {
													//alert("여기에 참여된 리스트 추자해주기");
													$(".joinMemberCode")
															.each(
																	function() {
																		codes
																				.push($(
																						this)
																						.val());
																	});
												}

												var allData = {
													"type" : type,
													"str" : str,
													"codes" : codes
												};
												$
														.ajax({
															method : 'POST',
															url : 'memberList',
															data : allData,
															error : function(
																	request,
																	status,
																	error) {
																alert("code: "
																		+ request.status
																		+ "\n"
																		+ "message: "
																		+ request.responseText
																		+ "\n"
																		+ "error: "
																		+ error);
															},
															success : function(
																	result) {
																$("#table2")
																		.html(
																				result);
															}
														});
											}
										});

						//초대하기 버튼을 눌렀을 경우 
						$("#invite")
								.click(
										function() {
											//alert("초대하기 버튼을 눌렀음");
											//alert("joinCheck1는"+$("#joinCheck").val()+"입니다.");
											//일 경우
											if ($("#joinCheck").val() == 'yes') {
												$("#joinCheck").val("yes");
												$("#name").val("${cname}");
												//websocket 보내서 파일에 append
												//db로 읽어와서 뿌려주기 
											} else {
												$("#joinCheck").val("no");
											}

											var codes = [];
											var names = [];
											$(".codes").each(function() {
												codes.push($(this).val());
											});
											$(".nameBtn").each(function() {
												names.push($(this).text());
											});
											if (codes.length == 0
													|| names.length == 0) {
												alert("초대할 멤버를 선택해주세요");
											} else {
												//web socket으로 초대 메시지 보내기 
												if ($("#joinCheck").val() == 'yes') {
													var nameList = "${member.name}님이 "
															+ names[0];
													for (var i = 1; i < names.length; i++) {
														nameList = nameList
																+ " "
																+ names[i];
													}
													nameList = nameList
															+ "님을 초대하셨습니다.";
													webSocket
															.send("moreInvite:"
																	+ nameList
																	+ ":${cname}");
													//websocket 보내서 파일에 append
												}

												//$(location).attr('href',"chatroom");
												for (var i = 0; i < codes.length; i++) {
													$("#frm2")
															.append(
																	"<input type='hidden' name='codes' value='"+codes[i]+"'/>");
													$("#frm2")
															.append(
																	"<input type='hidden' name='names' value='"+names[i]+"'/>");
												}
												//alert("joinCheck1는"+$("#joinCheck").val()+"입니다.");
												$("#frm2").submit();
											}
										});

						//채팅 + 버튼을 클릭했을 경우
						$("#plus").click(function() {
							wrapWindowByMask2();
						});
						//submenu hover 이벤트 
						$(".sub").hover(function() {
							$(this).css("background-color", "#F1FBFF");
						}, function() {
							$(this).css("background-color", "white");
						});

						//setting 버튼을 눌렀을 경우 
						$("#moreSetting").click(function() {
							//alert("클릭됨");
							var size = "${csize}";
							if (size != '0') {
								$("#submenu2").toggle();
							}
						});
						//moreSetting 
						$("#moreSetting").hover(function() {
							$(".bubble3").show();
						}, function() {
							$(".bubble3").hide();
						});

						//moreInvite
						$("#moreInvite").hover(function() {
							$(".bubble4").show();
						}, function() {
							$(".bubble4").hide();
						});

						//멤버 더 초대하기 
						$("#moreInvite")
								.click(
										function(e) {
											$("#joinCheck").val("yes");
											e.preventDefault();
											jQuery.ajaxSettings.traditional = true;

											var codes = [];
											$(".joinMemberCode").each(
													function() {
														//alert("여기에 참여된 리스트 추자해주기");
														//alert("추가된 리스트 "+$(this).val());
														codes.push($(this)
																.val());
													});

											//보내기전 list
											/* alert("보내기전 list");
											for(var i=0; i<codes.length;i++){
												alert("보내기전 code "+codes[i]);
											} */

											var allData = {
												"codes" : codes
											};
											$
													.ajax({
														method : 'POST',
														url : 'memberList',
														data : allData,
														error : function(
																request,
																status, error) {
															alert("code: "
																	+ request.status
																	+ "\n"
																	+ "message: "
																	+ request.responseText
																	+ "\n"
																	+ "error: "
																	+ error);
														},
														success : function(
																result) {
															$("#table2").html(
																	result);
															/* alert("moreInvite codes length"+codes.length);
															for(var i=0; i<codes.length; i++){
																alert("moreInvite codes값"+codes[i]);
																$("#nameList").append("<input type='hidden' class='codes' name='codes' value='"+codes[i]+"'/>");
															}//여기  */
															wrapWindowByMask();
														}
													});
										});

						//userList
						$(".im1").hover(function() {
							$(".bubble5").show();
						}, function() {
							$(".bubble5").hide();
						});

						$(".im1").click(function() {
							$("#submenu3").toggle();
						});

						$(".sub2").hover(function() {
							$(this).css("background-color", "#F1FBFF");
						}, function() {
							$(this).css("background-color", "white");
						});

						$("#folder")
								.click(
										function() {
											if ($(this).attr('src') == '/erp/images/folder3.png') {
												$(this)
														.attr('src',
																'/erp/images/folder4.png');
											} else {
												$(this)
														.attr('src',
																'/erp/images/folder3.png');
											}
										});
						//오른쪽 채팅방 만들기 -바로가기
						$('#makeBtn').click(function(e) {
							e.preventDefault();
							wrapWindowByMask2();
						});
						//여기를 클릭해서 채팅방 생성 
						$(".underline").hover(function() {
							$(this).css("text-decoration", "underline");
						}, function() {
							$(this).css("text-decoration", "none");
						});
						$("#click1").click(function(e) {
							e.preventDefault();
							wrapWindowByMask2();
						});

						//채팅방 이름이 중복되지 않은지 검사 (채팅방 수정시 )
						$("#cname")
								.blur(
										function() {
											$
													.ajax({
														method : 'POST',
														url : 'checkCname',
														data : {
															cname : $("#cname")
																	.val()
														},
														error : function(
																request,
																status, error) {
															alert("code: "
																	+ request.status
																	+ "\n"
																	+ "message: "
																	+ request.responseText
																	+ "\n"
																	+ "error: "
																	+ error);
														},
														success : function(
																result) {
															check3 = result
																	.trim();
														}
													});
										});

						//채팅방 설정 (수정)
						$("#mod").click(function(e) {
							e.preventDefault();
							wrapWindowByMask3();
						});
						//채팅방 내용 수정 버튼을 눌렀을 경우 
						$("#modBtn").click(function(e) {
							e.preventDefault();
							//이름은 필수사항(이름을 입력했는지 검사)
							if ($("#cname").val() == '') {
								alert("채팅명을 입력해주세요");
							} else {
								var oldcname = "${cname}";
								if (check3 == '0') {
									if ($("#cname").val() == oldcname) {
										$("#frm3").submit();
									} else {
										alert("채팅명이 중복됩니다  채팅명을 재입력해주세요!");
										$("#cname").val("");
									}
								} else {
									$("#frm3").submit();
								}
							}
						});
						//채팅방 설정 (나가기)	
						$("#out").click(function(e) {
							e.preventDefault();
							var text = "${member.name}님이 채팅방을 나가셨습니다.";
							webSocket.send("chatout:" + text + ":${cname}");
							$("#frm4").submit();
						})
						//채팅방 설정 (멤버초대하기)

						var userName = "";

						//처음 시작 reg_date 조회(null일 경우 오늘날짜 append null이 아닐경우 오늘날짜랑 db에 있는 날짜 비교 다를경우에만 append)
						//시작
						var myName = "${member.name}";

						var webSocket = new WebSocket(
								"ws://192.168.10.49:8077/erp/simplechat");
						var inputMessage = document
								.getElementById('inputMessage');
						webSocket.onerror = function(event) {
							onError(event)
						};
						webSocket.onopen = function(event) {
							onOpen(event)
						};
						webSocket.onmessage = function(event) {
							onMessage(event)
						};
						function onMessage(event) {
							var message = event.data;
							var result = message.split(":");

							var originCname = "${cname}";
							//alert("originCname : "+originCname);
							//채팅방 리스트 update 해주기
							$.ajax({
								method : 'POST',
								url : 'getCount',
								data : {
									code : "${member.code}",
									cname : "${cname}"
								},
								error : function(request, status, error) {
									alert("code: " + request.status + "\n"
											+ "message: "
											+ request.responseText + "\n"
											+ "error(onMessage): " + error);
								},
								success : function(result) {
									//result = result.trim();
									$("#countList").html(result);
								}
							});
							//채팅방 나가기 알림 
							if (result[0] == 'chatout') {
								/* $.ajax({
									method : 'POST',
									url : 'memberCount',
									data : {
										cname : "${cname}"
									},
									error : function(request, status, error) {
										alert("code: " + request.status + "\n"
											+ "message: " + request.responseText + "\n"
											+ "error: " + error);
									},
									success : function(result) {
										//요기
										var resultCount = Number(result.trim());
										("결과"+(resultCount-1)+"입니다.");
										$("#joinMemberCount").text(resultCount);
									}
								}); */
								//alert("result[2]"+result[2])
								if (originCname == result[2]) {
									var resultHtml = "<br><div id='create'><center><p id='ctext'>"
											+ result[1]
											+ "</p></center></div><br>";
									$("#messageWindow").append(resultHtml);
								}
							}
							//채팅방 추가 초대 알림 
							else if (result[0] == 'moreInvite') {
								/* $.ajax({
									method : 'POST',
									url : 'memberCount',
									data : {
										cname : "${cname}"
									},
									error : function(request, status, error) {
										alert("code: " + request.status + "\n"
											+ "message: " + request.responseText + "\n"
											+ "error: " + error);
									},
									success : function(result) {
										//요기
										var resultCount =Number(result.trim());
										alert("결과"+(resultCount+1)+"입니다.");
										$("#joinMemberCount").text(resultCount);
									}
								}); */
								if (originCname == result[2]) {
									var resultHtml = "<br><div id='create'><center><p id='ctext'>"
											+ result[1]
											+ "</p></center></div><br>";
									$("#messageWindow").append(resultHtml);
								}
							}
							//이미지 파일 chat
							else if (result[0] == 'imgFile') {
								if (originCname == result[4]) {
									if (userName == result[1]) {
										var resultHtml = "<div class='chatImg2'><center><img src='/erp/resources/upload/"+result[2]+"'></center><div class='chatText'>"
												+ result[3]
												+ "<img src='/erp/images/download2.png' class='download'/></div></div>";
										$("#messageWindow").append(resultHtml);
									} else {
										resultHtml = "<img class='profileImg2' src='/erp/resources/upload/"+result[5]+"'/>&nbsp;&nbsp;<span>"
												+ result[1]
												+ " : </span><br><div class='chatImg2'><center><img src='/erp/resources/upload/"+result[2]+"'></center><div class='chatText'>"
												+ result[3]
												+ "<img src='/erp/images/download2.png' class='download'/></div></div>";
										$("#messageWindow").append(resultHtml);
									}
									downloadPath = result[2];
								}
							}
							//문서 파일 chat 
							else if (result[0] == 'docFile') {
								if (originCname == result[4]) {
									if (userName == result[1]) {
										resultHtml = "<div class='chatFile2'><img src='/erp/images/download2.png' class='download2'/><br>"
												+ "<img src='/erp/images/doc.jpg'/>"
												+ result[3] + "</div>";
										$("#messageWindow").append(resultHtml);
									} else {
										resultHtml = "<img class='profileImg2' src='/erp/resources/upload/"+result[5]+"'/>&nbsp;&nbsp;<span>"
												+ result[1]
												+ " : </span><br><div class='chatFile2'><img src='/erp/images/download2.png' class='download2'/><br>"
												+ "<img src='/erp/images/doc.jpg'/>"
												+ result[3] + "</div>";
										$("#messageWindow").append(resultHtml);
									}
									downloadPath = result[2];
								}
								//미니언

							}
							//일반적인 메시지 
							else {
								if (originCname == result[3]) {
									if (userName == result[1]) {
										$("#messageWindow").append(
												"<br><div class='bubble'>"
														+ result[2] + "</div>");
									} else {
										$("#messageWindow")
												.append(
														"<img class='profileImg2' src='/erp/resources/upload/"+result[0]+"'/>&nbsp;&nbsp;<span>"
																+ result[1]
																+ ": </span><br><div class='bubble'>"
																+ result[2]
																+ "</div>");
									}
									userName = result[1];
								}
							}
							/* 자동으로 스크롤 내려가게 
							var chatScrollHeight = document.getElementById('messageWindow');*/
							$('#messageWindow').scrollTop(
									$('#messageWindow').prop('scrollHeight'));
							//$('#messageWindow').prop('scrollHeight')
						}
						function onOpen(event) {
							//파일에서 내용 가져오기 
							var uName = "";
							$(".listText")
									.each(
											function() {
												var text = $(this).val();
												text = text.trim();
												//alert(text); 입니다.");
												//날짜 
												if (text.charAt(0) == '@') {
													//alert("날짜로 들어옴");
													text = text
															.replace('@', '');
													$("#messageWindow")
															.append(
																	"<br><hr style='display:inline-block; border:1px solid #C0C5CB;' width='41%'><span id='date'>"
																			+ text
																			+ "</span><hr style='display:inline-block; border:1px solid #C0C5CB;' width='41%'><br>");
												}
												//초대 
												else if (text.charAt(0) == '#') {
													text = text
															.replace('#', '');
													var resultHtml = "<br><div id='create'><center><p id='ctext'>"
															+ text
															+ "</p></center></div><br>";
													$("#messageWindow").append(
															resultHtml);
												}
												//채팅방 나기기
												else if (text.charAt(0) == '&') {
													//alert("&일떄 들어옴");
													text = text
															.replace('&', '');
													var resultHtml = "<br><div id='create'><center><p id='ctext'>"
															+ text
															+ "</p></center></div><br>";
													$("#messageWindow").append(
															resultHtml);
												}
												//채팅방 추가 초대
												else if (text.charAt(0) == '*') {
													text = text
															.replace('*', '');
													var resultHtml = "<br><div id='create'><center><p id='ctext'>"
															+ text
															+ "</p></center></div><br>";
													$("#messageWindow").append(
															resultHtml);
												}
												//이미지 파일
												else if (text.charAt(0) == 'i') {

													//alert("들어옴");
													text = text
															.replace('i', '');
													var message = text
															.split(":");
													//alert("메시지"+message[1]+"이다.");
													if (message[0] == myName) {
														
														var resultHtml = "<img class='profileImg1' src='/erp/resources/upload/"+message[3]+"'/>&nbsp;&nbsp;<span>"
																+ message[0]
																+ " : </span><br><div class='chatImg'><center><img src='/erp/resources/upload/"+message[1]+"'></center><div class='chatText'>"
																+ message[2]
																+ "<img src='/erp/images/download2.png' class='download'/></div></div>";
														$("#messageWindow")
																.append(
																		resultHtml);
													} else {
														resultHtml = "<img class='profileImg2' src='/erp/resources/upload/"+message[3]+"'/>&nbsp;&nbsp;<span>"
																+ message[0]
																+ " : </span><br><div class='chatImg2'><center><img src='/erp/resources/upload/"+message[1]+"'></center><div class='chatText'>"
																+ message[2]
																+ "<img src='/erp/images/download2.png' class='download'/></div></div>";
														$("#messageWindow")
																.append(
																		resultHtml);
													}
													downloadPath = message[1];
													//uName = message[0];
												}
												//문서 파일 
												else if (text.charAt(0) == 'd') {
													text = text
															.replace('d', '');
													var message = text
															.split(":");
													if (message[0] == myName) {
														var resultHtml = "<img class='profileImg1' src='/erp/resources/upload/"+message[3]+"'/>&nbsp;&nbsp;<span>"
																+ message[0]
																+ " : </span><br><div class='chatFile'><img src='/erp/images/download2.png' class='download'/><br>"
																+ "<img src='/erp/images/doc.jpg'/>"
																+ message[2]
																+ "</div><br>";
														$("#messageWindow")
																.append(
																		resultHtml);

													} else {
														resultHtml =  "<img class='profileImg2' src='/erp/resources/upload/"+message[3]+"'/>&nbsp;&nbsp;<span>"
																+ message[0]
																+ " : </span><br><div class='chatFile2'><img src='/erp/images/download2.png' class='download'/><br>"
																+ "<img src='/erp/images/doc.jpg'/>"
																+ message[2]
																+ "</div><br>";
														$("#messageWindow")
																.append(
																		resultHtml);
													}
													downloadPath = message[1];
													//uName = message[0];
												}
												//일반 대화 내용일 경우 
												else {
													var message = text
															.split(":");
													if (message[1] == myName) {
														if (message[1] != uName) {
															$("#messageWindow")
																	.append(
																			"<img class='profileImg1' src='/erp/resources/upload/"+message[0]+"'/>&nbsp;&nbsp;<span class='my'>"
																					+ message[1]
																					+ " : </span><br><div class='bubble2'>"
																					+ message[2]
																					+ "</div><br>");
														} else {
															$("#messageWindow")
																	.append(
																			"<br><div class='bubble2'>"
																					+ message[2]
																					+ "</div><br>");
														}

													} else {
														if (message[1] != uName) {
															$("#messageWindow")
																	.append(
																			"<img class='profileImg2' src='/erp/resources/upload/"+message[0]+"'/>&nbsp;&nbsp;<span>"
																					+ message[1]
																					+ ": </span><br><div class='bubble'>"
																					+ message[2]
																					+ "</div><br>");
														} else {
															$("#messageWindow")
																	.append(
																			"<br><div class='bubble'>"
																					+ message[2]
																					+ "</div><br>");
														}
													}
													uName = message[1];
												}

											});

							var names = "${names}";
							var csize = "${csize}";
							//날짜 append 해주기, chat db에 reg_Date 업데이트 해주기 
							//채팅 리스트가 존재할때 작업하기 (채팅리스트 없으면 작업 x)
							if (csize != '0') {
								$
										.ajax({
											method : 'POST',
											url : 'updateReg_date',
											data : {
												cname : "${cname}"
											},
											error : function(request, status,
													error) {
												alert("오류났음!!");
												alert("code: "
														+ request.status
														+ "\n"
														+ "message: "
														+ request.responseText
														+ "\n"
														+ "error(update_Reg_Date): "
														+ error);
											},
											success : function(result) {
												var resultNum = result
														.split(":");
												resultNum[0] = resultNum[0]
														.trim();
												if (resultNum[0] != '') {
													$("#messageWindow")
															.append(
																	"<br><hr style='display:inline-block; border:1px solid #C0C5CB;' width='41%'><span id='date'>"
																			+ resultNum[1]
																			+ "</span><hr style='display:inline-block; border:1px solid #C0C5CB;' width='41%'><br>");
												}

												//등록된 날짜 존재 유뮤 검사 
												var checkReg_date = resultNum[2];
												//alert("checkReg_date가 나오는 부분"+checkReg_date+"입니다.");

												//등록된 날짜가 없을경우 00님이 초대하였습니다. 글씨 보이게 하기(파일에 data 넣기)
												if (checkReg_date == 'no') {
													var resultNames = "${member.name}님이  ${resultName} 님을 초대했습니다.";
													var resultHtml = "<br><div id='create'><center><p id='ctext'>"
															+ resultNames
															+ "</p></center></div>";
													$("#messageWindow").append(
															resultHtml);

													//파일에 초대되었습니다. 써주기 
													$
															.ajax({
																method : 'POST',
																url : 'writeInvite',
																data : {
																	cname : "${cname}",
																	names : resultNames
																},
																error : function(
																		request,
																		status,
																		error) {
																	alert("code: "
																			+ request.status
																			+ "\n"
																			+ "message: "
																			+ request.responseText
																			+ "\n"
																			+ "error(WriteInvite): "
																			+ error);
																},
																success : function(
																		result) {
																}
															});
												}
											}
										});

							}
								//스크롤 아래로 유지 
							$('#messageWindow').scrollTop($('#messageWindow').prop('scrollHeight'));
						}
						function onError(event) {
							alert(event.data);
						}
						$("#send")
								.click(
										function() {

											var contents = $('#inputMessage').val().replace(/\r\n/g,'<br>');
											contents = contents.replace(/\n/g,'<br>');
											contents = contents.replace(/\r/g,'<br>');

											$("#inputMessage").val('');
											
											if (contents == "") {
												alert("빈 내용을 보낼 수는 없습니다.");
											} else {
												if (userName == myName) {
													$("#messageWindow")
															.append(
																	"<br><div class='bubble2'>"
																			+ contents
																			+ "</div>");
												} else {
													$("#messageWindow")
															.append(
																	"<img class='profileImg1' src='/erp/resources/upload/${member.pic}'/>&nbsp;&nbsp;<span class='my'>"
																			+ myName
																			+ " : </span><br><div class='bubble2'>"
																			+ contents
																			+ "</div>");
												}

										
												webSocket
														.send("${member.pic}:"
																+ myName
																+ ":"
																+ contents
																+ ":${cname}");

												userName = myName;
												$("#inputMessage").val('');
										
												//채팅방 count 업데이트 해주기 
												$
														.ajax({
															method : 'POST',
															url : 'updateCount',
															data : {
																code : "${member.code}",
																cname : "${cname}"
															},
															error : function(
																	request,
																	status,
																	error) {
																alert("code: "
																		+ request.status
																		+ "\n"
																		+ "message: "
																		+ request.responseText
																		+ "\n"
																		+ "error(send): "
																		+ error);
															},
															success : function(
																	result) {
															}
														});

											}
											$('#messageWindow')
													.scrollTop(
															$(
																	'#messageWindow')
																	.prop(
																			'scrollHeight'));
										
										
										});
						$("#inputMessage")
								.keydown(
										function(key) {

											if (key.keyCode == 13
													&& key.shiftKey) {
												
											}

											if (key.keyCode == 13
													&& !key.shiftKey) {//키가 13이면 실행 (엔터는 13)

												var contents = $('#inputMessage').val().replace(/\r\n/g,'<br>');
												contents = contents.replace(/\n/g,'<br>');
												contents = contents.replace(/\r/g,'<br>');

												$("#inputMessage").val('');
												
												if (contents == "") {
													alert("빈 내용을 보낼 수는 없습니다.");
												} else {
													if (userName == myName) {
														$("#messageWindow")
																.append(
																		"<br><div class='bubble2'>"
																				+ contents
																				+ "</div>");
													} else {
														$("#messageWindow")
																.append(
																		"<img class='profileImg1' src='/erp/resources/upload/${member.pic}'/>&nbsp;&nbsp;<span class='my'>"
																				+ myName
																				+ " : </span><br><div class='bubble2'>"
																				+ contents
																				+ "</div>");
													}

													
													webSocket
															.send("${member.pic}:"
																	+ myName
																	+ ":"
																	+ contents
																	+ ":${cname}");

													userName = myName;
													$("#inputMessage").val('');
											
													//채팅방 count 업데이트 해주기 
													$
															.ajax({
																method : 'POST',
																url : 'updateCount',
																data : {
																	code : "${member.code}",
																	cname : "${cname}"
																},
																error : function(
																		request,
																		status,
																		error) {
																	alert("code: "
																			+ request.status
																			+ "\n"
																			+ "message: "
																			+ request.responseText
																			+ "\n"
																			+ "error(send): "
																			+ error);
																},
																success : function(
																		result) {
																}
															});

												}
												$('#messageWindow').scrollTop($('#messageWindow').prop('scrollHeight'));
												return false;
											}

										});

						//파일 업로드
						$("#file1")
								.bind(
										'change',
										function() {
											//alert("들어옴");
											var file = $("#file1").val();
											var fileName = file.substring(12);

											var type = fileName.split(".");
											var fileType = type[1];
											//alert("파일 타입은?"+fileType);

											//파일 업로드 폼 전송 
											$('#ajaxform')
													.ajaxForm(
															{
																//보내기전 validation check가 필요할경우
																url : "fileUpload",
																enctype : "multipart/form-data",
																/* beforeSubmit: function (data, frm, opt) {
																                alert("전송전!!");
																                return true;
																              }, */
																//submit이후의 처리
																success : function(
																		result) {

																	//alert("전송성공!!");
																	result = result
																			.trim();
																	var file = result
																			.split(":");
																	//alert("결과 파일명은 :"+result+"이다");
																	//이미지 파일일 경우 
																	if (fileType == 'png'
																			|| fileType == 'jpg'
																			|| fileType == 'jpeg'
																			|| fileType == 'gif') {
																		if (userName == myName) {
																			var resultHtml = "<br><div class='chatImg'><center><img src='/erp/resources/upload/"+file[0]+"'></center><div class='chatText'>"
																					+ file[1]
																					+ "<img src='/erp/images/download2.png' class='download'/></div></div>";
																			$(
																					"#messageWindow")
																					.append(
																							resultHtml);
																		} else {//히얼유알
																			resultHtml = "<br><img class='profileImg1' src='/erp/resources/upload/${member.pic}'/>&nbsp;&nbsp;<span class='my'>"
																					+ myName
																					+ " : </span><br><div class='chatImg'><center><img src='/erp/resources/upload/"+file[0]+"'></center><div class='chatText'>"
																					+ file[1]
																					+ "<img src='/erp/images/download2.png' class='download'/></div></div>";
																			$(
																					"#messageWindow")
																					.append(
																							resultHtml);
																		}
																		downloadPath = file[0];

																		webSocket.send("imgFile:"
																						+ myName
																						+ ":"
																						+ file[0]
																						+ ":"
																						+ file[1]
																						+ ":${cname}:${member.pic}");
																	}

																	//문서 파일일 경우 
																	else {
																		if (userName == myName) {
																			resultHtml = "<br><div class='chatFile'><img src='/erp/images/download2.png' class='download'/><br>"
																					+ "<img src='/erp/images/doc.jpg'/>"
																					+ file[1]
																					+ "</div><br>";
																			$(
																					"#messageWindow")
																					.append(
																							resultHtml);
																		} else {
																			resultHtml = "<br><img class='profileImg1' src='/erp/resources/upload/${member.pic}'/>&nbsp;&nbsp;<span class='my'>"
																					+ myName
																					+ " : </span><br><div class='chatFile'><img src='/erp/images/download2.png' class='download'/><br>"
																					+ "<img src='/erp/images/doc.jpg'/>"
																					+ file[1]
																					+ "</div><br>";
																			$(
																					"#messageWindow")
																					.append(
																							resultHtml);
																		}
																		downloadPath = file[0];

																		webSocket
																				.send("docFile:"
																						+ myName
																						+ ":"
																						+ file[0]
																						+ ":"
																						+ file[1]
																						+ ":${cname}:${member.pic}");
																	}
																	userName = myName;
																},
																//ajax error
																error : function(
																		request,
																		status,
																		error) {
																	alert("code: "
																			+ request.status
																			+ "\n"
																			+ "message: "
																			+ request.responseText
																			+ "\n"
																			+ "error: "
																			+ error);
																}
															});
											$("#ajaxform").submit();
										});
						$(document).on("click", ".download", function() {
							// alert("클릭됨");
							var url = "down?fileName=" + downloadPath;
							$(location).attr('href', url);
						});
						$(document).on("click", ".download2", function() {
							//alert("클릭됨");
							var url = "down?fileName=" + downloadPath;
							$(location).attr('href', url);
						});

					});
</script>
</head>
<body>
	<!-- header -->
	<div id="header"></div>
	<!-- header -->
	<!-- 왼쪽 메뉴 -->
	<div id="menu">
		<div id="profile">
			<br> &nbsp;&nbsp;<img id="profileImg"
				src="/erp/resources/upload/${member.pic}">&nbsp;&nbsp;${member.name}<br>
			<br>
		</div>
		<br> &nbsp;&nbsp;채팅 <img src="/erp/images/add.png" id="plus" /> <br>
		<hr style="border: solid 1px #DCDCDC;">
		<table id="submenu">
			<tr class="sub">
				<td><a href="#" id="chatroom">채팅방 만들기</a></td>
			</tr>
			<!-- <tr class="sub">
				<td><a href="#" id="makeGroup">그룹 만들기</a></td>
			</tr> -->
		</table>
		
		<br>
		<!-- 채팅방 리스트 -->
		<div id="chatList">
			<div class="left" id="cnameList">
				<c:forEach items="${cList}" var="cList">
					<!-- 임시로 링크 -->
					<a href="chat?cname=${cList}" class="cList underline"><b>${cList}</b></a>
					<br>
					<br>
				</c:forEach>
			</div>
			<div class="left" id="countList">
				<c:forEach items="${counts}" var="count">
					<c:if test="${count =='0' }">
						<div class="circle2"></div>
					</c:if>
					<c:if test="${count != '0' }">
						<div class="circle1">
							<center>${count}</center>
						</div>
					</c:if>
				</c:forEach>
			</div>
		</div>
	</div>
	<!-- 왼쪽 메뉴 끝 -->

	<!-- 오른쪽 내용 -->
	<div id="contents">
		<div id="setting">
			<c:if test="${csize !='0'}">
				<div class="ctitle">
					<p>
						<b>${cname}</b>
					</p>
				</div>
				<div class="icons">
					<ul>
						<li class="im1"><div class="im">
								<img src="/erp/images/men.png" id="userList" />&nbsp;<span
									id="joinMemberCount">${joinMemberCount}</span>&nbsp;▽
							</div>
						</li>
						<li class="im2"><div class="im">
								<img src="/erp/images/add-user.png" id="moreInvite" />
							</div>
						</li>
						<li class="im3"><div class="im">
								<img src="/erp/images/more1.png" id="moreSetting" />
							</div>
						</li>
					</ul>
				</div>
			</c:if>
		</div>
		<div class="bubble3">
			<center>더보기</center>
		</div>
		<div class="bubble4">
			<center>멤버 초대하기</center>
		</div>
		<div class="bubble5">
			<center>참여 멤버</center>
		</div>
		<table id="submenu2">
			<tr class="sub2">
				<td><a href="#" id="mod">&nbsp;<img
						src="/erp/images/edit.png" />&nbsp;정보 변경하기
				</a></td>
			</tr>
			<tr class="sub2">
				<td><a href="#" id="out">&nbsp;<img
						src="/erp/images/logout.png" />&nbsp;채팅 나가기
				</a></td>
			</tr>
		</table>
		<div id="submenu3">
			<table id="subTable">
				<tr style="height: 30px;">
					<td class="g" colspan="2"><b>팀 멤버</b></td>
				</tr>
				<c:set var="count" value="0"></c:set>
				<c:forEach items="${joinMember}" var="list">
					<tr class="sub3">
						<td>&nbsp;&nbsp;<img id="user" src="/erp/resources/upload/${list.pic}"></td>
						<td>&nbsp;&nbsp;${list.name}</td>
					</tr>
				</c:forEach>
			</table>
		</div>
		<form action="chatout" id="frm4" method="post">
			<input type="hidden" value="${member.code}" name="code" /> <input
				type="hidden" value="${cname}" name="cname" />
		</form>
		<!-- 참여하고 있는 회원들의 code 출력 -->
		<c:forEach items="${joinMemberCode}" var="codes">
			<input type="hidden" value="${codes}" class="joinMemberCode" />
		</c:forEach>
		<!-- <input type="hidden" id="joinCheck" name="joinCheck" value="no"/> -->
		<c:if test="${csize =='0'}">
			<div id="make">
				<center>
					<img src="/erp/images/boy.png" /><br>
					<br> <a href="#" id="click1" class="underline"><b>생성된
							채팅방이 없습니다.</b><br> 여기를 클릭하시고 채팅방을 생성해보세요.</a><br>
					<br>
					<br>
					<button id="makeBtn">채팅방 만들기</button>
				</center>
			</div>
		</c:if>

		<c:if test="${csize !='0'}">
		<div id="messageWindow">
			<c:forEach items="${list}" var="list">
				<input type="hidden" class="listText" value="${list}" />
			</c:forEach>
		</div>
		
		<div id="sendWindow">
			<form id="ajaxform" action="fileUpload" method="post"
				enctype="multipart/form-data">
				<input type="file" name="file1" id="file1" style="display: none;">
				<input type="hidden" name="cname" value="${cname}" />
			</form>
			<input type="hidden" name="file2" id="file2"> <img
				src="/erp/images/clip.png" id="clip" border='0'
				onclick='document.all.file1.click(); document.all.file2.value=document.all.file1.value'>
			<textarea rows="" cols="" id="inputMessage" placeholder="메시지를 입력하세요 (Enter를 원하시면 shift+Enter누르세요)"
				wrap="off"></textarea>
			<!-- <input id="inputMessage" type="text" placeholder="메시지를 입력하세요" />  -->
			<!-- <input type="submit" value="send" id="send" /> -->
		</div>
		</c:if>
	</div>
	<!-- 오른쪽 내용 -->


	<!-- modal 2가지-->
	<div id="mask"></div>

	<!-- 채팅방 만들기  modal-->
	<div class="chatroom">
		<div id="title">
			새&nbsp;채팅방&nbsp;생성<img src="/erp/images/cancel2.png" class="close11">
		</div>
		<div id="content">
			<br>
			<form action="createchat" method="post" id="frm2">
				<table id="table3">
					<tr>
						<td>그룹명</td>
						<td><select id="group" name="group">
								<option value="no">그룹 없음</option>
						</select></td>
					</tr>
					<tr>
						<td>이름</td>
						<td><input type="text" placeholder="채팅방 이름을 입력하세요"
							name="name" id="name" /></td>
					</tr>
					<tr>
						<td>설명</td>
						<td><textarea placeholder="채팅방에 대해 설명해주세요(옵션)" name="detail"
								id="explain"></textarea></td>
					</tr>
				</table>
				<br> <input type="hidden" id="joinCheck" name="joinCheck"
					value="no" />
				<button class="close22">닫기</button>
				<button id="create2">다음으로</button>
				<br>
				<br>
			</form>
		</div>
	</div>
	<!-- 채팅방 만들기  modal 끝-->

	<!-- 채팅방 초대하기  modal -->
	<div class="window">
		<div id="title">
			멤버&nbsp;초대하기 <img src="/erp/images/cancel2.png" id="close">
		</div>
		<div id="content">
			<br>
			<div id="nameList">
				<!-- 초대할 회원 리스트  -->
			</div>
			<br>
			<!-- memberList -->
			<form id="frm1" action="chat" method="post">
				<table id="table1">
					<tr>
						<td class="td1"><input type="text" id="str" name="str"
							style="background-image: url('/erp/images/search.png'); background-repeat: no-repeat; background-position: left;"
							placeholder="검색어를 입력하세요"></td>
						<td class="td2"><select id="type" name="type">
								<option value="name" class="typetext">이름</option>
								<option value="department" class="typetext">부서</option>
								<option value="position" class="typetext">직책</option>
								<option value="id" class="typetext">이메일</option>
								<option value="phone" class="typetext">전화번호</option>
						</select></td>
					</tr>
				</table>
			</form>
			<br>
			<div
				style="width: 80%; height: 235px; margin: 0 auto; overflow-y: scroll">
				<table id="table2" width="100%" border="0" cellspacing="0"
					cellpadding="0">
					<c:if test="${memberList.size()== 0}">
						<p>초대할 멤버가 없습니다. 멤버를 다시 한번 검색해주세요</p>
					</c:if>
					<c:forEach items="${memberList}" var="member">
						<tr class="trList">
							<td class="mList"><img class="left" id="user"
								src="/erp/resources/upload/${member.pic}"> <span class="right name">${member.name}</span>
								<p class="mail name2"></p>
								<p class="mail department2">${member.department}</p>
								<p class="mail position2">${member.position}</p>
								<p class="mail id2">${member.id}</p>
								<p class="mail phone2">${member.phone}</p> <input type="hidden"
								class="code" name="code" value="${member.code}" /></td>
						</tr>
					</c:forEach>
				</table>
			</div>
			<br> <input type="checkbox" id="all" /> 모든 멤버 선택하기 <br> <br>

			<button id="invite">초대하기</button>
			<br>
			<br>
		</div>
	</div>
	<!-- 채팅방 초대하기  modal 끝-->

	<!-- 채팅방 정보 수정하기 modal -->
	<div class="modchatroom">
		<div id="title">
			채팅방&nbsp;수정<img src="/erp/images/cancel2.png" class="close11">
		</div>
		<div id="content">
			<br>
			<form action="updateInfo" method="post" id="frm3">
				<table id="table3">
					<tr>
						<td>그룹명</td>
						<td><select id="group" name="group">
								<option value="no">그룹 없음</option>
						</select></td>
					</tr>
					<tr>
						<td>이름</td>
						<td><input type="text" placeholder="채팅방 이름을 입력하세요"
							name="cname" id="cname" value="${cdto.cname}" /></td>
					</tr>
					<tr>
						<td>설명</td>
						<td><textarea placeholder="채팅방에 대해 설명해주세요(옵션)" name="cdetail"
								id="cdetail">${cdto.cdetail}</textarea></td>
					</tr>
				</table>
				<br> <input type="hidden" name="oldcname" value="${cname}" />
				<button class="close22">닫기</button>
				<button id="modBtn">수정하기</button>
				<br>
				<br>
			</form>
		</div>
	</div>
	<!-- 채팅방 정보 수정하기 modal 끝 -->

	<!-- modal 끝 -->
</body>
</html>