<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Testing</title>
<style type="text/css">
body {
	margin: 0;
	padding: 0;
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
	height: 50px;
	padding: 0px;
	background: #FFFFFF;
	-webkit-border-radius: 6px;
	-moz-border-radius: 6px;
	border-radius: 6px;
	position: relative;
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
	margin-left: 58%;
	position: relative;
	width: 500px;
	height: 50px;
	padding: 0px;
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
	margin-left: 60%;
}

#header {
	width: 100%;
	height: 50px;
	background: rgb(18, 69, 112);
}

#menu {
	float: left;
	width: 15%;
	height: 683px;
	background: rgb(255, 255, 255);
	border: 1px solid rgb(215, 215, 215);
}

#contents {
	float: left;
	width: 84.6%;
	height: 683px;
	background: rgb(242, 247, 253);
}

#date {
	color: rgb(142, 159, 169);
	font-weight: bold;
}

hr {
	display: inline-block;
}

#create {
	width: 100%;
	background: rgb(225, 235, 244);
	height: 50px;
	display:hidden;
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
	z-index: 999;
	top: 630px;
	left: 230px;
}

.time {
	font-size: 9pt;
	color: #878787;
}

#messageWindow {
	width: 100%;
	height: 84.6%;
	overflow-y: scroll;
	overflow-x: hidden;
	background: rgb(242, 247, 253);
}
.yellow{
	color:yellow;
	margin-left:55%;
	font-weight:bold;
	display:inline-block;
	margin-top:10px;
}
</style>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script type="text/javascript">
	$(function() {
		var userName = "";

		//처음 시작 reg_date 조회(null일 경우 오늘날짜 append null이 아닐경우 오늘날짜랑 db에 있는 날짜 비교 다를경우에만 append)
		//시작
		var myName = "${member.name}";
		var webSocket = new WebSocket('ws://localhost:8089/erp/broadcasting');
		var inputMessage = document.getElementById('inputMessage');
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
			if (userName == result[0]) {
				$("#messageWindow").append(
						"<br><div class='bubble'>" + result[1] + "</div>");
			} else {
				$("#messageWindow").append(
						"<span>" + result[0]
								+ ": </span><br><div class='bubble'>"
								+ result[1] + "</div>");
			}
			userName = result[0];
			/* 자동으로 스크롤 내려가게 
			var chatScrollHeight = document.getElementById('messageWindow');
			$('#messageWindow').scrollTop(chatScrollHeight.scrollHeight); */
		}
		function onOpen(event) {
			//파일에서 내용 가져오기 
			$(".listText").each(function(){
				var text = $(this).val();
				text = text.trim();
				//alert(text);
				//alert(text.charAt(0));
				//날짜 
				if(text.charAt(0)=='@'){
					//alert("날짜로 들어옴");
					text = text.replace('@','');
					$("#messageWindow").append(
							"<br><hr width='42.3%'><span id='date'>"
									+ text
									+ "</span><hr width='42.3%'><br>");
				}
				//초대 
				else if(text.charAt(0)=='#'){
					text = text.replace('#','');
					var resultHtml = "<br><div id='create'><center><p id='ctext'>"
					+text
					+"</p></center></div><br>";
					$("#messageWindow").append(resultHtml); 
				}
				//대화 내용 
				else{
					var message = text.split(":");
					if(message[0] == myName){
						$("#messageWindow")
						.append(
								"<span class='my'>"
										+ message[0]
										+ " : </span><br><div class='bubble2'>"
										+ message[1]
										+ "</div>");
					}else{
						$("#messageWindow").append(
								"<span>" + message[0]
										+ ": </span><br><div class='bubble'>"
										+ message[1] + "</div>");
					}
					
				}
			});
			
			
			//등록된 날짜가 없을경우 00님이 초대하였습니다. 글씨 append 하기 
			var check ="";
			var names = "${names}";
			$.ajax({
						method : 'POST',
						url : 'checkReg_date',
						data : {
							cname : "${cname}"
						},
						error : function(request, status, error) {
							alert("code: " + request.status + "\n"
									+ "message: " + request.responseText + "\n"
									+ "error: " + error);
						},
						success : function(result) {
							check = result.trim();
						}
					});

			//날짜 append 해주기, chat db에 reg_Date 업데이트 해주기 
			$.ajax({
				method : 'POST',
				url : 'updateReg_date',
				data : {
					cname : "${cname}"
				},
				error : function(request, status, error) {
					alert("code: " + request.status + "\n" + "message: "
							+ request.responseText + "\n" + "error: " + error);
				},
				success : function(result) {
					var resultNum = result.split(":");
					resultNum[0] = resultNum[0].trim();
					//alert("결과는?"+resultNum[0]+"이거다");
					if (resultNum[0] != '') {
						$("#messageWindow").append(
								"<br><hr width='42.3%'><span id='date'>"
										+ resultNum[1]
										+ "</span><hr width='42.3%'><br>");
					}
					//등록된 날짜가 없을경우 00님이 초대하였습니다. 글씨 보이게 하기(파일에 data 넣기)
					if(check ==''){
						var resultNames = "${member.name}님이  ${resultName} 님을 초대했습니다.";
						var resultHtml = "<br><div id='create'><center><p id='ctext'>"+resultNames+"</p></center></div>";
						$("#messageWindow").append(resultHtml); 
						
						//파일에 초대되었습니다. 써주기 
						$.ajax({
							method : 'POST',
							url : 'writeInvite',
							data : {
								cname : "${cname}",
								names : resultNames
							},
							error : function(request, status, error) {
								alert("code: " + request.status + "\n"
										+ "message: " + request.responseText + "\n"
										+ "error: " + error);
							},
							success : function(result) {
							}
						});
					}
				}
			});

		}
		function onError(event) {
			alert(event.data);
		}
		$("#send")
				.click(

						function() {
							var contents = $('#inputMessage').val().replace(/\r?\n/g, '<br>');
							if (contents == "") {
								alert("빈 내용을 보낼 수는 없습니다.");
							} else {
								if (userName == myName) {
									$("#messageWindow").append(
											"<br><div class='bubble2'>"
													+ inputMessage.value
													+ "</div>");
								} else {
									$("#messageWindow")
											.append(
													"<span class='my'>"
															+ myName
															+ " : </span><br><div class='bubble2'>"
															+ inputMessage.value
															+ "</div>");
								}

								webSocket.send(myName + ":"+ inputMessage.value + ":${cname}");

								//파일경로명 contents 업데이트 해주기 
								$.ajax({
									method : 'POST',
									url : 'updateContents',
									data : {
										cname : "${cname}"
									},
									error : function(request, status, error) {
										alert("code: " + request.status + "\n"
												+ "message: "
												+ request.responseText + "\n"
												+ "error: " + error);
									},
									success : function(result) {
										//alert(result);
									}
								});

								userName = myName;
								inputMessage.value = "";
							}
						});

		/* 자동으로 스크롤 내려가게 
		var chatScrollHeight = document.getElementById('messageWindow');
		$('#messageWindow').scrollTop(chatScrollHeight.scrollHeight); */

	});
</script>
</head>
<body>
	<div id="header"></div>
	<div id="menu"></div>
	<div id="contents">
		<div id="messageWindow">
			<br>
			<c:forEach items="${list}" var="list">
				<input type="hidden" class="listText" value="${list}"/>
			</c:forEach>
		</div>
		<div id="sendWindow">
			<input id="inputMessage" type="text" placeholder="메시지를 입력하세요" /> <input
				type="submit" value="send" id="send" />
		</div>
	</div>
</body>

</html>