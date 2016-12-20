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

	<table class="table" style = "text-align: center;">
	<input type="hidden" value="${callExpense.sheet_code }">
		
		<tr>
			<td style = "font-weight: bolder; background-color: #f2f2f2;">금액</td> 
			<td>${callExpense.price }&nbsp  &nbsp 원</td>
		</tr>

		<tr>
			<td style = "font-weight: bolder; background-color: #f2f2f2;">내역</td>
			<td>${callExpense.items}</td>
		</tr>
		<tr>
			<td style = "font-weight: bolder; width : 20%; background-color: #f2f2f2;">작성일</td>
			<td><fmt:formatDate value="${callExpense.reg_date }" pattern="yyyy-MM-dd" /></td>
		</tr>
		<tr>
          <td colspan="5" class="divider"></td>
        </tr>
	</table>


</body>
</html>