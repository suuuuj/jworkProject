<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<style>
     #pagingArea{width:fit-content;margin:auto;}
     div{box-sizing: border-box;}
     .outer{
        width: 960px;
        margin:20px;
    }
    
 
    .ui-timepicker-container {
    	z-index:10000000 !important;
    	position: absolute;
        line-height: 30px;
	}
	
	
</style>

<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
     <jsp:include page="../common/menubar.jsp"/>
    <div class="outer" style="width:900px;">
        <h2>내 회의실 예약내역</h2>
        <hr><br>
        <div>
            <div>
                <table id="reservation-area" class="table table-hover" style="width:900px;">
                    <thead>
                        <tr>
                            <th class="text-center">회의실명</th>
                            <th class="text-center">회의명</th>
                            <th class="text-center">회의일시</th>
                            <th class="text-center">상태</th>
                        </tr>
                    </thead>
                    <tbody>
                    	<c:forEach var="c" items="${list}">
                    	 	<input type="hidden" class="resNo" value="${c.resNo}">
	                        <tr>    
	                            <td class="text-center cfrName" >${c.cfrName}</td>
	                            <td class="text-center cfTitle" >${c.cfTitle}</td>
	                            <td class="text-center" >${c.useDate}&nbsp;${c.startTime}~${c.endTime}</td>
                            <td class="text-center">
                            <c:choose>
	                            <c:when test="${c.status eq 1}">
		                                <button type="button" class="btn btn-sm btn-primary"  data-toggle="modal" id="change" data-target="#changeForm" ">일정변경</button>
		                                <button type="button" class="btn btn-sm btn-warning">예약취소</button>
	                            </c:when>
	                            <c:when test="${c.status eq 4}">
	                                <button type="button" class="btn btn-sm btn-secondary">이용완료</button>
	                            </c:when>
	                            <c:when test="${c.status eq 3}">'
	                                <button type="button" class="btn btn-sm btn-danger" >취소완료</button>
	                            </c:when>
                             </c:choose>
	                         </td>
		                            
	                           
	                        </tr>
                        </c:forEach>
                    </tbody>

                </table>

            </div>
            
            <br><br>
            <div id="pagingArea">
                <ul class="pagination">
                	<c:choose>
	                	<c:when test="${pi.currentPage eq  1}">
	                    	<li class="page-item disabled"><a class="page-link" href="#"><</a></li>
	                    </c:when>
	                    <c:otherwise>
		                    <li class="page-item"><a class="page-link" href="list.cfrMe=${pi.currentPage -1 }"><</a></li>
		                </c:otherwise>
		            </c:choose>
		            <c:forEach var="p"  begin="${pi.startPage }" end="${pi.endPage }">
	                    <li class="page-item"><a class="page-link" href="list.cfrMe?cpage=${p }">${p }</a></li>
	 
                   	</c:forEach>
                   	<c:choose>
                   		<c:when test="${pi.currentPage eq pi.maxPage}">
	                   		<li class="page-item disabled"><a class="page-link" href="#">></a></li>
	             	 	</c:when>
	             	 	<c:otherwise>
	             	 		<li class="page-item"><a class="page-link" href="list.cfrMe?cpage=${pi.currentPage + 1 }">></a></li>
           				</c:otherwise>
             		</c:choose>
                </ul>
            </div>

        </div>
        <br>
        <script>
        	$(function(){
        		
        		$.ajax({
	        		url:"alist.cfr",
	            	success:function(list){
	            		let value="";
	            		for(var i=0; i<list.length; i++){
	            			
	            			value+="<option class='cfrNameList'>"+list[i].cfrName+"</option>";
	            		}
	            		
	            		$("select[name=cfrName]").html(value);
	            		
	            		
	            	},error:function(){
	            		console.log("회의실 리스트 조회용 ajax통신실패");
	            	}
	            		
	        	});
        		
        		
        		
        		$.ajax({
					url:"detail.cfrRes",
					data:{resNo:$(".resNo").val()}
        			,success:function(c){
        				/* if(c.cfrName == $(".cfrNameList").val()){
        					$(this).prop("selected",true);
        				} */
        				var date = new Date();
        	    		var yyyy = date.getFullYear();
        	    		var mm = date.getMonth()+1 > 9 ? date.getMonth()+1 : '0' + date.getMonth()+1;
        	    		var dd = date.getDate() > 9 ? date.getDate() : '0' + date.getDate();
        	    		document.getElementById('useDate').valueAsDate = new Date(c.useDate);
						
        	    		
        	    		$("input[name=resNo]").val(c.resNo);
        				$("#cfrName").val(c.cfrName).prop("selected", true);
        				$("input[name=capacity]").val(c.capacity);
        				$("input[name=cfTitle]").val(c.cfTitle);
        				
        			},error:function(){
        				console.log("회의실 일정 변경용 ajax 통신 실패");
        			}
        		
        		});
	        	
        		
	        		
        	})
        	
        
        </script>

    </div>
	 <!--일정 변경용 모달 -->
	<div class="modal" id="changeForm">
	  <div class="modal-dialog">
	    <div class="modal-content">
	
	      <!-- Modal Header -->
	      <div class="modal-header">
	        <h4 class="modal-title">회의 일정 변경</h4>
	        <button type="button" class="close" data-dismiss="modal">&times;</button>
	      </div>
	
	      <!-- Modal body -->
	      <div class="modal-body">
	        <form action="update.cfrRes" method="post">
                <input type="hidden" name="reservation" value="${loginUser.empNo}">
                  <input type="hidden" name="resNo">
                    <table class='table'>
                        <tr>
                            <th>회의실</th>
                            <td>
                           		<select name="cfrName" id="cfrName" required> 
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <th>예약자</th>
                            <td>${loginUser.empName}${loginUser.empNo}</td>
                            
                        </tr>
                        <tr>
                            <th>날짜</th>
                            <td><input type="date" name="useDate" id="useDate" required></td>
                        </tr>
                        <tr>
                            <th>시간</th>
                            <td><input type="text" name="startTime"  class="timepicker"  required>-<input type="text" class="timepicker" name="endTime" required></td>
                        </tr>
                        <tr>
                            <th>인원</th>
                            <td><input type="number" name="capacity" required></td>
                        </tr>
                        <tr>
                            <th>회의제목</th>
                            <td><input type="text" name="cfTitle"required></td>
                        </tr>
                    </table>
                    <button type="submit" class="btn btn-primary btn-sm">예약하기</button>
               </form>
	      </div>
	
	      <!-- Modal footer -->
	      <div class="modal-footer">
	        <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
	      </div>
	
	    </div>
	  </div>
	</div>
	<script>
	$(function() {
	    $(".timepicker").timepicker({
	        timeFormat: 'h:mm p',
	        interval: 60,
	        minTime: '10',
	        maxTime: '6:00pm',
	        defaultTime: '11',
	        startTime: '9:00',
	        dynamic: false,
	        dropdown: true,
	        scrollbar: true        
	    });
	});
	</script> 
</body>
</html>
