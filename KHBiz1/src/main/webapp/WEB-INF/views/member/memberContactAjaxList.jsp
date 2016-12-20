<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script type="text/javascript">
	$(document).ready(function() {
		var message="${message}";
		if(message !=""){
			swal(message);
		}
		$("#departmentFind").change(function() {
			var department = $("#departmentFind").val();
			$.ajax({
				url : "./memberContactDepartmentList",
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
				location.href = "memberContactList";
			}
		});
		var docH       = $(window).height();
		var wScrollTop = $(window).scrollTop();
	    var wHeight    = $('#body').height();
	    var scrollBtm  = wHeight - docH+170;
		$('.main-panel').scroll(function () {
			if($('.main-panel').scrollTop()>($('#body').height()-$(window).height()+170)){
				var max = ${memberContact.size()};
				if(max<40){	
				}else{
					setTimeout(function(){
						$.ajax({
							url:"memberContactAjaxList",
							type:"get",
							data:{
								perPage:max*1+20,
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
		<td class="td1">부서</td>
		<td class="td1">직급</td>
		<td>이름</td>
		<td class="td2">생년월일</td>
		<td>이메일</td>
		<td class="td2">핸드폰 번호</td>



	</tr>

	<c:forEach items="${memberContact}" var="member" varStatus="i">

		<tr>
			<td>${member.department}</td>
			<td>${member.position}</td>
			<td>${member.name}</td>
			<td>${member.birth}</td>
			<td>${member.id}</td>
			<td>${member.phone}</td>

		</tr>			
	</c:forEach>
</table>