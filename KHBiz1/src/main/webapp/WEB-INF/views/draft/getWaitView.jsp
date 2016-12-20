<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
          <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript">
$(function() {
	$(document).ready(function(){
		var kind=$("#sheetKind").val();
		if (kind =="기안문") {
			$("#sheet").load("callGian?sheet_code=${getWaitView.sheet_code }");
			$("#file_sheet").load("callFile?sheet_code=${getWaitView.sheet_code}")
		} else if (kind == "지출서") {
			$("#sheet").load("callExpense?sheet_code=${getWaitView.sheet_code }");
			$("#file_sheet").load("callFile?sheet_code=${getWaitView.sheet_code}")
		} else if(kind=="휴가서") {
			$("#sheet").load("callLeave?sheet_code=${getWaitView.sheet_code }");
			$("#file_sheet").load("callFile?sheet_code=${getWaitView.sheet_code}")
		}

});
	
});
</script>
<div class="modal-header">
    <button type="button" class="close" data-dismiss="modal" aria-label="Close" aria-hidden="true">×</button>
    <h3 class="smaller lighter blue no-margin modal-title" style="text-align: center;">${getWaitView.title}<br>   <small>${getWaitView.sheet_code }</small></h3>
</div>
                           
<div class="modal-body">
			<input type = "hidden" value="${getWaitView.d_num}">
			<input type="hidden" readonly="readonly" value="${getWaitView.sheet_kind }" id="sheetKind">
<table class="table" style="text-align: center;">
		<tr>	
			<td  style="width : 20%; background-color: #f2f2f2;font-weight: bold;">문서유형</td>
			<td colspan="2">${getWaitView.sheet_kind }</td>
			<td style="width : 20%; background-color: #f2f2f2;font-weight: bold;">기안자</td>
			<td colspan="2">${getWaitView.name }</td>
		</tr>	
		<tr>
			<td style="background-color: #f2f2f2;width : 20%;font-weight: bold;">상신일</td>
			<td  colspan="2"><fmt:formatDate value="${getWaitView.up_date}" pattern="yyyy-MM-dd" /></td>
			<td style="background-color: #f2f2f2;width : 20%;font-weight: bold;">결재 만료일</td>
			<td  colspan="2">${getWaitView.due_per_date}</td>
		</tr>
		<tr>
			<td style="background-color: #f2f2f2;width : 20%;font-weight: bold;">내용</td>
			<td colspan="4">${getWaitView.contents}</td>
		</tr>
				<tr>
                                   				 <td colspan="5" class="divider"></td>
                                 			</tr>
	</table>         
		<div id="btn_area"></div>
	<div id="sheet"></div>     
	<div id ="file_sheet"></div>
 </div>
<div class="modal-footer">
    <span class="btn btn-sm btn-danger" id="testDel">
        <a href="back?code2=${member.code}&sheet_code=${getWaitView.sheet_code}">반려</a><!-- <i class="ace-icon fa fa-arrow-right icon-on-right bigger-110"></i> -->
    </span>
    <span class="btn btn-sm btn-info" id="testSave">
        <a href="approval?code2=${member.code}&sheet_code=${getWaitView.sheet_code}">결재 하기</a><!-- <i class="ace-icon fa fa-arrow-right icon-on-right bigger-110"></i> -->
    </span>
    <button class="btn btn-sm btn-default pull-right" data-dismiss="modal" id="btnClose">
        <i class="ace-icon fa fa-times"></i>닫기
    </button>
</div>
