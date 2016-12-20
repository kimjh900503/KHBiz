<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta
	content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0'
	name='viewport' />
<meta name="viewport" content="width=device-width" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>KHBiz_Drafting</title>
<!-- Favicon -->
<link rel="shortcut icon" href="/erp/images/favicon.ico">
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<!-- jQuery library -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>

<!-- Latest compiled JavaScript -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<!--  Checkbox, Radio & Switch Plugins -->
<script src="/erp/js/bootstrap-checkbox-radio-switch.js"></script>
<script src='/erp/js/datepicker.js'></script>
<!--  Charts Plugin -->
<script src="/erp/js/chartist.min.js"></script>

<!--  Notifications Plugin    -->
<script src="/erp/js/bootstrap-notify.js"></script>

<!-- Light Bootstrap Table Core javascript and methods for Demo purpose -->
<script src="/erp/js/light-bootstrap-dashboard.js"></script>

<script type="text/javascript">
$(document).ready(function() {
   $('#sheet_title').html('기안문');
   $("#sheet").load("gianForm");
   $("#app_list").load("approverList");
   $("#btn").click(function() {
      $('#sheet_form').removeClass('hidden');
      var kind = $("#sheet_kind").val();
      if (kind == "기안문") {
         $('#sheet_title').html('기안문');
         $("#sheet").load("gianForm");
      } else if (kind == "지출서") {
         $('#sheet_title').html('지출서');
         $("#sheet").load("expenseForm");
      } else {
         $('#sheet_title').html('휴가 신청서');
         $("#sheet").load("leaveForm");
      }
   });
      
      
           


                var j = 1;
               $("#app_btn").click(function() {
                var i=0;
						j=1;
            	   $('#appro').removeClass('hidden');
              	var result='<table class="table table-striped"><tr><td>사원번호</td><td>부서</td><td>직책</td><td>이름</td><td>순위</td><td>개인마감일</td></tr>';
                  $(".app_ch").each(function() {
                  if ($(this).prop("checked")) {
                     var cla = $(this).attr("id");
                        result = result+ "<tr>";
                        
                        i++;
                        j++;
                        var count=0;
                        
                        $("." + cla).each(function() {
                        	if(count==0){
    							result=result+'<td  class="col-md-2"><input type ="text" name="code2" readonly="readonly" value="'+$(this).text()+'"></td>';
    						}else {
    							result=result+'<td class="col-md-2"><input type ="text" name="tab" readonly="readonly" value="'+$(this).text()+'"></td>';
    						}
    							count++;
                        });
	    					result=result+'<td class="col-md-2"><select id="ranking'+i+'" name="ranking" class="ranking form-control"></select></td><td class="col-md-2"><input type = "date" class = "due_per_date form-control" id="due_per_date'+i+'" name="due_per_date"></td>';
	    					result=result+"</tr>";     
			             }
			             });
                  
			                result = result + "</table>"
			             	$("#selectList").html(result);
			                for(var l=1;l<j;l++){
			                    var sum = '<option class="ranking" value="0">순위</option>';
			                    for(var k=1;k<j;k++){
			                  	sum = sum + '<option class="ranking" value="'+k+'">';
			                		sum = sum + k + '</option>';
			                    }
			                		$("#ranking"+l).html(sum);
			                    }
               });
  
								var now = new Date();
			               $("#selectList").on("change",".due_per_date",function(){
			                		
			   					for(var i =1;i<j;i++){
			   					
			            		var select = new Date($('#due_per_date'+i).val());
			   						if($('#ranking'+i).val()==1 && select!=''){
					            	   		if (select.toYmdDateString() < now.toYmdDateString()) {
					            				swal("에러", "지나간 날짜 입니다.", "error");
					            				$('#due_per_date'+i).val('');
					            			}
				            	   	}else if($('#ranking'+i).val()!=1 && select!=''){
				            	   		for(var k=1;k<j;k++){
				            	   			if($('#ranking'+i).val()-1==$('#ranking'+k).val()){
				            	   				var past = new Date($('#due_per_date'+k).val());
				            	   				if (select.toYmdDateString() < past.toYmdDateString()) {
						            				swal("에러", "날짜 선택 오류입니다. 다시 선택해 주세요.", "error");
						            				$('#due_per_date'+i).val('');
						            			}
				            	   			}
				            	   		}
				            	   	}
			            	   
			   					}//for 
			               });
			               $("#selectList").on("change",".ranking",function(){
			            	   var select = $(this).val();
			            	   if(select !=0){
			            		   var t=0
			            		   for(var i =1;i<j;i++){
			            			   if($('#ranking'+i).val()==select){
			            				  t++; 
			            			   }
			            		   }
			            		   if(t==2){
			            			   swal("에러", "중복 순위입니다.", "error");
			            			   $(this).val("0").attr("selected", "selected");
			            		   }
			            	   }
			               });
			               
			             //최종 마감일
			                           $("#due_date").on("blur",".due_date",function(){
			                        		var i = j-1;
			    			       			var select = new Date($('#due_per_date'+i).val());
			    			       			var end = new Date($('#due_date').val());
			    			       			if (select == '') {
			    			       				$('#due_date').val('');
			    			       				swal("에러", "최종 결재자 마감일부터 입력해주세요", "error");
			    			       			}
			    			       			if (select.toYmdDateString() > end.toYmdDateString()) {
			    			       				$('#due_date').val('');
			    			       				swal("에러", "마감일은 최종 결재자 마감일 이후여야합니다", "error");
			    			       			}
			    			       		});   
			     /*   		$('#due_date').change(function() {
			       			var i = j-1;
			       			var select = new Date($('#due_per_date'+i).val());
			       			var end = new Date($('#due_date').val());
			       			if (select == '') {
			       				$('#due_date').val('');
			       				swal("에러", "최종 결재자 마감일부터 입력해주세요", "error");
			       			}
			       			if (select.toYmdDateString() > end.toYmdDateString()) {
			       				$('#due_date').val('');
			       				swal("에러", "마감일은 최종 결재자 마감일 이후여야합니다", "error");
			       			}
			       		});   */ 
           	//************************************************************
       		
   			// 빈칸 체크 - > 폼 보내기 
   			
   				$("#btn2").click(function(){
   				 var title = $("#title").val();
   				 var contents=$("#contents").val();
   				 var due_date=$("#due_date").val();
   				 var due_per_date = $(".due_per_date").val();
   				 var ranking = $(".ranking").val();
   				 var check = true;
   				
   				 $(".due_per_date").each(function() {
   							 if($(this).val()==''){
   								 alert("개인 마감 날짜를 입력하세요");
   								 	check=false;
   							 }					
   						});
   				
   				 $(".ranking").each(function() {
   					 if($(this).val()==''){
   						 alert("결재 순위를 입력하세요");
   						 check=false;	
   					 }					
   				});
   				 
   				 if(title==''){
   					 alert("제목을 입력하세요");
   					 $("#title").focus();
   					 check=false;
   				 }
   				 if(contents==''){
   					 alert("내용을 입력하세요");
   					 $("#contents").focus();
   					 check=false;
   				 }
   				 if(due_date==''){
   					 alert("결재 마감 날짜를 입력하세요");
   					 $("#due_date").focus();
   					 check=false;	
   				 }
   				 
   					if(check){
   						var kind = $("#sheet_kind").val();
   						

   						if (kind == "기안문") {
   							$("#go_form").attr("action", "gian");
   						} else if (kind == "지출서") {
   							$("#go_form").attr("action", "expense");
   						} else {
   							$("#go_form").attr("action", "leave");
   						}

   						$("#go_form").submit();
   					}
   					
   					
   			 });
               
               $("#fileAdd").click(addFileForm);
               $(document).on('click','.')
            });
 var rowIndex = 1;
  
    function addFile(form){
        if(rowIndex > 4) return false;

        rowIndex++;
        var getTable = document.getElementById("insertTable");
   var oCurrentRow = getTable.insertRow(getTable.rows.length);
        var oCurrentCell = oCurrentRow.insertCell(0);
        oCurrentCell.innerHTML = "<tr><td colspan=2><INPUT TYPE='FILE' NAME='files'  size='1048576000000'></td></tr>";
    }
   
   //첨부파일 삭제
    function deleteFile(form){
        if(rowIndex<2){
            return false;
        }else{
           rowIndex--;
         var getTable = document.getElementById("insertTable");
         getTable.deleteRow(rowIndex);
       }

    }
</script>
</script>
<!-- Bootstrap core CSS     -->
<link href="/erp/css/dashboard/bootstrap.min.css" rel="stylesheet" />

<!-- Animation library for notifications   -->
<link href="/erp/css/dashboard/animate.min.css" rel="stylesheet" />

<!--  Light Bootstrap Table core CSS    -->
<link href="/erp/css/dashboard/light-bootstrap-dashboard.css"
	rel="stylesheet" />
<!--     Fonts and icons     -->
<link
	href="http://maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css"
	rel="stylesheet">
<link href='http://fonts.googleapis.com/css?family=Roboto:400,700,300'
	rel='stylesheet' type='text/css'>
<link href="/erp/css/dashboard/pe-icon-7-stroke.css" rel="stylesheet" />
<!-- alert -->
<script src="/erp/js/sweetalert.min.js"></script>
<link rel="stylesheet" type="text/css" href="/erp/css/sweetalert.css">
<link rel="stylesheet" type="text/css" href="/erp/css/dashboard.css">
<!-- scheduler -->
<link href='/erp/css/fullcalendar.css' rel='stylesheet' />
<link href='/erp/css/fullcalendar.print.css' rel='stylesheet'
	media='print' />
<script src='/erp/js/moment.min.js'></script>
<script src='/erp/js/fullcalendar.min.js'></script>
<script src='/erp/js/datepicker.js'></script>

</head>
<body>
	<div class="wrapper">
		<div class="sidebar" data-color="azure"
			data-image="/erp/images/sidebar-5.jpg">

			<!--
        Tip 1: you can change the color of the sidebar using: data-color="blue | azure | green | orange | red | purple"
        Tip 2: you can also add an image using data-image tag
    -->

			<div class="sidebar-wrapper">
				<div class="logo">
					<a href="/erp/dash" class="simple-text"><img alt="khbiz_log"
						src="/erp/images/khbiz.png" style="width: 60%;"></a>
				</div>

				<ul class="nav side-navi">
					<li><a href="/erp/dash"> <i
							class="pe-7s-graph"></i>
							<p>Dashboard</p>
					</a></li>
					<c:if test="${member.department=='인사팀' }">
						<li><a href="/erp/attendmanage/attendmanage"> <i
								class="pe-7s-user"></i>
								<p>근태관리</p>
						</a></li>
					</c:if>
					<li class="active"><a> <i class="pe-7s-mail-open-file"></i>
							<p>
								전자결재<span class="sub-arrow"></span>
							</p>
					</a>
						<ul>
							<li class="active"><a href="/erp/draft/draftWriteForm"><p>문서작성</p></a></li>
							<li><a href="/erp/draft/draft_main"><p>보낸 결재함</p></a></li>
							<li><a href="/erp/draft/draft_main2"><p>받은 결재함</p></a></li>
						</ul></li>
					<li><a onclick="window.open('/erp/chat')"> <i class="pe-7s-news-paper"></i>
							<p>메신저</p>
					</a></li>
					<li><a href="/erp/schedule/scheduler"> <i
							class="pe-7s-note2"></i>
							<p>일정관리</p>
					</a></li>
					<li><a href="/erp/member/memberContactList"> <i
							class="pe-7s-users"></i>
							<p>주소록</p>
					</a></li>
					<li><a href="/erp/databoardList"> <i
							class="pe-7s-drawer"></i>
							<p>자료실</p>
					</a></li>
					<c:if test="${member.department=='인사팀' && member.position_Rank<3 || member.position_Rank==1}">
					<li><a href="/erp/member/memberOriginList"> <i
							class="pe-7s-users"></i>
							<p>사원관리</p>
					</a></li>					
					</c:if>
				</ul>
			</div>
		</div>

		<div class="main-panel">
			<nav class="navbar navbar-default navbar-fixed">
				<div class="container-fluid">
					<div class="navbar-header">
						<button type="button" class="navbar-toggle" data-toggle="collapse"
							data-target="#navigation-example-2">
							<span class="sr-only">Toggle navigation</span> <span
								class="icon-bar"></span> <span class="icon-bar"></span> <span
								class="icon-bar"></span>
						</button>
						<a class="navbar-brand" href="/erp/draft/draftWriteForm">문서작성</a>
					</div>
					<div class="collapse navbar-collapse">
						<ul class="nav navbar-nav navbar-left">
							<li class="dropdown"><a href="#" class="dropdown-toggle"
								data-toggle="dropdown"> <i class="fa fa-globe"></i> <b
									class="caret"></b> <span class="notification">${getDueList.size()+reportDueList.size()}</span>
							</a>
								<ul class="dropdown-menu">
									<c:forEach items="${getDueList}" var="get">
										<li><a href="/erp/draft/getWaitList">${get.title }</a></li>
									</c:forEach>
									<li class="divider"></li>
									<c:forEach items="${reportDueList}" var="report">
										<li><a href="/erp/draft/reportWaitList">${report.title }</a></li>
									</c:forEach>
								</ul></li>
						</ul>

						<ul class="nav navbar-nav navbar-right">
							<li><a href="/erp/member/memberView">${member.name}님</a></li>
							<li><a href="/erp/member/memberView"> 정보 보기 </a></li>
							<li><a href="/erp/member/memberLogout"> Log out </a></li>
						</ul>
					</div>
				</div>
			</nav>


			<div class="content">
				<form id="go_form" method="post" enctype="multipart/form-data">
					<div class="container-fluid">
						<div class="row">
							<div class="col-md-12">
								<div class="card ">
									<div class="header">
										<h4 class="title">결재자선택</h4>
										<p class="category"></p>
									</div>
									<div class="content">

										<div id="app_list" class="table-full-width"></div>

										<div class="footer">
											<div class="legend right">
												<input type="button" id="app_btn" value="선택 완료"
													class="btn btn-info">
											</div>
											<hr>
											<div class="stats">
											</div>

										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="row hidden" id="appro">
							<div class="col-md-12">
								<div class="card ">
									<div class="header">
										<h4 class="title">결재 순서</h4>
										<p class="category"></p>
									</div>
									<div class="content">
										<div id="selectList" class="table-full-width"></div>
										<div class="footer">
											<div class="text-right"></div>
											<hr>
											<div class="stats">
												<i class="fa fa-check"></i>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="row">
							<div class="col-md-6">
								<div class="card">
									<div class="header">
										<h4 class="title">기안서</h4>
										<p class="category"></p>
									</div>
									<div class="content">

										<input type="hidden" name="code" value="${member.code }"
											readonly="readonly">
										<div class="form-group has-feedback text-left">
											<p>제목</p>
											<input type="text" id="tiitle" name="title" class="form-control">
										</div>
										<div class="form-group has-feedback text-left">
											<p>내용</p>
											<textarea rows="3" name="contents" id="contents" class="form-control"></textarea>
										</div>
										<div class="form-group has-feedback text-left">
											<!-- 마감 날짜<br><input type = "date" name="due_date"><br> -->
											<p>결재 마감 날짜</p>
											<input type="date" id="due_date" name="due_date" class="form-control"><br>
										</div>

										<p>문서 선택</p>
										<div
											class="form-group has-feedback text-left input-group form-inline">
											<select name="sheet_kind" id="sheet_kind"
												class="form-control">
												<option value="기안문">기안문</option>
												<option value="지출서">지출서</option>
												<option value="휴가서">휴가신청서</option>
											</select> <span class="input-group-btn"> <input type="button"
												id="btn" value="문서선택" class="btn btn-info page-scroll">
											</span>
										</div>
										<p>첨부 파일</p>
										<table id='insertTable' class="table">
        <tr>
        	<td>
        		<input type="button" value="파일 추가" onClick="addFile(this.form)"class="btn btn-default">
        		<input type="button" value="삭제" onClick='deleteFile(this.form)'class="btn btn-default">
        	</td>
        </tr>
        <tr>
        	<td>
        		<INPUT type='file' maxLength='100' name='files' size='1048576000000'>
        	</td>
        </tr>
    </table>
    <input type="hidden" name="rowCount" value="1">
										<div class="footer">
											<div class="legend col-md-offset-9">
												<!-- <input type="button" value="결재자 선택" id="ap_btn" class="btn btn-info"> -->
												<input type="button" id="btn2" value="상신" class="btn btn-info">
											</div>
											<hr>
											<div class="stats">
												<i class="fa fa-history"></i>
											</div>
										</div>
									</div>
								</div>
							</div>
							<div class="col-md-6">
								<div class="card ">
									<div class="header">
										<h4 class="title" id="sheet_title">결재문서</h4>
										<p class="category"></p>
									</div>
									<div class="content">
										<div id="sheet" class="table-full-width"></div>
									</div>
									<div class="footer"></div>
								</div>
							</div>
						</div>

					</div>
				</form>
			</div>
			<footer class="footer" id="document_foot">
				<div class="container-fluid">
					<nav class="pull-left">
						<ul>
							<li><a href="/erp/home"> Home </a></li>
							<li><a href="#"> Company </a></li>
						</ul>
					</nav>
					<p class="pull-right">
						<!-- <a href="http://www.creative-tim.com">Creative Tim</a> -->
						&copy; 2016 <a href="/erp/home">2ㄱㄹㅇ</a>, made with love for a
						better web
					</p>
				</div>
			</footer>

		</div>
	</div>
	<div id="fullCalModal" class="modal fade">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">
						<span aria-hidden="true">×</span> <span class="sr-only"></span>
					</button>
					<h4 id="modalTitle" class="modal-title"></h4>
				</div>
				<div id="modalBody" class="modal-body"></div>
				<div class="modal-footer">
					<button class="btn btn-default" id="del_btn">
						<a id="del">삭제</a>
					</button>
					<button class="btn btn-default">
						<a id="modi">수정</a>
					</button>
					<button type="button" class="btn btn-info" data-dismiss="modal"
						id="clo">닫기</button>
				</div>
			</div>
		</div>
	</div>
</body>
</html>