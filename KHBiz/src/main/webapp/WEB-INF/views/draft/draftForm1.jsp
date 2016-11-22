<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
	.td, table{
		border : 1px solid black;
	}



</style>
</head>
<body>

<h2>기안문</h2>

<form action="draftForm1_write">
	<table>
		<tr>
			<td>기안용폼</td>
			<td>문서번호</td>
			<td></td>
		</tr>	
		<tr>
			<td>기안부서</td>
			<td></td>
			<td>기안자</td>
			<td></td>
		</tr>
		<tr>
			<td>제목</td>
			<td><input type = "text" name = "title"></td>
		</tr>
		<tr>
			<td>기안 일자</td>
			<td><input type = "text" name = "write_date"></td>
			<td>시행 일자</td>
			<td><input type = "text" name = "start_date"></td>
		</tr>
		<tr>
			<td>내용</td>
		</tr>
		<tr>
			<td><textarea rows="" cols="" name ="contents"></textarea></td>
		</tr>

	</table>
</form>










</body>
</html>