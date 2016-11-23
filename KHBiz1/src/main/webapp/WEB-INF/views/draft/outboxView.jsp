<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
       <%@taglib prefix="c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<table>
			<tr>
			<td colspan="4" style = "text-align: center;">임시보관함</td>
		</tr>
		<tr>	
			<td>문서번호</td>
			<td>${outboxView.sheet_code }</td>
			<td>문서유형</td>
			<td>${outboxView.sheet_kind }</td>
			<td>이름(우선코드)</td>
			<td>${outboxView.code }</td>
		</tr>	
		<tr>
			<td>제목</td>
			<td>${outboxView.title}</td>
		</tr>
		<tr>
			<td>내용</td>
			<td>${outboxView.contents}</td>
		</tr>
		<tr>
			<td>작성날짜</td>
			<td>${outboxView.up_date}</td>
			<td>만료날짜</td>
			<td>${outboxView.due_date}</td>
		</tr>
	</table>
</body>
</html>