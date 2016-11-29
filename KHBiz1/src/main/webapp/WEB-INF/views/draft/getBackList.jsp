<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
	td{
	border : 1px solid black;
	}
</style>
</head>
<body>
	<h2>반려함</h2>
	<table>
		<tr>
			<td>기안자</td>
			<td>제목</td>
			<td>상신일</td>
			<td>마감일</td>
			<td>개인마감일</td>
			<td>문서 유형</td>			
		</tr>
		<c:forEach items="${getBackList}" var="bl">
		<tr>
		<input type="hidden" value="${bl.d_num}" id="d_num">
			<td>${bl.name}</td>
			<td><a data-toggle="modal" href="getBackList?d_num=${bl.d_num}" data-target="#modal-testNew123" role="button" data-backdrop="static">${bl.title}</a></td>
			<td><fmt:formatDate value="${bl.up_date}" pattern="yyyy-MM-dd" /></td>
			<td>${bl.due_date}</td>
			<td>${bl.due_per_date }</td>
			<td>${bl.sheet_kind}</td>
		</tr>
		</c:forEach>
	
	</table>
	
		<div id="modal-testNew123" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="테스트정보 등록" aria-describedby="테스트 모달">
    <div class="modal-dialog" style="width:700px;height:2500px">
        <div class="modal-content">
        </div>
    </div>
</div>
	
</body>
</html>
