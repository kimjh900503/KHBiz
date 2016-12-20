<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

<div class="container">
			<table class="table table-striped" >
				<tr>
					<td>선택</td>
					<td>사원번호</td>
					<td>부서</td>
					<td>직책</td>
					<td>이름</td>
				</tr>
				<c:forEach items="${approverList }" var = "apl" varStatus="i">
					<tr>
						<td><input type="checkbox" class="app_ch" id="app_ch${i.index}" name = "app_ch" value="${apl.code }">
						</td>
						<td class="app_ch${i.index}">${apl.code }</td>
						<td class="app_ch${i.index}">${apl.department}</td>
						<td class="app_ch${i.index}">${apl.position}</td>
						<td class="app_ch${i.index}">${apl.name}</td>
					</tr>
					</c:forEach>
			</table>
		
		</div>



</body>
</html>