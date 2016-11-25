<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" 	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
<link rel="stylesheet" href="/resources/demos/style.css">
<title>Insert title here</title>
<!-- 1. jQuery 및 jQuery-ui.css 로드 -->
<link rel="stylesheet" 	href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
<script src="//code.jquery.com/jquery-1.12.4.js"></script> 
<script src="//code.jquery.com/jquery.min.js">
<script src="//code.jquery.com/jquery-1.12.0.min.js"></script>
<script src="//code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script>
	$(function() {

		  
		$("#btn").click(function() {

			var kind = $("#sheet_kind").val();
			if (kind == "기안문") {
				$("#sheet").load("draftForm1");

			} else if (kind == "지출서") {
				$("#sheet").load("draftForm2");
			} else {
				$("#sheet").load("draftForm3");
			}

			
			// 3개 submit method 3개 만들기 ( controller에 )
			$("#btn2").click(function() {
				var kind = $("#sheet_kind").val();

				if (kind == "기안문") {
					$("#go_form").attr("action", gooooo)

				} else if (kind == "지출서") {
					$("#sheet").load("draftForm2");
				} else {
					$("#sheet").load("draftForm3");
				}

				$("#go_form").submit();
			}); //

		});

	
	
		$("#ap_btn").click(function() {
		
			$("#app_list").load("approverList");						
				
			});
		
		$("#app_list").on("click","#app_btn",function(){
			var result="<table>";
			$(".app_ch").each(function(){
				if($(this).prop("checked")){
					var cla = $(this).attr("id");
					result=result+"<tr>";
					$("."+cla).each(function () {
					result=result+'<td><input type ="text" name="tab" value="'+$(this).text()+'">';					
					});
					result=result+'<input type ="text" name="tt"></td>';
					result=result+"</tr>";
				}
				
			});
			result=result+"</table>"
			
			
			$("#selectList").html(result);
			
			
		});
		

	});
</script>
<style>
#dep {
	width: 10%;
	height: 200px;
	float: left;
	border: 1px solid black;
}

#pos {
	width: 15%;
	height: 200px;
	float: left;
	border: 1px solid black;
}
</style>
</head>
<body>
	<h2>기안서 작성</h2>

	<form id="go_form" action="draftWrite" method ="post">
		직원코드<input type="number" name="code"><br>
		==================================<br> 
		<input type = "button" value="결재자 선택" id = "ap_btn"><br>

		<div id = "app_list">
			
		</div>
		<div id="selectList">
		</div>
		==================================<br> 제목<br> 
		<input	type="text" name="title"><br> 
		문서 선택 <br> 
		<select name="sheet_kind" id="sheet_kind">
			<option value="기안문">기안문</option>
			<option value="지출서">지출서</option>
			<option value="휴가서">휴가신청서</option>
		</select> <input type="button" id="btn" value="문서작성하기">
		<div id="sheet">
		
		</div>

		내용<br>
		<textarea rows="" cols="" name="contents"></textarea>
		<br>

		<!-- 마감 날짜<br><input type = "date" name="due_date"><br> -->
		마감 날짜<br> 
		<input type="text" name="due_date" id="datepicker"><br>
		-------------------------------------------------------<br>
		 임시보관<input type="radio" id="kind" name="kind" value="임시보관"> 
		 상신<input  type="radio" name="kind" id="kind" value="상신"><br>
		-------------------------------------------------------<br> 
		<input	type="submit" id="btn2" value="완료">

	</form>





</body>
</html>