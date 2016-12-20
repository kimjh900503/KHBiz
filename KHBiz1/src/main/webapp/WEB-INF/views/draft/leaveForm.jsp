<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src='/erp/js/datepicker.js'></script>

<script type="text/javascript">
	var now = new Date();
	$(function () {
		//과거날짜 선택 불가
		$('#startdate').blur(function() {
			var select = new Date($('#startdate').val());
			if (select.toYmdDateString() < now.toYmdDateString()) {
				$('#startdate').val('');
				swal("에러", "지나간 날짜 입니다.", "error");
			}
		});
		//시작날짜 이전 선택 불가
		$('#enddate').blur(function() {
			var select = new Date($('#startdate').val());
			var end = new Date($('#enddate').val());
			if (select == '') {
				$('#enddate').val('');
				$('#during').val('');
				swal("에러", "시작일 부터 입력해 주세요.", "error");
			}
			if (select.toYmdDateString() > end.toYmdDateString()) {
				$('#enddate').val('');
				$('#during').val('');
				swal("에러", "종료일은 시작일 이후여야 합니다.", "error");
			}else{
				var during = end.toYmdDateString()-select.toYmdDateString()+1;
				during = during+'일';
				$('#during').val(during);
			}
		});
	});
</script>
</head>
<body>
<!-- <input type="hidden" name="during" class="form-control" id="during"> -->
<table class="table">
		<tr>
			<td>휴가사유</td>
			<td colspan="3"><select name="category" class="form-control">
				<option value="경조사">경조사</option>
				<option value="출산">출산</option>
				<option value="생리">생리</option>
				<option value="병가">병가</option>
				<option value="봉사">봉사</option>
				<option value="민방위/예비군">민방위/예비군</option>
				<option value="연월차휴가">연월차휴가</option>
				<option value="특별유급">특별유급</option>
			</select></td>
		</tr>
		<tr>
			<td>휴가 시작일</td>
			<td><input type="date" name="start_date" class="form-control" id="startdate"></td>
			<td>휴가 종료일</td>
			<td><input type="date" name="fin_date" class="form-control" id="enddate"></td>
		</tr>
		<tr>
			<td>내용</td>
			<td colspan="3"><textarea rows="3" name="contents3" class="form-control"></textarea></td>
		</tr>
		<tr>
			<td>직무대행자</td>
			<td><input type="text" name="proxy_name" class="form-control"></td>
			<td>직무대행자 직위</td>
			<td><input type="text" name="proxy_position" class="form-control"></td>
		</tr>
		<tr>
			<td>비상연락처</td>
			<td colspan="3"><input type="text" name="contact" class="form-control"></td>
		</tr>
	</table>

</body>
</html>