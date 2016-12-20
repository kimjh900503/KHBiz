<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:if test="${memberList.size()== 0}">
	<p>초대할 멤버가 없습니다. 멤버를 다시 한번 검색해주세요</p>
</c:if>
<c:forEach items="${memberList}" var="member">
	<tr class="trList">
		<td class="mList"><img class="left" id="user"
			src="/erp/images/${member.pic}"> <span class="right name">${member.name}</span>
			<p class="mail name2"></p>
			<p class="mail department2">${member.department}</p>
			<p class="mail position2">${member.position}</p>
			<p class="mail id2">${member.id}</p>
			<p class="mail phone2">${member.phone}</p> 
			<input type="hidden" class="code" name="code" value="${member.code}" /></td>
	</tr>
</c:forEach>
<script src="https://code.jquery.com/jquery-latest.js"></script>

<script>
	var type = "${type}";
	if (type == 'name' || type=='') {
		$(".name2").css("display", "block");
		$(".department2").css("display", "none");
		$(".position2").css("display", "none");
		$(".id2").css("display", "none");
		$(".phone2").css("display", "none");
	} else if (type == 'department') {
		$(".name2").css("display", "none");
		$(".department2").css("display", "block");
		$(".position2").css("display", "none");
		$(".id2").css("display", "none");
		$(".phone2").css("display", "none");
	} else if (type == 'position') {
		$(".name2").css("display", "none");
		$(".department2").css("display", "none");
		$(".position2").css("display", "block");
		$(".id2").css("display", "none");
		$(".phone2").css("display", "none");
	} else if (type == 'id') {
		$(".name2").css("display", "none");
		$(".department2").css("display", "none");
		$(".position2").css("display", "none");
		$(".id2").css("display", "block");
		$(".phone2").css("display", "none");
	} else {
		$(".name2").css("display", "none");
		$(".department2").css("display", "none");
		$(".position2").css("display", "none");
		$(".id2").css("display", "none");
		$(".phone2").css("display", "block");
	}
	
	 //선택한 이름은 리스트에서 지워주기 
	$(".code").each(function(){
		var i = $(".code").index(this);
		var code = $(this).val();
		var codes = [];
		codes = "${codes}";
		if(codes != null){
			for(var j=0; j<codes.length; j++){
				if(code == codes[j]){
					$(".trList:eq("+i+")").remove();
				}
			}
		}
	});  
</script>