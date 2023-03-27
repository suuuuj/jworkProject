<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<style>
     #pagingArea{width:fit-content;margin:auto;}
     div{box-sizing: border-box;}
	
	#resDetail th{height:50px;}
	#resDetail{width:600px;}
	  #resConfirm{
        margin-top:30px;
        width:100%;
        border-top:1px solid rgb(234, 234, 234);
        text-align: center;
        font-size: 14px;
        color: rgb(50, 50, 50);
    }
    
     #resConfirm td{
        border-bottom: 1px solid rgb(234, 234, 234);
        color:rgb(50, 50, 50);
        height:30px;
    }
    #reject{padding:10px;}
</style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
    <jsp:include page="../common/menubar.jsp"/>
    <div class="outer" style="width:940px; margin:20px;">
        <h3>나의 차량 예약내역</h3>
        <hr>
        <div>
        <div align="right" style="width:900px;">
            <input type="date">- <input type="date">
        </div>
            <div id="" style="width:900px; margin:20px;">
                <table class="table table-hover" id="resConfirm">
                    <thead>
                        <tr class="text-center">
                            <th>신청차량명</th>
                            <th>신청일시</th>
                            <th>신청날짜</th>
                            <th>신청사유</th>
                            <th>신청상태</th>
                        </tr>
                   </thead>
                   <tbody>
                   		<c:forEach items="${list}" var="c">
	                        <tr onclick="detailView(${c.resNo});"class="text-center" data-toggle="modal" data-target="#ResDetailView">
	                            <td>${c.carName }</td>
	                            <td>${c.requestDate}</td>
	                            <td>${c.resDate} &nbsp;${c.startTime }~${c.endTime}</td>
	                            <td>${c.cause}</td>
	                            <td>
	                            	<c:choose>
		                            	<c:when test="${c.apStatus eq 1}">
		                            		 <button type="button" class="btn btn-sm btn-secondary" disabled>승인대기</button>
		                            	</c:when>
		                            	<c:when test="${c.apStatus eq 2}">
		                                	<button type="button" class="btn btn-sm btn-primary" disabled>승인완료</button>
		                                </c:when>
		                                <c:otherwise>
		                                	 <button type="button" class="btn btn-sm btn-danger" disabled>반려</button>
		                                </c:otherwise>
	                            	</c:choose>
	                            </td>
	                        </tr>
                        </c:forEach>
                   </tbody>

                </table>

            </div>
        </div>
        <br>
        <div id="pagingArea" style="width:940px; margin:20px; margin-left: 400px;">
             <ul class="pagination">
             	<c:choose>
              	<c:when test="${pi.currentPage eq  1}">
                  	<li class="page-item disabled"><a class="page-link" href="#"><</a></li>
                  </c:when>
                  <c:otherwise>
                   <li class="page-item"><a class="page-link" href="list.carMe?cpage=${pi.currentPage -1 }"><</a></li>
               </c:otherwise>
           </c:choose>
           <c:forEach var="p"  begin="${pi.startPage}" end="${pi.endPage}">
                  <li class="page-item"><a class="page-link" href="list.carMe?cpage=${p }">${p }</a></li>
            </c:forEach>
             <c:choose>
              	<c:when test="${pi.currentPage eq pi.maxPage}">
               		<li class="page-item disabled"><a class="page-link" href="#">></a></li>
           	 	</c:when>
           	 	<c:otherwise>
           	 		<li class="page-item"><a class="page-link" href="list.carMe?cpage=${pi.currentPage + 1 }">></a></li>
        		</c:otherwise>
          	</c:choose>
             </ul>
        </div>
    </div>
    <!-- 상세보기 모달 -->
    <div class="modal" id="ResDetailView">
        <div class="modal-dialog">
        <div class="modal-content">
    
            <!-- Modal Header -->
            <div class="modal-header">
            <h4 class="modal-title">예약내역 상세조회</h4>
            <button type="button" class="close" data-dismiss="modal">&times;</button>
            </div>
    
            <!-- Modal body -->
            <div class="modal-body">
                <table  id="resDetail">
                    <tr>
                        <th>승인일자</th>
                        <td id="apDate"></td>
                    </tr>
                    <tr>
                        <th>담당자</th>
                        <td id="approver"></td>
                    </tr>
                    <tr>
                        <th>신청결과</th>
                        <td id="apStatus">
	                        <div id="btn-area">
	                        </div>
                        </td>
                    </tr>
                    <tr>
                        <th>사유</th>
                        <td>
                            <textarea id="reject" cols="30" rows="5" style="resize:none;">
                            </textarea>
                        </td>
                    </tr>
                </table>
            </div>
    
            <!-- Modal footer -->
            <div class="modal-footer">
            <button type="button" class="btn btn-primary btn-sm" data-dismiss="modal">확인</button>
            </div>
    
        </div>
        </div>
    </div>
    <script>
    	function detailView(resNo){
    		
    		$.ajax({
    			url:"detail.carRes",
    			data:{resNo:resNo},
    			success:function(c){
    				if(c==null){
    					console.log("!!");
    					$("#approver").text("승인대기중");
						let value="";
        				value="<button type='button' class='btn btn-secondary btn-sm'>승인대기</button>";
        				$("#apDate").text("승인대기중");
        				$("#btn-area").html(value);
    				}
    			
    				$("#approver").text(c.empName + c.approver);
    				$("#reject").val(c.reject);
        					
        				
    				$("#apDate").html(c.apDate);
    				if(c.apStatus == 1){
    					let value="";
    					
        				value="<button type='button' class='btn btn-secondary btn-sm'>승인대기</button>";
    					
        				$("#btn-area").html(value);
    					
    				}else if(c.apStatus == 2){
						let value="";
    				
        				value="<button type='button' class='btn btn-primary btn-sm'>승인완료</button>"
        				$("#btn-area").html(value);
    				}else{
    					let value="";
        				
        				value="<button type='button' class='btn btn-danger btn-sm'>반려</button>"
        				$("#btn-area").html(value);
    				}
    				
    			},error:function(){
    				
    				console.log("예약 상세조회용 ajax 통신 실패");
    			}
    		});
    		
    		
    	}
    	
    </script>
   
</body>
</html>