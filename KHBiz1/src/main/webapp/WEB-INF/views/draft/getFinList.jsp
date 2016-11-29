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
	<h2>결재완료 리스트</h2>
	<table>
		<tr>
			<td>기안자</td>
			<td>제목</td>
			<td>상신일</td>
			<td>마감일</td>
			<td>개인마감일</td>
			<td>문서 유형</td>			
		</tr>
		<c:forEach items="${getFinList}" var="fl">
		<tr>
		<input type="hidden" value="${fl.d_num}" id="d_num">
			<td>${fl.name}</td>			
			<td><a data-toggle="modal" href="getFinList?d_num=${fl.d_num}" data-target="#modal-testNew123" role="button" data-backdrop="static">${fl.title}</a></td>
			<td><fmt:formatDate value="${fl.up_date}" pattern="yyyy-MM-dd" /></td>
			<td>${fl.due_date}</td>
			<td>${fl.due_per_date }</td>
			<td>${fl.sheet_kind}</td>
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