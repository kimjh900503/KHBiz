<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script type="text/javascript">
	$(function() {
		$("#btn").click(function() {
			var code=$("#code").val();
			alert(code.length);
			if(isNaN(code)){
				alert("숫자만");
					
			}else if(code.length !=4){
				alert("4자리");
			}
			
			else{			
				alert("good");
				 $("#frm").submit(); 
			}
		});
	});

</script>
</head>
<body>
	<h2>사원등록</h2>
	<form action="memberJoin" method="post" id="frm">
		code<input type="text" name="code" id="code">
		<select name="department">
			<option value="인사팀">인사팀</option>
			<option value="회계팀">회계팀</option>
			<option value="편집팀">편집팀</option>
			<option value="디자인팀">디자인팀</option>
			<option value="개발팀">개발팀</option>
		</select>
		
		<select name="position">
			<option value="사원">사원</option>
			<option value="대리">대리</option>
			<option value="과장">과장</option>
			<option value="차장">차장</option>
			<option value="부장">부장</option>
			<option value="사장">사장</option>  <!--사장 : amdin-->
		</select>
		<input type="hidden" name="pw" value="0000">
		<input type="button" value="등록" id="btn">
	</form> 

</body>
</html>