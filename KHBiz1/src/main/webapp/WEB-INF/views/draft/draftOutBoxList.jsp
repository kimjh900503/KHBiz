<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" 	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<style type="text/css">
.table, td {
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
			<td>상신</td>

		</tr>
		<c:forEach items="${outboxList}" var="obl">
			<tr>
				<input type="hidden" value="${obl.d_num }" id="d_num">
				<td>${obl.code}</td>
				<td><a data-toggle="modal" href="outboxView?d_num=${obl.d_num}" data-target="#modal-testNew" role="button" data-backdrop="static">${obl.title }</a></td>
				<td><fmt:formatDate value="${obl.up_date}" pattern="yyyy-MM-dd" />
				</td>
				<td>${obl.sheet_kind}</td>
				<td>${obl.sheet_code}</td>
				<td><button><a href="outboxReport?d_num=${obl.d_num }">상신하기</a></button></td>
			</tr>
		</c:forEach>
	</table>



<div id="modal-testNew" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="테스트정보 등록" aria-describedby="테스트 모달">
    <div class="modal-dialog" style="width:700px;height:2500px">
        <div class="modal-content">
        </div>
    </div>
</div>






</body>
</html>