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
	$(document).ready(function(){
		var kind=$("#sheetKind").val();
		if (kind =="기안문") {
			$("#sheet").load("callGian?sheet_code=${reportFinView.sheet_code }");
			$("#file_sheet").load("callFile?sheet_code=${reportFinView.sheet_code}")
		} else if (kind == "지출서") {
			$("#sheet").load("callExpense?sheet_code=${reportFinView.sheet_code }");
			$("#file_sheet").load("callFile?sheet_code=${reportFinView.sheet_code}")
		} else if(kind=="휴가서") {
			$("#sheet").load("callLeave?sheet_code=${reportFinView.sheet_code }");
			$("#file_sheet").load("callFile?sheet_code=${reportFinView.sheet_code}")
		}

});
	
});
</script>
</head>
<body>

<div class="modal-header">
    <button type="button" class="close" data-dismiss="modal" aria-label="Close" aria-hidden="true">×</button>
    <h3 class="smaller lighter blue no-margin modal-title" style="text-align: center;">${reportFinView.title}<br><small>${reportFinView.sheet_code }</small></h3>
</div>

<div class="modal-body">
<input type="hidden" readonly="readonly" value="${reportFinView.sheet_kind }" id="sheetKind">
			<input type = "hidden" value="${reportFinView.d_num}">
<table class="table" style="text-align: center;">
		<tr>	
			<td colspan="1" style="width : 20%; background-color: #f2f2f2;font-weight: bold;">문서유형</td>
			<td colspan="5">${reportFinView.sheet_kind }</td>
		</tr>	
		<tr>
			<td style="background-color: #f2f2f2;width : 20%;font-weight: bold;">작성일</td>
			<td><fmt:formatDate value="${reportFinView.up_date}" pattern="yyyy-MM-dd" /></td>
			<td style="background-color: #f2f2f2; width : 20%;font-weight: bold;">결재 만료일</td>
			<td>${reportFinView.due_date}</td>
		</tr>
		<tr>
			<td style="background-color: #f2f2f2;font-weight: bold;">내용</td>
			<td colspan="5">${reportFinView.contents}</td>
		</tr>
			<tr>
                                    <td colspan ="6" class="divider"></td>
                                 </tr>
		</table>   
		</table>   
		<div id="btn_area"></div>
		<div id="sheet"></div>
			<div id ="file_sheet"></div>

</div>
 
<div class="modal-footer">

    <button class="btn btn-sm btn-default pull-right" data-dismiss="modal" id="btnClose">
        <i class="ace-icon fa fa-times"></i>닫기
    </button>
</div>

</body>
</html>