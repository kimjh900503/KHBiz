<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
	border:1px solid rgb(215,215,215);
	height:65px;
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
	margin-left: 60%;
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
#date{
	color:rgb(142,159,169);
	font-weight:bold;
}
hr{
	display:inline-block;
}
#create{
	width:100%;
	background: rgb(225,235,244);
	height:50px;
}
#ctext{
	line-height: 50px;
}
#sendWindow{
	width:85%;
	height:100px;
	background: rgb(255,255,255);
	border-top: 1px solid rgb(215,215,215);
	position:fixed;
    z-index:999;
    top:630px;
    left:230px;

}
</style>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script type="text/javascript">
	$(function() {
		//시작
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
			$("#messageWindow").append(
					"<span>상대: </span><br><div class='bubble'>" + event.data
							+ "</div>");
		}
		function onOpen(event) {
			//$("#messageWindow").append("<p>연결 성공</p>");
		}
		function onError(event) {
			alert(event.data);
		}
		$("#send").click(
				function() {
					$("#messageWindow").append(
							"<span class='my'>나 : </span><br><div class='bubble2'>"
									+ inputMessage.value + "</div>");

					webSocket.send(inputMessage.value);
					inputMessage.value = "";
				});
	});
</script>
</head>
<body>
	<div id="header"></div>
	<div id="menu"></div>
	<div id="contents">
	<br>
		<div id="messageWindow">
			<jsp:useBean id="now" class="java.util.Date" />
			<hr width="42.3%"><span id="date"><fmt:formatDate value="${now}" dateStyle="full" /></span><hr width="42.3%">
			<br><br>
			<div id="create"><center><p id="ctext"><%=session.getAttribute("name")%>님이 채팅방을 생성하였습니다.</p></center></div>
		</div>
		<div id="sendWindow"><input id="inputMessage" type="text" placeholder="메시지를 입력하세요" /> <input type="submit"
			value="send" id="send" />
		</div>
	</div>
</body>

</html>