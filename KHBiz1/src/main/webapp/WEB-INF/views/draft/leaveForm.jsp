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
			<td>신청자(우선코드)</td>
			<td><input type ="text" name ="code"></td>
		<tr>
			<td>휴가사유</td>
			<td><select name="category">
				<option value="경조사">경조사</option>
				<option value="출산">출산</option>
				<option value="생리">생리</option>
				<option value="병가">병가</option>
				<option value="봉사">봉사</option>
				<option value="민방위/예비군">민방위/예비군</option>
				<option value="연월차휴가">연월차휴가</option>
				<option value="특별유급">특별유급</option>
			</select></td>
		</tr>
		<tr>
			<td>휴가 시작일</td>
			<td><input type="text" name="start_date"></td>
			<td>휴가 종료일</td>
			<td><input type="text" name="fin_date"></td>
			<td>기간</td>
			<td><input type="text" name="during" placeholder="ex)1박 2일, 반차 ..."></td>
		</tr>
		<tr>
			<td></td>
			<td><input type="radio" name="start_time" value="오전">오전<input type="radio" name="start_time" value="오후">오후 </td>
				<td></td>
			<td><input type="radio" name="fin_time" value="오전">오전<input type="radio" name="fin_time" value="오후">오후 </td>
		</tr>
		<tr>
			<td colspan="6" style = "text-align: center;">내용</td>
		</tr>
		<tr>
				<td colspan="6"><input type = "text" name = "contents3"></td>
		</tr>
		<tr>
			<td>직무대행자</td>
			<td><input type="text" name=proxy_name"></td>
			<td>직무대행자 직위</td>
			<td><input type="text" name=proxy_position"></td>
		</tr>
		<tr>
			<td>비상연락처</td>
			<td><input type="text" name="contact"></td>
		</tr>
	</table>




</div>
</body>
</html>