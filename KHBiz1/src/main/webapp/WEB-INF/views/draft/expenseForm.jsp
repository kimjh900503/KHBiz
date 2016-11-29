<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
	td, table,#wrap{
		border : 1px solid black;
	}
</style>

</head>
<body>
<div id= "wrap">
<h4>지출서</h4>

	<table>
		<tr>
			<td colspan="6" style = "text-align: center;">지출확인서폼</td>
		</tr>
		<tr>
			<td>금액</td>
			<td><input type="text" name="price" >원정</td>
		</tr>
		<tr>
			<td>내역</td>
			<td><input type="text" name ="items"></td>
		</tr>
		<tr>
			<td colspan="6" style = "text-align: center;">내용</td>
		</tr>

	</table>

</div>


</body>
</html>