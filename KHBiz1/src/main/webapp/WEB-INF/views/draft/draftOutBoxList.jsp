<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@taglib prefix="c" uri = "http://java.sun.com/jsp/jstl/core" %>
        <%@taglib prefix="fmt" uri = "http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
  <meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
 <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
 <script type="text/javascript">
 	$(function(){
 		$("#btn").click(function(){
 		var d_num = $("#d_num").val();
 		
 		$("view_div").load("outboxView");
 		
 		});
 	});
 
 
 
 </script>
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
		<td>상신</td>
		
	</tr>
	<c:forEach items="${outboxList}" var="obl">
	<tr>
		<input type ="hidden" value="${obl.d_num }" id="d_num">
		<td>${obl.code}</td>
		<td id ="view">${obl.title }</td>
		<td><fmt:formatDate value="${obl.up_date}" pattern="yyyy-MM-dd"/>  </td>
		<td>${obl.sheet_kind}</td>
		<td>${obl.sheet_code}</td>		 
		<td><button>상신하기</button></td>				
	</tr>
	</c:forEach>	
</table>

<div id="view_div">


</div>

		
		
		
		
		
</body>
</html>