<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- 부트스트랩 -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<!-- jquery CDN -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<title>Insert title here</title>
<style>
    /* outer영역 */
    .workingOuter{
        padding:50px;
        margin:auto;
    }
    /* content영역 */
    .select-area{
    	margin-top: 30px;
    	font-size: 14px;
        color:rgb(50,50,50);
    }
    .select-area input[type=date]{
        width:110px;
        height:30px;
        border:1px solid rgb(170, 170, 170);
        border-radius: 5px;
        font-size: 14px;
        color:rgb(50, 50, 50);
    }
    .select-area button{
        width:60px;
        height:30px;
        font-size: 12px;
        line-height:5px;
        margin-bottom: 3px;
    }
    .businesstripTable, .overtimeTable{
        width:100%;
        border-top:1px solid rgb(234, 234, 234);
        text-align: center;
        font-size: 14px;
        color:rgb(50,50,50);
        border-top:1px solid rgb(234, 234, 234);
    }
    .businesstripTable td, .overTable td{
        border-bottom: 1px solid rgb(234, 234, 234);
        color:rgb(50, 50, 50);
        height:30px;
    }
    .paging-area button{
        width:30px;
        height:30px;
        border:none;
        border-radius: 5px;
    }
    .businesstripTable tbody input[type=text]{
        width:100px;
        height:20px;
        text-align: center;
        border:none;
    }
    .overtimeTable tbody input[type=text]{
    	width:60px;
        height:20px;
        text-align: center;
        border:none;
    }
    .businesstripList, .overtimeList{
        height:350px;
    }
    .businesstripTable button, .overtimeTable button{
        width:50px;
        height:25px;
        font-size: 11px;
        line-height:5px;
        color:white;
    }
    .businesstripList tbody>tr:hover, .overtimeTable tbody>tr:hover{
    	opacity:0.7;
    	cursor:pointer;
    }
    #bpagingArea, #opagingArea{
    	width:fit-content;
    	margin:auto;
    }
	input[type=text]{
        width:100px;
        height:30px;
        border: 1px solid rgb(170, 170, 170);
        border-radius: 5px;
        text-align: center; 
    }
	input[type=text]::placeholder{
		font-size: 12px;
	}
	/* modal영역 */
    .modal-content{
        font-size: 14px;
        border:1px solid red;
        margin:auto;
        height:550px;
    }
    .modal-body input{
        border:1px solid rgb(170, 170, 170);
        border-radius: 5px;
    }
    .modalS{
        display: inline-block;
        margin-bottom: 10px;
    }
    .btextarea{
        resize: none;
        width:300px;
        height:260px;
        border:1px solid rgb(170, 170, 170);
        border-radius: 5px;
        padding:10px;
    }
	.otextarea{
        resize: none;
        width:300px;
        height:200px;
        border:1px solid rgb(170, 170, 170);
        border-radius: 5px;
        padding:10px;
    }
    .textWrap{
        margin-left: 230px;
        margin-bottom: 5px;
        font-size: 13px;
        font-weight: 600;
        color:rgb(50,50,50)
    }
</style>
</head>
<body>

	<jsp:include page="../common/menubar.jsp" />

	<div class="workingOuter">

		<h4><b>신청</b></h4>
		
		<div class="select-area" style="float: right">
			<input type="text" name="startDate" id="datepicker1" value="" placeholder="기간검색(시작일)"> 
			<span style="font-size: 20px; color: rgb(170, 170, 170)">~</span> 
			<input type="text" name="endDate" id="datepicker2" value="" placeholder="기간검색(종료일)">
			<button type="button" class="btn btn-success" onclick="">검색</button>
		</div>

		<!-- datepicker -->
        <link rel="stylesheet" href="http://code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css"/>
        <script src="http://code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script>
        <script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/i18n/datepicker-ko.js"></script>
        <script>	
                    
        $(function(){
        	
            
            $("#datepicker1").datepicker({
                changeMonth: true, 
                changeYear: true,
                minDate: '0',
                nextText: '다음 달',
                prevText: '이전 달',
                yearRange: 'c-50:c+20',
                showButtonPanel: true, 
                currentText: '오늘 날짜',
                closeText: '닫기',
                dateFormat: "yy-mm-dd",
                showAnim: "slide",
                showMonthAfterYear: true, 
                dayNamesMin: ['월', '화', '수', '목', '금', '토', '일'],
                monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'], 
                onSelect: function(selected){
                	$("#datepicker2").datepicker("option", "minDate", selected);
                }
            });	
            
            $("#datepicker2").datepicker({
                changeMonth: true, 
                changeYear: true,
                minDate: '0',
                nextText: '다음 달',
                prevText: '이전 달',
                yearRange: 'c-50:c+20',
                showButtonPanel: true, 
                currentText: '오늘 날짜',
                closeText: '닫기',
                dateFormat: "yy-mm-dd",
                showAnim: "slide",
                showMonthAfterYear: true, 
                dayNamesMin: ['월', '화', '수', '목', '금', '토', '일'],
                monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'], 
                onSelect: function(selected){
                	$("#datepicker1").datepicker("option", "maxDate", selected);
                }
            });	
            
            
            
        });
        
        </script>   

        <!-- 에러 해결 시작 - 홈짱 -->
        <script>

            jQuery.browser = {};
            
            (function () {
            
                jQuery.browser.msie = false;
            
                jQuery.browser.version = 0;
            
                if (navigator.userAgent.match(/MSIE ([0-9]+)\./)) {
            
                    jQuery.browser.msie = true;
            
                    jQuery.browser.version = RegExp.$1;
            
                }
            
            })();
            
            </script>
            <!-- 에러 해결 종료 - 홈짱 -->

		<br>
		<br>
		<div class="businesstripList">
			<span style="font-size: 15px; font-weight: 600;">출장신청</span> 
			<input type="text" name="" value="" id="bCount" style="font-size: 15px; color: rgb(0, 172, 0); font-weight: 600; border: none; text-align: left;">
			<br>
			<br>
			<table class="businesstripTable">
				<thead>
					<tr style="font-weight: 600; height: 30px; background-color: rgba(0, 172, 0, 0.219);">
						<td width="60px;">No.</td>
						<td width="110px">이름</td>
						<td width="110px;">부서명</td>
						<td width="110px;">신청종류</td>
						<td width="300px;">일자</td>
						<td width="150px;">결재현황</td>
						<td width="70"></td>
					</tr>
				</thead>
				<tbody>
					
				</tbody>
			</table>
			
			<br>
			<br>

			<div id="bpagingArea">
				<ul class="pagination bpagination">
				
				</ul>
			</div>

		</div>

		<br>
		<br>

		<div class="overtimeList">
			<span style="font-size: 15px; font-weight: 600;">시간외 근무신청</span> 
			<input type="text" name="" value="" id="oCount" style="font-size: 15px; color: rgb(0, 172, 0); font-weight: 600; border: none; text-align: left;">
			<br>
			<br>
			<table class="overtimeTable">
				<thead>
					<tr style="font-weight: 600; height: 30px; background-color: rgba(0, 172, 0, 0.219);">
						<td width="60px;">No.</td>
						<td width="110px">이름</td>
						<td width="110px;">부서명</td>
						<td width="110px;">신청종류</td>
						<td width="110px;">일자</td>
						<td width="180px;">시간</td>
						<td width="150px;">결재현황</td>
						<td width="70"></td>
					</tr>
				</thead>
				<tbody>
					
				</tbody>
			</table>

			<br>
			<br>

			<div id="opagingArea">
				<ul class="pagination opagination">
				
				</ul>
			</div>

		</div>

		<script>
	            $(function(){
	            	
	            	businesstripList(1);
	            	
	            	overtimeList(1);
	            });
	            
				// 출장전체조회
	            function businesstripList(page){
	            	$.ajax({
	            		url:"list.bt",
	            		type:"POST",
	            		dataType:"json",
	            		data:{
	            			empNo : ${e.empNo},
	            			bpage : page
	            		},
	            		success:function(bmap){
	            			//console.log(bmap.bPi.currentPage);
	            			
	            			// count
	            			$("#bCount").attr('value', bmap.bListCount);
	            			
	            			// tbody
	            			let value = "";
	            			for(var i=0; i<bmap.bList.length; i++){
	            				value += "<tr onclick='btDetail(" + bmap.bList[i].btNo +");'>"
										+ "<td>" + bmap.bList[i].btNo + "</td>"
	            				        + "<td>" + bmap.bList[i].empName + "</td>"
	            				        + "<td>" + bmap.bList[i].deptName + "</td>"
	            				        + "<td>출장</td>"
	            				        + "<td><input type='text' name='btStart' value='" + bmap.bList[i].btStart + "' readonly><span style='font-size: 15px; font-weight: 600;'>~</span><input type='text' name='btEnd' value='" + bmap.bList[i].btEnd + "' readonly></td>"
	            				        + "<td>" + bmap.bList[i].btCheck + "</td>"
	            				        + "<td><button class='btn btn-warning' onclick='deleteBusinesstrip(" + bmap.bList[i].btNo +");'>취소</button></td>"
	            				       + "</tr>";
	            				       
	            				$(".businesstripTable tbody").html(value);
	            			};
	            			
	            			// 페이징바 만들때 해당 페이지숫자 클릭시 => businessTripList(클릭한숫자);
	            			let page = "";
	            			if(bmap.bPi.currentPage == 1){
	            				page += "<li class='page-item' disabled><a class='page-link' href='#'><</a></li>"
	            			}else{
	            				page += "<li class='page-item'><a class='page-link' onclick='businesstripList(" + (bmap.bPi.currentPage-1) + ");'><</a></li>"
	            			}
	            			
	            			for(var b=bmap.bPi.startPage; b<=bmap.bPi.endPage; b++){
	            			
	            				page += "<li class='page-item'><a class='page-link' onclick='businesstripList(" + b + ");'>" + b + "</a></li>"
	            			}
	            			
	            			if(bmap.bPi.currentPage == bmap.bPi.maxPage){
	            				page += "<li class='page-item' disabled><a class='page-link' href='#'>></a></li>"
	            			}else{
	            				page += "<li class='page-item'><a class='page-link' onclick='businesstripList(" + (bmap.bPi.currentPage+1) + ");'>></a></li>"
	            			}
	            			
	            			$(".bpagination").html(page);
	            			
	            		},
	            		error:function(){
	            			console.log("출장신청 ajax통신 실패");
	            		}
	            	});
	            };

				// 출장 상세조회 ajax
				function btDetail(btNo){
					$.ajax({
							url:"detail.bt",
							type:"POST",
							dataType:"json",
							data:{
								btNo : btNo
							},
							success:function(b){
								console.log(b.btNo);
								//console.log(result);
								$(".modal-body input[name=btStart]").val(b.btStart);
								$(".modal-body input[name=btEnd]").val(b.btEnd);
								$(".btextarea").text(b.btContent);
								$(".btextCount").text(b.btContent.length + '자');
								$("#businesstripModal").modal('show');
							},
							error:function(){
								console.log("출장상세조회 ajax통신 실패");
							}
						});
				}
	            
				// 시간외근무전체조회 ajax
	            function overtimeList(page){
	            	$.ajax({
	            		url:"list.ot",
	            		type:"POST",
	            		dataType:"json",
	            		data:{
	            			empNo : ${e.empNo},
	            			opage : page
	            		},
	            		success:function(omap){
	            			//console.log(omap);
	            			
	            			// count
	            			$("#oCount").attr('value', omap.oListCount);
	            			
	            			// tbody
	            			let value = "";
	            			for(var i=0; i<omap.oList.length; i++){
	            				value += "<tr onclick='otDetail("+ omap.oList[i].otNo +");'>"
										+ "<td>" + omap.oList[i].otNo + "</td>"
	            				        + "<td>" + omap.oList[i].empName + "</td>"
	            				        + "<td>" + omap.oList[i].deptName + "</td>"
	            				        + "<td>" + omap.oList[i].otCategory + "</td>"
	            				        + "<td>" + omap.oList[i].enrollDate + "</td>"
	            				        + "<td><input type='text' name='otStart' value='" + omap.oList[i].otStart + "' readonly><span style='font-size: 15px; font-weight: 600;'>~</span><input type='text' name='otEnd' value='" + omap.oList[i].otEnd + "' readonly></td>"
	            				        + "<td>" + omap.oList[i].otCheck + "</td>"
	            				        + "<td><button class='btn btn-warning' onclick='deleteOvertime(" + omap.oList[i].otNo + ");'>취소</button></td>"
	            				       + "</tr>";
	            				       
	            				$(".overtimeTable tbody").html(value);
	            			};
	            			
	            			// 페이징바 만들때 해당 페이지숫자 클릭시 => businessTripList(클릭한숫자);
	            			let page = "";
	            			if(omap.oPi.currentPage == 1){
	            				page += "<li class='page-item' disabled><a class='page-link' href='#'><</a></li>"
	            			}else{
	            				page += "<li class='page-item'><a class='page-link' onclick='overtimeList(" + (omap.oPi.currentPage-1) + ");'><</a></li>"
	            			}
	            			
	            			for(var o=omap.oPi.startPage; o<=omap.oPi.endPage; o++){
	            			
	            				page += "<li class='page-item'><a class='page-link' onclick='overtimeList(" + o + ");'>" + o + "</a></li>"
	            			}
	            			
	            			if(omap.oPi.currentPage == omap.oPi.maxPage){
	            				page += "<li class='page-item' disabled><a class='page-link' href='#'>></a></li>"
	            			}else{
	            				page += "<li class='page-item'><a class='page-link' onclick='overtimeList(" + (omap.oPi.currentPage+1) + ");'>></a></li>"
	            			}
	            			
	            			$(".opagination").html(page);
	            			
	            			
	            		},
	            		error:function(){
	            			console.log("시간외근무신청 ajax통신 실패");
	            		}
	            	});
	            }

				// 시간외근무 상세조회 ajax
				function otDetail(otNo){
					$.ajax({
							url:"detail.ot",
							type:"POST",
							dataType:"json",
							data:{
								otNo : otNo
							},
							success:function(o){
								//console.log(result);
								$(".modal-body input[name=enrollDate]").val(o.enrollDate);
								$(".modal-body input[name=otStart]").val(o.otStart);
								$(".modal-body input[name=otEnd]").val(o.otEnd);
								$(".modal-body input[name=otCategory]").val(o.otCategory);
								$(".otextarea").text(o.otContent);
								$(".otextCount").text(o.otContent.length + '자');
								$("#overtimeModal").modal('show');
							},
							error:function(){
								console.log("출장상세조회 ajax통신 실패");
							}
						});
				}
	            
	            function deleteBusinesstrip(no){
	            	if(confirm("출장신청을 삭제하시겠습니까?")){
	            		//console.log(no);
	            		location.href = 'delete.bt?btNo=' + no;
	            	}
	            }
	            
	            function deleteOvertime(no){
	            	if(confirm("시간외 근무신청을 삭제하시겠습니까?"))
	            		//console.log(no);
		            	location.href = 'delete.ot?otNo=' + no;
	            }
	            
            </script>

	</div>

	<!-- 출장 상세조회 Modal -->
    <div class="modal fade" id="businesstripModal">
        <div class="modal-dialog modal-dialog-centered"  style="width:400px;">
            <div class="modal-content">
        
                <!-- Modal Header -->
                <div class="modal-header">
                <h4 class="modal-title" style="color:rgb(0,172,0); margin-left:20px;">출장신청</h4>
                <button type="button" class="close" data-dismiss="modal" onclick="businesstripClose();">&times;</button>
                </div>
                
                <!-- Modal body -->
                <div class="modal-body" style="width:90%; margin:auto;">
                    <span class="modalS">신청 날짜
	                	&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" name="btStart" value="" style="width:100px;" readonly>
		            	<span>~</span>
		            	<input type="text" name="btEnd" value="" style="width:100px;" readonly>
                    </span>
                    <br><br>
                    <span>신청 사유</span>
                    <br>
                    <div class="textWrap">
                        <span class="btextCount"></span><span class="textTotal">/200자</span>
                    </div>
                    <textarea name="btContent" class="btextarea" readonly></textarea>
                    
                </div>
                
                <!-- Modal footer -->
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal" onclick="businesstripClose();">Close</button>
                </div>
            
            </div>
        </div>
    </div>

    <script>
        function businesstripClose(){
            $('#businesstripModal').modal('hide'); 
            $('#businesstripModal').hide();
            $('.jquery-modal').click();
    }

    </script>

	<!-- 시간외근무 상세조회 Modal -->
    <div class="modal fade" id="overtimeModal">
        <div class="modal-dialog modal-dialog-centered"  style="width:400px;">
            <div class="modal-content">
        
                <!-- Modal Header -->
                <div class="modal-header">
                <h4 class="modal-title" style="color:rgb(0,172,0); margin-left:20px;">시간외 근무신청</h4>
                <button type="button" class="close" data-dismiss="modal" onclick="overtimeClose();">&times;</button>
                </div>
                
                <!-- Modal body -->
                <div class="modal-body" style="width:90%; margin:auto;">
                    <span class="modalS">신청날짜</span> 
                    &nbsp;&nbsp;&nbsp;&nbsp;<input type="text" name="enrollDate" value="&nbsp;&nbsp;" style="width:220px;" readonly><br>
                    <span class="modalS">근무시간
	                    &nbsp;&nbsp;&nbsp;&nbsp;<input type="text" name="otStart" value="&nbsp;&nbsp;" style="width:100px;" readonly>
		                <span>~</span>
		                <input type="text" name="otEnd" value="&nbsp;&nbsp;" style="width:100px;" readonly>
                    </span>
                    <br>
					<span>근무사유
						&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" name="otCategory" value="" style="width:220px;" readonly>
					</span>
					<br><br>
                    <span>신청사유</span>
                    <br>
                    <div class="textWrap">
                        <span class="otextCount"></span><span class="textTotal">/200자</span>
                    </div>
                    <textarea name="otContent" class="otextarea" readonly></textarea>
                    
                </div>
                
                <!-- Modal footer -->
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal" onclick="overtimeClose();">Close</button>
                </div>
            
            </div>
        </div>
    </div>

    <script>
        function overtimeClose(){
            $('#overtimeModal').modal('hide'); 
            $('#overtimeModal').hide();
            $('.jquery-modal').click();
    }

    </script>
</body>
</html>