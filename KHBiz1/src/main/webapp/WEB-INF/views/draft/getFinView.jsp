<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

<div class="modal-header">
    <button type="button" class="close" data-dismiss="modal" aria-label="Close" aria-hidden="true">×</button>
    <h3 class="smaller lighter blue no-margin modal-title" style="text-align: center;">${getFinView.title}</h3>
</div>

<div class="modal-body">
<table>
			<tr>
			<td colspan="6" style = "text-align: center;">결재대기</td>
		</tr>
		<tr>	
			<input type = "hidden" value="${getFinView.d_num}">
			<td>문서번호</td>
			<td>${getFinView.sheet_code }</td>
			<td>문서유형</td>
			<td>${getFinView.sheet_kind }</td>
			<td>기안자</td>
			<td>${getFinView.name }</td>
		</tr>	
		<tr>
			<td>작성날짜</td>
			<td><fmt:formatDate value="${getFinView.up_date}" pattern="yyyy-MM-dd" /></td>
			<td>만료날짜</td>
			<td>${getFinView.due_date}</td>
			<td>나의 만료날짜</td>
			<td>${getFinView.due_per_date}</td>
		</tr>
		<tr>
			<td colspan="6" style = "text-align: center;">내용</td>
		</tr>
		<tr>
			<td colspan="6" style = "text-align: center;">${getFinView.contents}</td>
		</tr>
	</table>                
</div>
 
<div class="modal-footer">
    <span class="btn btn-sm btn-warning" id="testDel">
        <a href="outboxDelete?d_num=${getFinView.d_num}">반려</a><i class="ace-icon fa fa-arrow-right icon-on-right bigger-110"></i>
    </span>
    <span class="btn btn-sm btn-success" id="testSave">
        결재 완료<i class="ace-icon fa fa-arrow-right icon-on-right bigger-110"></i>
    </span>
    <button class="btn btn-sm btn-danger pull-right" data-dismiss="modal" id="btnClose">
        <i class="ace-icon fa fa-times"></i>닫기
    </button>
</div>

</body>
</html>