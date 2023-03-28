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
       
    }
    
 
    .ui-timepicker-container {
    	z-index:10000000 !important;
    	position: absolute;
        line-height: 30px;
	}
	
	/* .fc-toolbar-chunk div,.fc-toolbar-chunk button{
	disply:inline-block !important;
	 width: 960px!important;
	} */
	
	
</style>

<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
     <jsp:include page="../common/menubar.jsp"/>
    <div class="outer" style="width:900px;  margin:20px;">
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
                    	 	
	                        <tr>    
	                            <td class="text-center cfrName" >${c.cfrName}</td>
	                            <td class="text-center cfTitle" >${c.cfTitle}</td>
	                            <td class="text-center" >${c.useDate}&nbsp;${c.startTime}~${c.endTime}</td>
                            <td class="text-center">
                            <c:choose>
	                            <c:when test="${c.status eq 2}">
	                            	<div class="statusArea">
		                                <button type="button" class="btn btn-sm btn-primary"  data-toggle="modal" id="change" data-target="#changeForm" onclick="change('${c.resNo}');">일정변경</button>
		                                <button type="button" class="btn btn-sm btn-danger" onclick="deleteCfrRes('${c.resNo}');">예약취소</button>
	                            	</div>
	                            </c:when>
	                            <c:when test="${c.status eq 4}">
	                            	<div class="statusArea">
	                                <button type="button" class="btn btn-sm btn-secondary" >이용완료</button>
	                                </div>
	                            </c:when>
	                            <c:when test="${c.status eq 3}">
	                           		 <div class="statusArea">
	                                <button type="button" class="btn btn-sm btn-warning" >취소완료</button>
	                                </div>
	                            </c:when>
                             </c:choose>
	                         </td>
		                            
	                           
	                        </tr>
                        </c:forEach>
                    </tbody>

                </table>

            </div>
            <script>
            $(function(){
            
            	
            	$.ajax({
            			url:"list.aCfrMe",
            			success:function(list){
            				
            				var today = new Date();

                        	var year = today.getFullYear();
                        	var month = ('0' + (today.getMonth() + 1)).slice(-2);
                        	var day = ('0' + today.getDate()).slice(-2);
                        	var dateString = year + '-' + month  + '-' + day;
                        	
                        	var dateString = year + '-' + month  + '-' + day;
                        	var hours = ('0' + today.getHours()).slice(-2); 
                        	var minutes = ('0' + today.getMinutes()).slice(-2);
                        	var timeString = hours + ':' + minutes;
            				
            				var sysdate;
            				today=  dateString+" "+timeString;
            				sysdate= new Date(today);
            				//console.log(sysdate);
            				var usedate;
            				for(let i=0; i<list.length; i++){
            				usedate=new Date(list[i].useDate+" "+list[i].endTime);
            			
            				let value;
        	    			if(usedate < sysdate){
        	    				   var resNoArr = [];
        	    				   resNoArr.push(list[i].resNo);
        	    				 $.ajax({
        	    					url:"update.status",
        	    					data:{resNoArr:resNoArr},
        	    					dataType : 'json',
        	    					traditional : true,
        	    					success:function(result){
        	    						if(result>0){
        	    							
        	    						console.log("상태업데이트ajax통신성공");
        	    						}
        	    					},error:function(){
        	    						console.log("상태업데이트ajax통신실패");
        	    					}
        	    					
        	    				}) 
        	    				
        	    				}
        	    			}
            		  }
            		
            		
            	});
            	
            	
            
            })
            
            
            </script>
            
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
         <div id='calendar'></div>
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
        		
        		
        
  
	        		
        	})
        	
        	
        	function deleteCfrRes(resNo){
        		if(confirm('정말 예약을 취소하시겠습니까?'))   
    			{
    			
    			$.ajax({
    				url:"delete.cfrRes",
    				data:{resNo:resNo},
    				async: true,
    				success:function(result){
    					if(result>0){
    						alert("회의실 예약 취소 성공");
    						location.reload();
    					}
    				},error:function(){
    					console.log("회의실 예약 취소 ajax통신 실패");
    				}
    					
    			});
    			}
        		        		
        		
        	}
        	function change(resNo){
        		

        		$.ajax({
					url:"detail.cfrRes",
					data:{resNo:resNo}
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
        	    		$("#startTime").val(c.startTime).prop("selected", true);
        	    		$("#endTime").val(c.endTime).prop("selected", true);
        				$("#cfrName").val(c.cfrName).prop("selected", true);
        				$("input[name=capacity]").val(c.capacity);
        				$("input[name=cfTitle]").val(c.cfTitle);
        				
        			}
        		
        		});
        		
        	}
        	
        
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
                            <td><input type="date" name="useDate" id="useDate" onchange="selectDay($(this).val());" required></td>
                        </tr>
                        <tr>
                            <th>시간</th>
                            <td>  <select name="startTime" id="startTime"  onchange="endTimeShow($(this).val());" id="startTime" disabled required>
                                <option value="09:00">09:00</option>
                                <option value="10:00">10:00</option>
                                <option value="11:00">11:00</option>
                                <option value="12:00">12:00</option>
                                <option value="13:00">13:00</option>
                                <option value="14:00">14:00</option>
                                <option value="15:00">15:00</option>
                                <option value="16:00">16:00</option>
                                <option value="17:00">17:00</option>
                                <option value="18:00">18:00</option>
                                <option value="19:00">19:00</option>
                            </select>
                            -
                            <select name="endTime" id="endTime" disabled required>
                                <option value="09:00">09:00</option>
                                <option value="10:00">10:00</option>
                                <option value="11:00">11:00</option>
                                <option value="12:00">12:00</option>
                                <option value="13:00">13:00</option>
                                <option value="14:00">14:00</option>
                                <option value="15:00">15:00</option>
                                <option value="16:00">16:00</option>
                                <option value="17:00">17:00</option>
                                <option value="18:00">18:00</option>
                                <option value="19:00">19:00</option>
                            </select></td>
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
	$(function(){
		
		var now_utc = Date.now() // 지금 날짜를 밀리초로
		// getTimezoneOffset()은 현재 시간과의 차이를 분 단위로 반환
		var timeOff = new Date().getTimezoneOffset()*60000; // 분단위를 밀리초로 변환
		// new Date(today-timeOff).toISOString()은 '2022-05-11T18:09:38.134Z'를 반환
		var today = new Date(now_utc-timeOff).toISOString().substring(0, 10);
		 
		document.getElementById("useDate").setAttribute("min", today);
	
	})
	
		function selectDay(val){
	    		let cfrName= $("#cfrName").val();
	    		 $("#startTime").prop("disabled",false);
	    		$.ajax({
	    			url:"time.cfr",
	    			data:{useDate:val,cfrName:cfrName},
	    			success:function(list){
	    				for(let i=0; i<list.length; i++){
	    				
	    			
	    					$("#startTime option").each(
	    							function(){    
	    								if($(this).val() >= list[i].startTime && $(this).val() < list[i].endTime) {
	    									   $(this).prop("disabled",true);
	    									}
	    						    }
	    						);

	    					$("#endTime option").each(
	    							function(){    
	    								if($(this).val() > list[i].startTime && $(this).val() < list[i].endTime) {
	    									   $(this).prop("disabled",true);
	    									}
	    						    }
	    						);

	    				}
	    			},error:function(){
	    				console.log('날짜 조회용 ajax 통신 실패');
	    			}
	    			
	    		})
	    	}
	    	
	
	function endTimeShow(val){
			
			 $("#endTime").prop("disabled",false);
			 
			$("#endTime option").each(
				function(){    
					if($(this).val() <= val) {
						   $(this).prop("disabled",true);
						}
			    }
			);
			
			let cfrName= $("#cfrName").val();
			let useDate= $("#useDate").val();
			
			$.ajax({
			url:"time.cfr",
			data:{useDate:useDate,cfrName:cfrName},
			success:function(list){
				for(let i=0; i<list.length; i++){
					$("#endTime option").each(
							function(){    
								if($(this).val() >= list[i].startTime && $(this).val() <= list[i].endTime) {
									   $(this).prop("disabled",true);
									   
									}
								
								if(list[i].startTime >= val ){
									
									if($(this).val() >= list[i].startTime){
										
									  $(this).prop("disabled",true);
									}
								}
						    }
						);

				}
			},error:function(){
				console.log('날짜 조회용 ajax 통신 실패');
			}
			
		})
	}
	</script>
</body>
</html>
