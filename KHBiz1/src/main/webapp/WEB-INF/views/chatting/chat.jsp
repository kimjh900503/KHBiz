<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
#mask {
	position: absolute;
	z-index: 9000;
	background: rgba(120, 124, 127, 2);
	display: none;
	left: 0;
	top: 0;
}

.window {
	width: 40%;
	height: 450px;
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
	cursor:pointer;
}

.name {
	display: inline-block;
	height: 25px;
	line-height: 25px;
	margin-top: 10px;
	font-weight: bold;
	margin-left:10px;
}

#user {
	display: inline-block; margin-left : 10px;
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
	margin-left:50px;
	color:#7E7E7E;
}
#all{
	margin-left:11%;
}
#close2{
	margin-left:60%;
	cursor:pointer;
	background-color:white;
	font-weight:bold;
	font-size: 12pt;
	color:#B4B4B4;
	width:10%;
	height:38px;
	border:1px solid #D8D8D8;
	border-radius:0.25em;
}
#invite{
	background : rgb(215,219,220);
	color:white;
	font-weight:bold;
	font-size:12pt;
	width:15%;
	height:38px;
	border:1px solid #D8D8D8;
	border-radius:0.25em;
}
</style>
<script src="https://code.jquery.com/jquery-latest.js"></script>
<script>
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

	$(document).ready(function() {
		//시작
		//검은 막 띄우기
		$('#ask').click(function(e) {
			e.preventDefault();
			wrapWindowByMask();
		});

		//닫기 버튼을 눌렀을 때
		$('.window .close').click(function(e) {
			//링크 기본동작은 작동하지 않도록 한다.
			e.preventDefault();
			$('#mask, .window').hide();
		});

		//검은 막을 눌렀을 때
		$('#mask').click(function() {
			$(this).hide();
			$('.window').hide();
		});
		//닫기 버튼을 눌렀을 경우 
		$("#close").click(function() {
			$("#mask").hide();
			$(".window").hide();
		});
		$("#close2").hover(function(){
			$(this).css("background-color"," rgb(241, 244, 249)");
			$(this).css("color","#7E7E7E");
		},function(){
			$(this).css("background-color","white");
			$(this).css("color","#B4B4B4");
		});
		//닫기버튼2를 눌렀을 경우
		$("#close2").click(function() {
			$("#mask").hide();
			$(".window").hide();
		});
		$("#table2 td").hover(function(){
			$(this).css("background-color","#F1FBFF");
		},function(){
			$(this).css("background-color","white");
		});
	});
</script>
</head>
<body>
	<a href="#" id="ask">새 채팅방 만들기</a>
	<div id="mask"></div>
	<div class="window">
		<div id="title">
			멤버&nbsp;초대하기 <img src="/erp/images/cancel2.png" id="close">
		</div>
		<div id="content">
			<br> <br>
			<table id="table1">
				<tr>
					<td class="td1"><input type="text" id="str" name="str"
						style="background-image: url('/erp/images/search.png'); background-repeat: no-repeat; background-position: left;"
						placeholder="검색어를 입력하세요"></td>
					<td class="td2"><select id="type">
							<option>이름</option>
							<option>부서</option>
							<option>직책</option>
							<option>이메일</option>
							<option>전화번호</option>
					</select></td>
				</tr>
			</table>
			<br>
			<div
				style="width: 80%; height: 235px; margin: 0 auto; overflow-y: scroll">
				<table id="table2" width="100%" border="0" cellspacing="0"
					cellpadding="0">
					<tr>
						<td><img class="left" id="user" src="/erp/images/user2.png"><span
							class="right name">이수빈</span>
							<p class="mail">mrkl9442@naver.com</p>
						</td>
					</tr>
					<tr>
						<td><img class="left" id="user" src="/erp/images/user2.png"><span
							class="right name">이수빈</span>
							<p class="mail">mrkl9442@naver.com</p>
						</td>
					</tr>
					<tr>
						<td><img class="left" id="user" src="/erp/images/user2.png"><span
							class="right name">이수빈</span>
							<p class="mail">mrkl9442@naver.com</p>
						</td>
					</tr>
					<tr>
						<td><img class="left" id="user" src="/erp/images/user2.png"><span
							class="right name">이수빈</span>
							<p class="mail">mrkl9442@naver.com</p>
						</td>
					</tr>
					<tr>
						<td><img class="left" id="user" src="/erp/images/user2.png"><span
							class="right name">이수빈</span>
							<p class="mail">mrkl9442@naver.com</p>
						</td>
					</tr>
					<tr>
						<td><img class="left" id="user" src="/erp/images/user2.png"><span
							class="right name">이수빈</span>
							<p class="mail">mrkl9442@naver.com</p>
						</td>
					</tr>
					<tr>
						<td><img class="left" id="user" src="/erp/images/user2.png"><span
							class="right name">이수빈</span>
							<p class="mail">mrkl9442@naver.com</p>
						</td>
					</tr>
					<tr>
						<td><img class="left" id="user" src="/erp/images/user2.png"><span
							class="right name">이수빈</span>
							<p class="mail">mrkl9442@naver.com</p>
						</td>
					</tr>
					<tr>
						<td><img class="left" id="user" src="/erp/images/user2.png"><span
							class="right name">이수빈</span>
							<p class="mail">mrkl9442@naver.com</p>
						</td>
					</tr>

				</table>
			</div>
			<br> <input type="checkbox" id="all" /> 모든 멤버 선택하기 <br>
			<br>
			<button id="close2">닫기</button>
			<button id="invite" disabled='disabled'>초대하기</button>
		</div>

	</div>
</body>
</html>