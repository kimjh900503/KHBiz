<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Testing</title>
<style type="text/css">
body {
	background-color: #D9E5FF;
}

#messageWindow {
	background-color: #D9E5FF;
	width: 90%;
	border: 0px;
}

#inputMessage {
	width: 90%;
}

.bubble {
	margin-left: 5%; position : relative;
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
</style>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script type="text/javascript">
	$(function() {
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
			$("#messageWindow").append("<p>연결 성공</p>");
			
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
	<fieldset>
		<div id="messageWindow"></div>
		<br /> <input id="inputMessage" type="text" /> <input type="submit"
			value="send" id="send" />
	</fieldset>
</body>

</html>