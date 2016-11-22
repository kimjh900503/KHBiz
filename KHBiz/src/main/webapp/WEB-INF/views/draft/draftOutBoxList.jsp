<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@taglib prefix="c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
	.table, td{
	border: 1px solid black;
	}

</style>
</head>
<body>
<h2>임시보관함</h2>

<table>
	<tr>
		<td>사원코드</td>
		<td>제목</td>
		<td>저장 날짜</td>
		<td>문서유형</td>
		<td>문서코드</td>
	</tr>
	<c:forEach items="${outboxList}" var="obl">
	<tr>
		<td>${obl.code}</td>
		<td><a href ="">${obl.title }</a></td>
		<td>${obl.up_date}</td>
		<td>${obl.sheet_kind}</td>
		<td>${obl.sheet_code}</td>		 
	</tr>
	</c:forEach>	
</table>





</body>
</html>