<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src='/erp/js/datepicker.js'></script>
<script type="text/javascript">
	$(function () {
		//시작날짜 이전 선택 불가
		$('#due_date').blur(function() {
			var select = new Date($('#due_date').val());
			var end = new Date($('#start_date').val());
			if (select == '') {
				$('#start_date').val('');
				swal("에러", "마감일 부터 입력해 주세요.", "error");
			}
			if (select.toYmdDateString() > end.toYmdDateString()) {
				$('#start_date').val('');
				swal("에러", "시행일은 마감일 이후여야 합니다.", "error");
			}
		});
	});
</script>
	<input type ="hidden" value="${member.code}">
	<table id="gian_tab" class="table">
		<tr>
			<td>기안부서</td>
			<td>${member.department }</td>
		</tr>
		<tr>
			<td>제목</td>
			<td><input type = "text" name = "title1" class="form-control"></td>
		</tr>
		<tr>
			<td>시행 일자</td>
			<td><input type = "date" name = "start_date" class="form-control" id="start_date" ></td>
		</tr>
		<tr>
			<td>내용</td>
			<td><textarea rows="3" name="contents1" class="form-control"></textarea></td>
		</tr>

	</table>


</body>
</html>