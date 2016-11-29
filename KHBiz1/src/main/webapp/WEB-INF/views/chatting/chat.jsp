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
a{
	text-decoration: none;
	color:black;
}
body {
	margin: 0;
	padding: 0;
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
.chatroom{
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
#close11{
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
.close22{
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
	cursor:pointer;
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
#menu{
	float:left;
	width:15%;
	height:683px;
	background:rgb(255,255,255);
	border: 1px solid rgb(215,215,215);
}
#contents{
	float:left;
	width:84.6%;
	height:683px;
	background: rgb(242,247,253);
}
#create{
	background: rgb(0, 178, 232);
	color: white;
	font-weight: bold;
	font-size: 12pt;
	width: 15%;
	height: 38px;
	border: 1px solid #D8D8D8;
	border-radius: 0.25em;
	cursor:pointer;
}
#name{
	border:1px solid #b0b3b5;
	border-radius: 0.25em;
	width:95%;
	height:30px;
}
#group{
	border:1px solid #b0b3b5;
	border-radius: 0.25em;
	width:50%;
	height:30px;
}
#explain{
	border:1px solid #b0b3b5;
	border-radius: 0.25em;
	width:95%;
	height:100px;
}
#table3{
	width:90%;
	height:200px;
	margin: 0 auto;
}
#plus{
	margin-left:65%;
	cursor:pointer;
}
#submenu{
	background:rgb(255,255,255);
	border: 1px solid rgb(215,215,215);
	position: absolute;
	top:129px;
	left:227px;
	width:160px;
}
.sub{
	cursor:pointer;
	height:40px;
}
#more{
	cursor:pointer;
	margin-left:55%;
}
#make{
	width:60%;
	margin:0 auto;
	margin-top:13%;
}
#folder{cursor:pointer;}

#makeBtn{
	background: rgb(0, 178, 232);
	color: white;
	font-weight: bold;
	font-size: 12pt;
	width: 17%;
	height: 38px;
	border: 1px solid #D8D8D8;
	border-radius: 0.25em;
	cursor:pointer;
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

	$(document).ready(function() {
		
		$("#submenu").hide();
		
		//검색어 focus 주기 
		$("#str").focus();
		
		//선택한 type set해주기
		var searchType ="${type}";
		$(".typetext").each(function(){
			if($(this).val()==searchType){
				  $(this).attr("selected", true);
			}
		});
		//입력한 검색어 set해주기 
		var str = "${str}";
		$("#str").val(str);
		
		//세팅해주기
		if(searchType=='name' || searchType==''){
			$(".name2").css("display","block");
			$(".department2").css("display","none");
			$(".position2").css("display","none");
			$(".id2").css("display","none");
			$(".phone2").css("display","none");
		}else if(searchType=='department'){
			$(".name2").css("display","none");
			$(".department2").css("display","block");
			$(".position2").css("display","none");
			$(".id2").css("display","none");
			$(".phone2").css("display","none");	
		}else if(searchType=='position'){
			$(".name2").css("display","none");
			$(".department2").css("display","none");
			$(".position2").css("display","block");
			$(".id2").css("display","none");
			$(".phone2").css("display","none");
		}else if(searchType=='id'){
			$(".name2").css("display","none");
			$(".department2").css("display","none");
			$(".position2").css("display","none");
			$(".id2").css("display","block");
			$(".phone2").css("display","none");
		}else{
			$(".name2").css("display","none");
			$(".department2").css("display","none");
			$(".position2").css("display","none");
			$(".id2").css("display","none");
			$(".phone2").css("display","block");
		}
		//채팅방 생성하기 
		//검은 막 띄우기
		$('#chatroom').click(function(e) {
			e.preventDefault();
			wrapWindowByMask2();
		});
		//검은 막을 눌렀을 때
		$('#mask').click(function() {
			$(this).hide();
			$('.chatroom').hide();
		});
		//닫기 버튼을 눌렀을 경우 
		$("#close11").click(function() {
			$(location).attr('href',"chat");
		});
		//닫기버튼2를 눌렀을 경우
		$(".close22").click(function(e) {
			e.preventDefault();
			$(location).attr('href',"chat");
		});
		//닫기 버튼 hover 이벤트 
		$(".close22").hover(function(){
			$(this).css("background-color","rgb(241, 244, 249)");
			$(this).css("color","#7E7E7E");
		},function(){
			$(this).css("background-color","white");
			$(this).css("color","#B4B4B4");
		});
		//다음단계로 버튼을 눌렀을 경우
		$("#create").click(function(e){
			e.preventDefault();
			//이름은 필수사항(이름을 입력했는지 검사)
			if($("#name").val()==''){
				alert("채팅명을 입력해주세요");
			}else{
				$('.chatroom').hide();
				wrapWindowByMask();	
			}
		});
		
		//검은 막을 눌렀을 때
		$('#mask').click(function() {
			$(this).hide();
			$('.window').hide();
		});
		//닫기 버튼을 눌렀을 경우 
		$("#close").click(function() {
			$(location).attr('href',"chat");
		});
		//이전 버튼을 눌렀을 경우
		$(".close2").click(function(e) {
			//$(location).attr('href',"chat");
			e.preventDefault();
			$('.window').hide();
			wrapWindowByMask2();
		});
		//닫기 버튼 hover 이벤트 
		$(".close2").hover(function(){
			$(this).css("background-color","rgb(241, 244, 249)");
			$(this).css("color","#7E7E7E");
		},function(){
			$(this).css("background-color","white");
			$(this).css("color","#B4B4B4");
		});

		//hover 이벤트 
		$(".mList").hover(function(){
			$(this).css("background-color","#F1FBFF");
		},function(){
			$(this).css("background-color","white");
		}); 
		
		//검색 type 선택 변화있을 경우
		$("#type").on("change",function(){
			var type=$(this).val();
			if(type=='name'){
				$(".name2").css("display","block");
				$(".department2").css("display","none");
				$(".position2").css("display","none");
				$(".id2").css("display","none");
				$(".phone2").css("display","none");
			}else if(type=='department'){
				$(".name2").css("display","none");
				$(".department2").css("display","block");
				$(".position2").css("display","none");
				$(".id2").css("display","none");
				$(".phone2").css("display","none");	
			}else if(type=='position'){
				$(".name2").css("display","none");
				$(".department2").css("display","none");
				$(".position2").css("display","block");
				$(".id2").css("display","none");
				$(".phone2").css("display","none");
			}else if(type=='id'){
				$(".name2").css("display","none");
				$(".department2").css("display","none");
				$(".position2").css("display","none");
				$(".id2").css("display","block");
				$(".phone2").css("display","none");
			}else{
				$(".name2").css("display","none");
				$(".department2").css("display","none");
				$(".position2").css("display","none");
				$(".id2").css("display","none");
				$(".phone2").css("display","block");
			}
		});
		
		//검색어 입력 keyup 이벤트
		$("#str").on("keyup",function(){ 
			jQuery.ajaxSettings.traditional = true;
			
			var codes = [];
			$(".codes").each(function(){
				codes.push($(this).val());
			});
			
			var str = $("#str").val();
			var type=$("#type").val();
			
			var allData = {"type":type,"str":str,"codes":codes};
			$.ajax({
				method : 'POST',
				url : 'memberList',
				data : allData,
				error : function(request, status, error) {
					alert("code: " + request.status + "\n"
							+ "message: " + request.responseText + "\n"
							+ "error: " + error);
				},
				success : function(result) {
					$("#table2").html(result);
				}
			});
		});
		
		//회원리스트 중 하나를 선택했을 경우 
		$("#table2").on("click", ".mList", function(){
			var index = $(".mList").index(this);
			var name = $(".name:eq(" + index + ")").text();
			var code = $(".code:eq(" + index + ")").val();
			
			var size = -1;
			$(".trList").each(function(){
				size++;
			});
			//마지막 자식일 경우 check 해주기 (모두 선택에)
			if(index == size){
				$("#all").attr("checked",true);
			}

			//버튼 append하기 전에 list에서 지워주기 
			$(".trList:eq("+index+")").remove();
			$("#nameList").append("<button class='nameBtn nameList'>"+name+"&nbsp;&nbsp;<img id='cancelimg' src='/erp/images/cancel1.png'/></button><input type='hidden' class='codes' name='codes' value='"+code+"'/>");	
		});
		
		//선택한 이름을 눌렀을 경우 
		$("#nameList").on("click",".nameBtn",function(){
			var index = $(".nameBtn").index(this);
			$(".nameBtn:eq("+index+")").remove();
			$(".codes:eq("+index+")").remove();
			
			jQuery.ajaxSettings.traditional = true;
			
			var codes = [];
			$(".codes").each(function(){
				codes.push($(this).val());
			});
			
			var str = $("#str").val();
			var type=$("#type").val();
			
			var allData = {"type":type,"str":str,"codes":codes};
			$.ajax({
				method : 'POST',
				url : 'memberList',
				data : allData,
				error : function(request, status, error) {
					alert("code: " + request.status + "\n"
							+ "message: " + request.responseText + "\n"
							+ "error: " + error);
				},
				success : function(result) {
					$("#table2").html(result);
				}
			});
		});
		
		//체크박스를 선택,해제시 
		$("#all").change(function(){
		        if($("#all").is(":checked")){
		        	
		        	$(".code").each(function(){
		        		var i = $(".code").index(this);
		        		var code = $(this).val();
		        		var name = $(".name:eq(" + i+ ")").text();
		        		$(".trList:eq("+i+")").remove();
		        		$("#nameList").append("<button class='nameBtn nameList'>"+name+"&nbsp;&nbsp;<img id='cancelimg' src='/erp/images/cancel1.png'/></button><input type='hidden' class='codes' name='codes' value='"+code+"'/>");
		        	});
		        }else{
		            $(".nameBtn").each(function(){
		            	var i = $(".nameBtn").index(this);
		            	$(this).remove();
		    			$(".codes:eq("+i+")").remove();
		            });
		            jQuery.ajaxSettings.traditional = true;
					
					var codes = [];
					$(".codes").each(function(){
						codes.push($(this).val());
					});
					
					var str = $("#str").val();
					var type=$("#type").val();
					
					var allData = {"type":type,"str":str,"codes":codes};
					$.ajax({
						method : 'POST',
						url : 'memberList',
						data : allData,
						error : function(request, status, error) {
							alert("code: " + request.status + "\n"
									+ "message: " + request.responseText + "\n"
									+ "error: " + error);
						},
						success : function(result) {
							$("#table2").html(result);
						}
					});
		        }
		 });
		$("#invite").click(function(){
			var codes = [];
			$(".codes").each(function(){
				alert("초대할 코드는? "+$(this).val());
				codes.push($(this).val());
			});
			if(codes.length == 0){
				alert("초대할 멤버를 선택해주세요");
			}else{
				//$(location).attr('href',"chatroom");
				for(var i=0; i<codes.length; i++){
					$("#frm2").append("<input type='hidden' name='codes' value='"+codes[i]+"'/>");	
				}
				$("#frm2").submit();
			}
		});
		
		//채팅 + 버튼을 클릭했을 경우
		$("#plus").click(function(){
			$("#submenu").toggle();
		});
		//submenu hover 이벤트 
		$(".sub").hover(function(){
			$(this).css("background-color","#F1FBFF");
		},function(){
			$(this).css("background-color","white");
		}); 
		
		$("#folder").click(function(){
			if($(this).attr('src')=='/erp/images/folder3.png'){
				$(this).attr('src','/erp/images/folder4.png');
			}else{
				$(this).attr('src','/erp/images/folder3.png');
			}
		});
		//오른쪽 채팅방 만들기 -바로가기
		$('#makeBtn').click(function(e) {
			e.preventDefault();
			wrapWindowByMask2();
		});
		//여기를 클릭해서 채팅방 생성 
		$("#click1").hover(function(){
			$(this).css("text-decoration","underline");
		},function(){
			$(this).css("text-decoration","none");
		}); 
		$("#click1").click(function(e){
			e.preventDefault();
			wrapWindowByMask2();
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
		<br>
		&nbsp;&nbsp;<img src="/erp/images/user2.png">&nbsp;&nbsp;<%=session.getAttribute("name")%><br>
		<br><hr>
		&nbsp;&nbsp;채팅 <img src="/erp/images/add.png" id="plus"/>
		<hr>
		<table id="submenu">
			<tr class="sub">
				<td><a href="#" id="chatroom">채팅방 만들기</a></td>
			</tr>
			<tr class="sub">
				<td><a href="#" id="makeGroup">그룹 만들기</a></td>
			</tr>
		</table>
		&nbsp;&nbsp;<img src="/erp/images/folder3.png" id="folder"/>&nbsp;&nbsp;그룹<img src="/erp/images/more.png" id="more"/>
	</div>
	<!-- 왼쪽 메뉴 끝 -->	
	
	<!-- 오른쪽 내용 -->
	<div id="contents">
	<br>
	<div id="make">
	<center><img src="/erp/images/boy.png"/><br><br>
	<a href="#" id="click1"><b>생성된 채팅방이 없습니다.</b><br>
	여기를 클릭하시고 채팅방을 생성해보세요.</a><br><br><br>
	<button id="makeBtn">채팅방 만들기</button>
	</center>
	</div>
	</div>
	<!-- 오른쪽 내용 -->
	
	<!-- model 2-->
	<div id="mask"></div>
	
	<!-- 채팅방 만들기  model-->
	<div class ="chatroom">
		<div id="title">
			새&nbsp;채팅방&nbsp;생성<img src="/erp/images/cancel2.png" id="close11">
		</div>
		<div id="content">
			<br>
			<form action="createchat" method="post" id="frm2">
				<table id="table3">
					<tr>
						<td>그룹명</td>
						<td>
							<select id="group" name="group">
								<option value="no">그룹 없음</option>
							</select>
						</td>
					</tr>
					<tr>
						<td>이름</td>
						<td><input type="text" placeholder="채팅방 이름을 입력하세요" name="name" id="name"/></td>
					</tr>
					<tr>
						<td>설명</td>
						<td>
							<textarea placeholder="채팅방에 대해 설명해주세요(옵션)" name="detail" id="explain"></textarea>
						</td>
					</tr>
				</table>
				<br>
				<button class="close22">닫기</button>
				<button id="create">다음으로</button><br><br>
			</form>
		</div>
	</div>
	
	<!-- 채팅방 초대하기  model -->
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
			<div style="width: 80%; height: 235px; margin: 0 auto; overflow-y: scroll">
				<table id="table2" width="100%" border="0" cellspacing="0"
					cellpadding="0">
					<c:if test="${memberList.size()== 0}">
						<p>초대할 멤버가 없습니다. 멤버를 다시 한번 검색해주세요</p>
					</c:if>
					<c:forEach items="${memberList}" var="member">
						<tr class="trList">
							<td class="mList"><img class="left" id="user"
								src="/erp/images/user2.png"> <span class="right name">${member.name}</span>
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
			<button class="close2">이전</button>
			<button id="invite">초대하기</button>
			<br><br>
		</div>
	</div>
	<!-- model 끝 -->
</body>
</html>