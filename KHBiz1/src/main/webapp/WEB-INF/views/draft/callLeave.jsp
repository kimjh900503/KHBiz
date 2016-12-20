<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
      <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

	<table class="table" style = "text-align:  center;">
	<input type="hidden" value="${callLeave.sheet_code }">
		<tr>
			<td style="background-color: #f2f2f2;width : 20%;font-weight: bold;">사유</td>
			<td style="width:30%;">${callLeave.category }</td>
		
			<td style="background-color: #f2f2f2;width : 20%;font-weight: bold;">세부사항</td>
			<td style="width:30%;">${callLeave.contents3 }</td>
		</tr>
		<tr>
			<td style="background-color: #f2f2f2;width : 20%;font-weight: bold;">시작일</td>
			<td style="width:25%;">${callLeave.start_date}</td>
		
			<td style="background-color: #f2f2f2;width : 20%;font-weight: bold;">종료일</td>
			<td style="width:25%;">${callLeave.fin_date}</td>
		</tr>
		<tr>
			<td colspan ="4" style="background-color: #f2f2f2;width : 20%;font-weight: bold;">직무대리자</td>
		</tr>
		<tr>
			<td style="background-color: #f2f2f2;width : 20%;font-weight: bold;">이름</td>
			<td>${callLeave.proxy_name}</td>
	
			<td style="background-color: #f2f2f2;width : 20%;font-weight: bold;">부서(직급)</td>
			<td>${callLeave.proxy_position}</td>
		</tr>
		<tr>
			<td style="background-color: #f2f2f2;width : 20%;font-weight: bold;">비상 연락처</td>
			<td>${callLeave.contact}</td>
		</tr>
				<tr>
                                   				 <td colspan="5" class="divider"></td>
                                 			</tr>
	</table>


</body>
</html>