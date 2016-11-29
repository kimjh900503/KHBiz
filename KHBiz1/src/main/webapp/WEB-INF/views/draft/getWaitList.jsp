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
			url:"getWaitView",
			type:"GET",
			data:{d_num:$(this).attr("id")},
			success:function(data){

				$(".modal-content").html(data);
			}
		});

		});
	});
</script>
<style type="text/css">
	td{
	border : 1px solid black;
	}
</style>
</head>
<body>
	<h2>결재대기 리스트</h2>
	<table>
		<tr>
			<td>기안자</td>
			<td>제목</td>
			<td>상신일</td>
			<td>마감일</td>
			<td>개인마감일</td>
			<td>문서 유형</td>		
			<td>결재</td>	
		</tr>
		<c:forEach items="${getWaitList}" var="wl">
		<tr>
			<input type="hidden" value="${wl.d_num}" id="d_num">
			<td>${wl.name}</td>
			<td>${wl.title }</td>
			<td><fmt:formatDate value="${wl.up_date}" pattern="yyyy-MM-dd" /></td>
			<td>${wl.due_date}</td>
			<td>${wl.due_per_date }</td>
			<td>${wl.sheet_kind}</td>
			<td><input type = "button" class="but" id="${wl.d_num}" data-toggle="modal" data-target="#modal-testNew123" role="button" data-backdrop="static" value="결재하기"></td>
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