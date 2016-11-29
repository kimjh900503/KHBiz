<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>받은 결재함</h2>
	<a href="getWaitList?code2=${member.code}">결재대기</a>
	<a href="getFinList?code2=${member.code}">결재완료</a>
	<a href="getBackList?code2=${member.code}">반려함</a>
</body>
</html>