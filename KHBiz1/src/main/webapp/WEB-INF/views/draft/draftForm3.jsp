<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
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
<h4>휴가신청서</h4>
<table>
		<tr>
			<td colspan="6" style = "text-align: center;">휴가신청서폼</td>
		</tr>
		<tr>	
			<td>문서번호</td>
			<td></td>
		</tr>	
		<tr>
			<td>신청자(우선코드)</td>
			<td><input type ="text" name =""></td>
		<tr>
			<td>휴가사유</td>
			<td><select>
				<option>축하</option>
				<option>출산</option>
				<option>생리</option>
				<option>병가</option>
				<option>공가</option>
				<option>연월차휴가</option>
				<option>특별유급</option>
			</select></td>
		</tr>
		<tr>
			<td>휴가 시작날짜</td>
			<td></td>
			<td>휴가 마지막 날짜</td>
			<td></td>
			<td>기간</td>
			<td></td>
		</tr>
		<tr>
			<td colspan="6" style = "text-align: center;">내용</td>
		</tr>
		<tr>
				<td colspan="6"><input type = "text" name = "contents"></td>
		</tr>
		<tr>
			<td>직무대행자</td>
			<td></td>
			<td>직무대행자 직위</td>
			<td></td>
		</tr>
		<tr>
			<td>비상연락처</td>
			<td></td>
		</tr>
	</table>




</div>
</body>
</html>