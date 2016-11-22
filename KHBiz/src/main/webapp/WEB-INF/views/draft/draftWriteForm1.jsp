<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<!-- 1. jQuery 및 jQuery-ui.css 로드 -->
<link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
<script src="//code.jquery.com/jquery-1.12.0.min.js"></script>
<script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
 
<script>
$(function() {
$( "#datepicker" ).datepicker();
});
</script>

</head>
<body>
<h2>기안서 작성</h2>

<form action="draftWrite">
직원코드<input type = "number" name = "code"><br>
제목<br><input type = "text" name ="title"><br>
문서 선택 <br>
<select name="sheet_kind" id="sheet_kind">
	<option value="기안문">기안문</option>
	<option value="지출서">지출서</option>
	<option value="휴가서">휴가서</option>
</select><br>
<button id="btn" value="문서 작성" onclick="openPopup(${data.surIdx},'/test2');"></button>
<div id="popupWrapper">





</div>
내용<br><textarea rows="" cols="" name = "contents"></textarea><br>
<!-- 마감 날짜<br><input type = "date" name="due_date"><br> -->
<input type="text" name="due_date" id="datepicker" /><br>
-------------------------------------------------------<br>
임시보관<input type="radio" id="kind"  name = "kind" value="임시보관">
상신<input type="radio" name = "kind" id="kind" value="상신"><br>
-------------------------------------------------------<br>
<input type = "submit" id = "btn" value="완료">

</form>

</body>
</html>