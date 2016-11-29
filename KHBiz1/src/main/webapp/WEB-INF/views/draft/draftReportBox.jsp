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
<script type="text/javascript">
	$(function () {
		$(".but").click(function(){

		$.ajax({
			url:"reportboxView",
			type:"GET",
			data:{d_num:$(this).attr("id")},
			success:function(data){

				$(".modal-content").html(data);
			}
			});
		});

	});//
</script>
<style type="text/css">
.table, td {
	border: 1px solid black;
}
</style>
</head>
<body>
	<h2>상신함</h2>

	<table>
		<tr>
			<td>사원코드</td>
			<td>제목</td>
			<td>저장 날짜</td>
			<td>문서유형</td>
			<td>문서코드</td>
			<td>상태</td>
			<td>보기</td>
		</tr>
		<c:forEach items="${reportboxList}" var="rbl">
			<tr>
				<input type="hidden" class="kind2" value="${rbl.kind2}">
				<td>${rbl.code}</td>
				<td>${rbl.title }</td>
				<td><fmt:formatDate value="${rbl.up_date}" pattern="yyyy-MM-dd" /></td>
				<td>${rbl.sheet_kind}</td>
				<td>${rbl.sheet_code}</td>
				<c:if test="${rbl.kind2==1}">
					<td>결재대기</td>
				</c:if>
				<c:if test="${rbl.kind2==2}">
					<td>결재완료</td>
				</c:if>
				<c:if test="${rbl.kind2==3}">
					<td>반려</td>
				</c:if>				
				<td><input type = "button" class="but" id="${rbl.d_num}" data-toggle="modal" data-target="#modal-testNew123" role="button" data-backdrop="static" value="상세보기"></td>
			</tr>
		</c:forEach>
	</table>

	<div id="modal-testNew123" class="modal fade" tabindex="-1" role="dialog"
		aria-labelledby="테스트정보 등록" aria-describedby="테스트 모달">
		<div class="modal-dialog" style="width: 700px; height: 2500px">
			<div class="modal-content"></div>
		</div>
	</div>




</body>
</html>