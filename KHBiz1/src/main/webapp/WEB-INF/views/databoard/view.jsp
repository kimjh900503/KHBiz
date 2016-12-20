<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
      <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script type="text/javascript">
$(function() {
	 $(".download").click(function(event){
         event.preventDefault();
         var index = $(".download").index(this);
         
         var fileName="";
         var i = 0;
         $(".saveName").each(function(){
           if(i==index){
              fileName = $(this).val();
           } 
           i++;
         });
         var url = "down?fileName="+fileName;
         $(location).attr('href',url); 
         });

  
});
function del() {
	$("#del").submit();
	
}
</script>
</head>
<body>

<div class="modal-header">
    <button type="button" class="close" data-dismiss="modal" aria-label="Close" aria-hidden="true">×</button>
    <h3 class="smaller lighter blue no-margin modal-title" style="text-align: center;">${board.title}</h3>
</div>

<div class="modal-body">
<table class="table">
		<tr>	
			<td style="width : 20%; background-color: #f2f2f2;font-weight: bold;">작성자</td>
			<td colspan="2">${board.writer}</td>
			<td style="width : 20%; background-color: #f2f2f2;font-weight: bold;">등록일</td>
			<td colspan="2">${board.reg_date}</td>
		</tr>	
		<tr>
			<td style="background-color: #f2f2f2;width : 20%;font-weight: bold;">첨부파일</td>
			<td colspan="4"><c:forEach items="${fileList}" var ="list">
				<a class="download" style="cursor:pointer">${list.originName}</a>
				<input type="hidden" value="${list.saveName}" class="saveName"/>
			</c:forEach></td>
		</tr>
		<tr>
			<td style="background-color: #f2f2f2;width : 20%;font-weight: bold;">내용</td>
			<td colspan="4">${board.contents}</td>
		</tr>
		<tr>
                                   				 <td colspan="5" class="divider"></td>
                                 			</tr>
	</table>           
	<div id="btn_area"></div>
	<div id="sheet"></div>
	<div id ="file_sheet"></div>
	</div>
 
<div class="modal-footer form-inline">
	<c:if test="${member.name == board.writer || member.position_Rank==1}">
	<form action="databoardDelete" method="post" id="del">
    <input type="hidden" name="num" value="${board.num}">
    <!-- <button class="btn btn-sm btn-default">삭제</button> -->
    </form>
    <span class="btn btn-sm btn-default">
        <a onclick="del()">삭제</a>
    </span>
    <%-- <span class="btn btn-sm btn-default">
        <a href="databoardDelete?num=${board.num}">삭제</a>
    </span> --%>
	<span class="btn btn-sm btn-info">
        <a href="databoardModForm?num=${board.num}">수정</a>
    </span>
    </c:if>
    <button class="btn btn-sm btn-default pull-right" data-dismiss="modal" id="btnClose">
        <i class="ace-icon fa fa-times"></i>닫기
    </button>
</div>

</body>
</html>