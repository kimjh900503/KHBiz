<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

<div class="modal-header">
    <button type="button" class="close" data-dismiss="modal" aria-label="Close" aria-hidden="true">×</button>
    <h3 class="smaller lighter blue no-margin modal-title" style="text-align: center;">${reportboxView.title}</h3>
</div>
 
<div class="modal-body">
<table>
			<tr>
			<td colspan="6" style = "text-align: center;">상신함</td>
		</tr>
		<tr>	
			<input type = "hidden" value="${reportboxView.d_num}">
			<td>문서번호</td>
			<td>${reportboxView.sheet_code }</td>
			<td>문서유형</td>
			<td>${reportboxView.sheet_kind }</td>
			<td>이름(우선코드)</td>
			<td>${reportboxView.code }</td>
		</tr>	

		<tr>
			<td>내용</td>
			<td>${reportboxView.contents}</td>
		</tr>
		<tr>
			<td>작성날짜</td>
			<td>${reportboxView.up_date}</td>
			<td>만료날짜</td>
			<td>${reportboxView.due_date}</td>
		</tr>
	</table>                
</div>
 
<div class="modal-footer">
    <span class="btn btn-sm btn-warning" id="testDel">
        <a href="reportboxDelete?d_num=${reportboxView.d_num}">삭제</a><i class="ace-icon fa fa-arrow-right icon-on-right bigger-110"></i>
    </span>
    <button class="btn btn-sm btn-danger pull-right" data-dismiss="modal" id="btnClose">
        <i class="ace-icon fa fa-times"></i>닫기
    </button>
</div>

</body>
</html>