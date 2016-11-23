<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<style type="text/css">
	td, table,#wrap{
		border : 1px solid black;
	}



</style>

<div id= "wrap">
<h4>기안문</h4>


	<table>
		<tr>
			<td colspan="4">기안용폼</td>
		</tr>
		<tr>	
			<td>문서번호</td>
			<td></td>
		</tr>	
		<tr>
			<td>기안부서</td>
			<td><input type ="text" name =""></td>
			<td>기안자</td>
			<td><input type ="text" name =""></td>
		</tr>
		<tr>
			<td>제목</td>
			<td colspan="2"><input type = "text" name = "title"></td>
		</tr>
		<tr>
			<td>기안 일자</td>
			<td><input type = "text" name = "write_date"></td>
			<td>시행 일자</td>
			<td><input type = "text" name = "start_date"></td>
		</tr>
		<tr>
			<td colspan="4">내용</td>
		</tr>
		<tr>
			<td colspan="4"><input type = "text" name = "contents"></td>
		</tr>

	</table>

</div>


</body>
</html>