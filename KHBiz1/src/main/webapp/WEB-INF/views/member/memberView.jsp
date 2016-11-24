<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<title>Insert title here</title>
<script type="text/javascript">
	$(function() {
	var message="${message}";
		if(message !=""){
			alert(message);
		}
	});

</script>
</head>
<body>
<h2>개인정보 보기</h2>
<table>
	<tr>
		<td>사원번호 : </td>
		<td>${member.code}</td>
	</tr>
	<tr>
		<td>부서 : </td>
		<td>${member.department}</td>
	</tr>
	<tr>
		<td>직급 : </td>
		<td>${member.position}</td>
	</tr>
	<tr>
		<td>아이디 : </td>
		<td>${member.id}</td>
	</tr>
	<tr>
		<td>비밀번호 : </td>
		<td>${member.pw}</td>
	</tr>
	<tr>
		<td>이름 : </td>
		<td>${member.name}</td>
	</tr>
	<tr>
		<td>성별 : </td>
		<td>${member.gender}</td>
	</tr>
	<tr>
		<td>생년월일 : </td>
		<td>${member.birth}</td>
	</tr>
	<tr>
		<td>핸드폰 번호 : </td>
		<td>${member.phone}</td>
	</tr>
</table>
<a href="memberMod"><input type="button" value="수정"></a>


</body>
</html>