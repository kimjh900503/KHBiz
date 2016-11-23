<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script type="text/javascript" src="/t1/js/sockjs-1.1.1.min.js"></script>
<script type="text/javascript">
	var sock = null;
	$(document).ready(function(){
		sock = new SockJS("/echo-ws/");
		sock.onopen = function(){
			sock.send("반갑습니다.");
		}
		sock.onmessage = function(evt){
			$("#chatMessage").append(evt.data+"<br/>");
		}
		sock.onclose = function(){
			sock.send("퇴장");
		}
		$("#sendMessage").click(function(){
			if($("#message").val()!=""){
				sock.send($("#message").val());
				$("#chatMessage").append("나 -> "+$("#message").val()+"<br/>");
				$("#message").val("");
			}
		});
	});
</script>
</head>

<body>
<h4>Chatting Page</h4>
<input type="text" id="message"/>
<input type="button" id="sendMessage" value="메시지 보내기"/>
<div id="chatMessage" style="overFlow: auto; max-height:500px;"></div>
</body>
</html>