<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<title>Insert title here</title>
<style type="text/css">
	.phone{
	width: 50px;
	}

</style>
<script type="text/javascript">
	$(function() {
		var phone='${member.phone}';
		
		var ph=phone.split("-");
		$("#phone1").val(ph[1]);
		$("#phone2").val(ph[2]); 
		
		
		
		$("#modBtn").click(function(){
			var pw=$("#pw").val();
			var pwCheck=$("#pwCheck").val();
			var name=$("#name").val()
			var phone1=$("#phone1").val();
			var phone2=$("#phone2").val();
						 
			 

			var chk1=/[a-z]/i;  //적어도 한개의 a-z가 있는지 확인
			var chk2=/\d/;  //적어도 한개의 0-9가 있는지 확인
			var chk3= /^[가-힣]*$/;
			
			if(pw.length<6 || pw==''){
				alert("비밀번호는 6자 이상으로 입력하세요");
				return false;
		
		  	}else if(!(chk1.test(pw) && chk2.test(pw))){
		  		alert("비밀번호는 영문 숫자 조합으로 입력하세요");
		  		return false;
		  	}else if(pw!=pwCheck){
		  		alert("비밀번호가 일치하지 않습니다");
		  		return false;
		  	}else if(name==''){
		  		alert("이름을 입력하세요");
		  		return false;
		  	}
		  	else if(!chk3.test(name)){
		  		alert("이름을 한글로 입력하세요");
		  		return false;
		  	}
			else if(name.length <2){
		  		alert("이름을 2글자 이상 입력하세요");
		  		return false;
		  	}else  if(phone1=='' ){
		  		alert("핸드폰 번호를 입력하세요");
		  		return false;
		  	}else if(phone2==''){
		  		alert("핸드폰 번호를 입력하세요");
		  		return false;
		  	}else if(isNaN(phone1) || phone1.length !=4){
		  		alert("핸드폰 번호를 다시 확인하세요");
		  		return false;
		  	}else if(isNaN(phone2) || phone2.length !=4){
		  		alert("핸드폰 번호를 다시 확인하세요");
		  		return false;
		  	}else{
		  		$("#frm").submit();
		  	}
			
		
		});
		
		
		
	

	})

</script>
</head>
<body>
	<h2>개인정보 수정</h2>
	<form action="memberMod" method="post" id="frm">
	<input type="hidden" value="${member.code}" name="code">
	<input type="hidden" value="${member.department}" name="department">
	<input type="hidden" value="${member.position}" name="position">
	<input type="hidden" value="${member.hired_date}" name="hired_date">
	<input type="hidden" value="${member.id}" name="id">
	<input type="hidden" value="${member.birth}" name="birth">
	<input type="hidden" value="${member.gender}" name="gender">
	
		<table>
			<tr>
				<td>사원번호 : </td>
				<td>${member.code}</td>
			</tr>
			<tr>
				<td>부서 : </td>
				<td>${member.department}</td>
				
			</tr>
			<tr>
				<td>직급 : </td>
				<td>${member.position}</td>	
			</tr>
			<tr>
				<td>입사일 : </td>
				<td>${member.hired_date}</td>
			</tr>
				<tr>
				<td>아이디 : </td>
				<td>${member.id}</td>
			</tr>
			<tr>
				<td>비밀번호 : </td>
				<td><input type="password" value="${member.pw}" name="pw" id="pw"></td>	
			</tr>
			<tr>
				<td>비밀번호 확인 : </td>
				<td><input type="password" id="pwCheck"></td>	
			</tr>
			<tr>
				<td>이름 : </td>
				<td><input type="text" value="${member.name}" name="name" id="name"></td>	
			</tr>
			<tr>
				<td>생년월일 : </td>
				<td>${member.birth}</td>	
			</tr>
			<tr>
				<td>핸드폰 번호 : </td>
				<td>	
					<input type="text"  class="phone" value="010" disabled="disabled">&nbsp;-
					<input type="text" name="phone1" class="phone" id="phone1">&nbsp;-
					<input type="text" name="phone2" class="phone" id="phone2">
				</td>	
			</tr>
			<tr>
				<td>주소 : </td>
				<td>
					<input type="text" id="sample4_postcode" placeholder="우편번호" class="join_text">
					<input type="button" id="join_btn2" onclick="sample4_execDaumPostcode()" value="우편번호 찾기"><br>
					<span class="adr">도로명 주소 : </span>&nbsp;
					<input type="hidden" id="sample4_roadAddress1" value="${member.address1}"  name="address1"> 
					<input type="text" id="sample4_roadAddress2" placeholder="도로명주소" disabled="disabled" value="${member.address1}"><br>
					<span class="adr">지번 주소 : </span>&nbsp;&nbsp;&nbsp;&nbsp;
					<input type="hidden" id="sample4_jibunAddress1" name="address2" value="${member.address2}">
					<input type="text" id="sample4_jibunAddress2" placeholder="지번주소" disabled="disabled" value="${member.address2}">
					<span id="guide" style="color:#999"></span>
					
					<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
					<script>
					    //본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
					    function sample4_execDaumPostcode() {
					        new daum.Postcode({
					            oncomplete: function(data) {
					                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
					
					                // 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
					                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
					                var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
					                var extraRoadAddr = ''; // 도로명 조합형 주소 변수
					
					                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
					                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
					                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
					                    extraRoadAddr += data.bname;
					                }
					                // 건물명이 있고, 공동주택일 경우 추가한다.
					                if(data.buildingName !== '' && data.apartment === 'Y'){
					                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
					                }
					                // 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
					                if(extraRoadAddr !== ''){
					                    extraRoadAddr = ' (' + extraRoadAddr + ')';
					                }
					                // 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
					                if(fullRoadAddr !== ''){
					                    fullRoadAddr += extraRoadAddr;
					                }
					
					                // 우편번호와 주소 정보를 해당 필드에 넣는다.
					                document.getElementById('sample4_postcode').value = data.zonecode; //5자리 새우편번호 사용
					                document.getElementById('sample4_roadAddress1').value = fullRoadAddr;
					                document.getElementById('sample4_roadAddress2').value = fullRoadAddr;
					                document.getElementById('sample4_jibunAddress1').value = data.jibunAddress;
					                document.getElementById('sample4_jibunAddress2').value = data.jibunAddress;
							
					                // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
					                if(data.autoRoadAddress) {
					                    //예상되는 도로명 주소에 조합형 주소를 추가한다.
					                    var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
					                    document.getElementById('guide').innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
					
					                } else if(data.autoJibunAddress) {
					                    var expJibunAddr = data.autoJibunAddress;
					                    document.getElementById('guide').innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
					
					                } else {
					                    document.getElementById('guide').innerHTML = '';
					                }
					            }
					        }).open();
					    }
					</script>
				</td>	
			</tr>	
		</table>
		
		<input type="button" value="등록" id="modBtn">
		<a href="memberMod"><input type="button" value="다시쓰기" id="backBtn" ></a>
		
	</form>

</body>
</html>