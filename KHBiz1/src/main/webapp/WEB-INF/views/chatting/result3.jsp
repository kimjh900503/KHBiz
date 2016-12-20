<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:forEach items="${counts}" var="count">
	<c:if test="${count =='0'}">
		 <div class="circle2"></div>
	</c:if>
	<c:if test="${count !='0'}">
		<div class="circle1">
			<center>${count}</center>
		</div>
	</c:if>
</c:forEach>