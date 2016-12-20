<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script type="text/javascript">
	$(document).ready(function() {
		$("#departmentFind").change(function() {
			var department = $("#departmentFind").val();
			$.ajax({
				url : "./memberDepartmentList",
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
				location.href = "memberOriginList";
			}

		});
		$(".departmentSelect").change(function() {
		  var idx = $(this).attr("id");
		  var department = this.value;
			swal({
				  title: "부서 변경?",
				  text: "확인클릭시 변경됩니다.",
				  type: "warning",
				  showCancelButton: true,
				  confirmButtonColor: "#00ff00",
				  confirmButtonText: "확인",
				  closeOnConfirm: false
				},
				function(isConfirm){
					if(isConfirm){
						$.post("./memberDepartmentMod", {
							department : department,
							code : idx
						}, function(result) {
							swal("변경", "부서 이동 완료", "success");
							 $.ajax({
									url : "./memberDepartmentList",data :{
										department :department
									},success:function(result){
										if(result != null){
									     	$("#MemberListView").html(result);
									     
									     }
										
									}
								});
						
						});	
					}else{
						document.getElementById(idx).value=department;
					}
				});
		});

		$(".positionSelect").change(function() {
			var idx = $(this).attr("id");
			var position = this.value;
			swal({
				  title: "직급 변경?",
				  text: "확인클릭시 변경됩니다.",
				  type: "warning",
				  showCancelButton: true,
				  confirmButtonColor: "#00ff00",
				  confirmButtonText: "확인",
				  closeOnConfirm: false
				},
				function(){
					$.post("./memberPositionMod", {
						position : position,
						code : idx
					}, function(result) {
						swal("변경", "직급 변경 완료", "success");
						var department=$("#departmentFind").val();
						 $.ajax({
								url : "./memberDepartmentList",data :{
									department :department
								},success:function(result){
									if(result != null){
								     	$("#MemberListView").html(result);
								     }
								}
							});
					});
				});
		});
		$(".del").click(function () {
			var idx = $(this).attr("id");
			swal({
				  title: "사원 삭제",
				  text: "확인클릭시 삭제됩니다.",
				  type: "warning",
				  showCancelButton: true,
				  confirmButtonColor: "#DD6B55",
				  confirmButtonText: "확인",
				  closeOnConfirm: false
				},
				function(){
					$.post("./memberDelete", {
						code : idx
					}, function(result) {
						swal("삭제", "직원 삭제 완료", "success");
						var department=$("#departmentFind").val();
						$.ajax({
							url : "./memberDepartmentList",data :{
								department :department
							},success:function(result){
								if(result != null){
							     	$("#MemberListView").html(result);
							     	
							     }
									
							}
						});
					});
				});
		});
		$("#join_btn").click(function() {
			
			$("#frm").submit();
			$('#fullCalModal').modal('hide')
		
		});
		var docH       = $(window).height();
		var wScrollTop = $(window).scrollTop();
	    var wHeight    = $('#body').height();
	    var scrollBtm  = wHeight - docH+170;   
		$('.main-panel').scroll(function () {
			if($('.main-panel').scrollTop()>($('#body').height()-$(window).height()+170)){
				var max = ${memberDepartList.size()};
				var department ='${memberDepartList[0].department}';
				if(max<20){	
				}else{
					setTimeout(function(){
						$.ajax({
							url:"memberDepartmentAjaxList",
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
<table class="table">
	<tr>
		<td class="col-md-0.5">사번</td>
		<td class="col-md-1">부서</td>
		<td class="col-md-1">직급</td>
		<td class="col-md-1">아이디</td>
		<td class="col-md-0.5">이름</td>
		<td class="col-md-0.5">성별</td>
		<td class="col-md-1">생년월일</td>
		<td class="col-md-1">핸드폰 번호</td>
		<td class="addressView">주소</td>
		<td class="col-md-1">입사일</td>
		<td>삭제</td>

	</tr>

	<c:forEach items="${memberDepartList}" var="member">
		<tr>
			<td>${member.code}</td>
			<td><select class="departmentSelect form-control"
				id="${member.code}">
					<c:choose>
						<c:when test="${member.department eq '인사팀'}">
							<option value="${member.department}">${member.department}</option>
							<option value="회계팀">회계팀</option>
							<option value="편집팀">편집팀</option>
							<option value="디자인팀">디자인팀</option>
							<option value="개발팀">개발팀</option>
						</c:when>
						<c:when test="${member.department eq '회계팀'}">
							<option value="${member.department}">${member.department}</option>
							<option value="인사팀">인사팀</option>
							<option value="편집팀">편집팀</option>
							<option value="디자인팀">디자인팀</option>
							<option value="개발팀">개발팀</option>
						</c:when>
						<c:when test="${member.department eq '편집팀'}">
							<option value="${member.department}">${member.department}</option>
							<option value="인사팀">인사팀</option>
							<option value="회계팀">회계팀</option>
							<option value="디자인팀">디자인팀</option>
							<option value="개발팀">개발팀</option>
						</c:when>
						<c:when test="${member.department eq '디자인팀'}">
							<option value="${member.department}">${member.department}</option>
							<option value="인사팀">인사팀</option>
							<option value="회계팀">회계팀</option>
							<option value="편집팀">편집팀</option>
							<option value="개발팀">개발팀</option>
						</c:when>
						<c:when test="${member.department eq '개발팀'}">
							<option value="${member.department}">${member.department}</option>
							<option value="인사팀">인사팀</option>
							<option value="회계팀">개발팀</option>
							<option value="편집팀">편집팀</option>
							<option value="디자인팀">디자인팀</option>
						</c:when>
					</c:choose>
			</select></td>
			<td><select class="positionSelect form-control"
				id="${member.code}">
					<c:choose>
						<c:when test="${member.position eq '사원'}">
							<option value="${member.position}">${member.position}</option>
							<option value="대리">대리</option>
							<option value="과장">과장</option>
							<option value="차장">차장</option>
							<option value="팀장">팀장</option>
						</c:when>
						<c:when test="${member.position eq '대리'}">
							<option value="${member.position}">${member.position}</option>
							<option value="사원">사원</option>
							<option value="과장">과장</option>
							<option value="차장">차장</option>
							<option value="팀장">팀장</option>
						</c:when>
						<c:when test="${member.position eq '과장'}">
							<option value="${member.position}">${member.position}</option>
							<option value="사원">사원</option>
							<option value="대리">대리</option>
							<option value="차장">과장</option>
							<option value="팀장">팀장</option>
						</c:when>
						<c:when test="${member.position eq '과장'}">
							<option value="${member.position}">${member.position}</option>
							<option value="사원">사원</option>
							<option value="대리">대리</option>
							<option value="차장">차장</option>
							<option value="팀장">팀장</option>
						</c:when>
						<c:when test="${member.position eq '차장'}">
							<option value="${member.position}">${member.position}</option>
							<option value="사원">사원</option>
							<option value="대리">대리</option>
							<option value="과장">과장</option>
							<option value="팀장">팀장</option>
						</c:when>
						<c:when test="${member.position eq '팀장'}">
							<option value="${member.position}">${member.position}</option>
							<option value="사원">사원</option>
							<option value="대리">대리</option>
							<option value="과장">과장</option>
							<option value="차장">차장</option>
						</c:when>
						<c:when test="${member.position eq '사장'}">
							<option value="${member.position}">${member.position}</option>
						</c:when>

					</c:choose>
			</select></td>
			<td>${member.id}</td>
			<td>${member.name}</td>
			<td>${member.gender}</td>
			<td>${member.birth}</td>
			<td>${member.phone}</td>
			<td>${member.address1}</td>
			<td>${member.hired_date}</td>
			<td>
				<button class="btn btn-default del" id="${member.code}">삭제</button>
			</td>

		</tr>
	</c:forEach>
</table>