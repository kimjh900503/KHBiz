<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript">
	$(document).ready(
			function() {
				$("#departmentFind").change(function() {
					var department = $("#departmentFind").val();
					$.ajax({
						url : "./attenddepartmentmanage",
						data : {
							department : department
						},
						success : function(result) {
							if (result != null) {
								$("#MemberListView").html(result);

							}

						}
					});
					if (department == "*") {
						location.href = "attendmanage";
					}

				});
				function itoStr($num) {
					$num < 10 ? $num = '0' + $num : $num;
					return $num.toString();
				}

				var btn = $('#btnExport');
				var tbl = 'tblExport';

				btn.on('click', function() {
					var dt = new Date();
					var year = itoStr(dt.getFullYear());
					var month = itoStr(dt.getMonth() + 1);
					var day = itoStr(dt.getDate());
					var hour = itoStr(dt.getHours());
					var mins = itoStr(dt.getMinutes());

					var postfix = year + month + day + "_" + hour + mins;
					var fileName = "AttendManage_" + postfix + ".xls";

					var uri = $("#" + tbl).excelexportjs({
						containerid : tbl,
						datatype : 'table',
						returnUri : true
					});

					$(this).attr('download', fileName).attr('href', uri).attr(
							'target', '_blank');
				});
				$('.attend_modi').click(function () {
					var cod = $(this).attr("id");
					$.ajax({
						url : "../s_json/getAttend?code="+cod,
						type : "get",
						success : function (data) {
							$('#modalTitle').html(data.name);
							$('#modal_code').html(data.code);
							$('#modal_code_hidden').val(data.code);
							$('#modal_depart').html(data.department);
							$('#modal_position').html(data.position);
							$('#modal_vacation').val(data.vacation);
							$('#modal_used').val(data.used);
							$('#modal_late').val(data.late);
							$('#modal_absence').val(data.absence);
							$('#modal_over').val(data.over);
							$('#fullCalModal').modal();
						}
				});
				});
				$('#modi_btn').click(function() {
					if($('#modal_vacation').val() ==''){
						swal("에러", "연차를 입력하세요", "error");
						return false;
					}else if($('#modal_used').val()==''){
						swal("에러", "사용일수를 입력하세요", "error");
						return false;
					}else if($('#modal_late').val()==''){
						swal("에러", "지각일수를 입력하세요", "error");
						return false;
					}else if($('#modal_absence').val()==''){
						swal("에러", "결근일수를 입력하세요", "error");
						return false;
					}else if($('#modal_over').val()==''){
						swal("에러", "초과근무 시간을 입력하세요", "error");
						return false;
					}else{
						$('#modi_frm').submit();
						$('#fullCalModal').modal('hide');
					}
				});
				var docH       = $(window).height();
				var wScrollTop = $(window).scrollTop();
			    var wHeight    = $('#body').height();
			    var scrollBtm  = wHeight - docH+170;
				$('.main-panel').scroll(function () {
					if($('.main-panel').scrollTop()>($('#body').height()-$(window).height()+170)){
						var max = ${list.size()};
						var department = ${list[0].department};
						if(max<40){	
						}else{
							setTimeout(function(){
								$.ajax({
									url:"attenddepartmentmanageAjax",
									type:"get",
									data:{
										perPage:max*1+20,
										department:department
									},
									success:function(data){
										$("#MemberListView").html(data);
									}
								});
							},500);	
						}
					}
				});

			});
</script>
<table class="table table-hover" id="tblExport">
	<tr>
		<td>사번</td>
		<td>부서</td>
		<td>직급</td>
		<td>이름</td>
		<td>총 연차</td>
		<td>사용 일수</td>
		<td>잔여 일수</td>
		<td>지각 일수</td>
		<td>결근 일수</td>
		<td>초과근무(h)</td>
	</tr>

	<c:forEach items="${list}" var="list">
		<tr id="${list.code}" class="attend_modi" style="cursor:pointer">
			<td>${list.code}</td>
			<td>${list.department}</td>
			<td>${list.position}</td>
			<td>${list.name}</td>
			<td>${list.vacation}</td>
			<td>${list.used}</td>
			<td>${list.vacation - list.used}</td>
			<td>${list.late}</td>
			<td>${list.absence}</td>
			<td>${list.over}</td>

		</tr>
	</c:forEach>
</table>
