<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<div class="modal-header">
    <button type="button" class="close" data-dismiss="modal" aria-label="Close" aria-hidden="true">×</button>
    <h3 class="smaller lighter blue no-margin modal-title" style="text-align: center;">${getWaitView.title}</h3>
</div>
                           
<div class="modal-body">
<table>
			<tr>
			<td colspan="6" style = "text-align: center;">결재대기</td>
		</tr>
		<tr>	
			<input type = "hidden" value="${getWaitView.d_num}">
			<td>문서번호</td>
			<td>${getWaitView.sheet_code }</td>
			<td>문서유형</td>
			<td>${getWaitView.sheet_kind }</td>
			<td>기안자</td>
			<td>${getWaitView.name }</td>
		</tr>	
		<tr>
			<td>작성날짜</td>
			<td><fmt:formatDate value="${getWaitView.up_date}" pattern="yyyy-MM-dd" /></td>
			<td>만료날짜</td>
			<td>${getWaitView.due_date}</td>
			<td>나의 만료날짜</td>
			<td>${getWaitView.due_per_date}</td>
		</tr>
		<tr>
			<td colspan="6" style = "text-align: center;">내용</td>
		</tr>
		<tr>
			<td colspan="6" style = "text-align: center;">${getWaitView.contents}</td>
		</tr>
	</table>                
</div>
 
<div class="modal-footer">
    <span class="btn btn-sm btn-warning" id="testDel">
        <a href="outboxDelete?d_num=${getWaitView.d_num}">반려</a><i class="ace-icon fa fa-arrow-right icon-on-right bigger-110"></i>
    </span>
    <span class="btn btn-sm btn-success" id="testSave">
        결재 완료<i class="ace-icon fa fa-arrow-right icon-on-right bigger-110"></i>
    </span>
    <button class="btn btn-sm btn-danger pull-right" data-dismiss="modal" id="btnClose">
        <i class="ace-icon fa fa-times"></i>닫기
    </button>
</div>
