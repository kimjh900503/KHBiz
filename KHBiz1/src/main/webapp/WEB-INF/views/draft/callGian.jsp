<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

	<table class="table" style = "text-align: center;">
	<input type="hidden" value="${callGian.sheet_code }">
		<tr>
			<td style="background-color: #f2f2f2; width: 20%; font-weight: bold;">제목</td>
			<td>${callGian.title1 }</td>
		</tr>
		<tr>
			<td style="background-color: #f2f2f2; width: 20%;font-weight: bold;">내용</td>
			<td>${callGian.contents1 }</td>
		</tr>
		<tr>
		<tr>
			<td style="background-color: #f2f2f2; width: 20%;font-weight: bold;">작성일</td>
			<td>${callGian.write_date}</td>
		</tr>
			<td style="background-color: #f2f2f2; width: 20%;font-weight: bold;">기안 시행일</td>
			<td>${callGian.start_date }</td>
		</tr>
				<tr>
                                   				 <td colspan="5" class="divider"></td>
                                 			</tr>
	</table>


</body>
</html>