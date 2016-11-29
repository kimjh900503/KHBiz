<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>

<style type="text/css">
	#gian_table,#wrap,td{
		border : 1px solid black;
	}
</style>

<div id= "wrap">
<h4>기안문</h4>


	<table id="gian_tab">
		<tr>
			<td colspan="4" style = "text-align: center;">기안용폼</td>
		</tr>
		
		<tr>
			<td>기안부서</td>
			<td>${member.department }</td>
			<td>기안자(우선코드)</td>
			<input type ="hidden" value="${member.code}">
		</tr>
		<tr>
			<td>제목</td>
			<td colspan="2"><input type = "text" name = "title1"></td>
		</tr>
		<tr>
			<td>시행 일자</td>
			<td><input type = "date" name = "start_date"  ></td>
		</tr>
		<tr>
			<td colspan="4" style = "text-align: center;">내용</td>
		</tr>
		<tr>
			<td colspan="4"><input type = "text" name = "contents1"></td>
		</tr>

	</table>

</div>


</body>
</html>