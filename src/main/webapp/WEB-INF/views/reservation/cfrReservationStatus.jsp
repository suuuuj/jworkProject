<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
 <head>

<style>
	.modal.modal-center {
  text-align: center;
}

@media screen and (min-width: 768px) { 
  .modal.modal-center:before {
    display: inline-block;
    vertical-align: middle;
    content: " ";
    height: 100%;
  }
}

.modal-dialog.modal-center {
  display: inline-block;
  text-align: left;
  vertical-align: middle; 
}
</style>
    <meta charset='utf-8' />
    <script src='https://cdn.jsdelivr.net/npm/fullcalendar-scheduler@6.1.4/index.global.min.js'></script>
   
    <script>
    document.addEventListener('DOMContentLoaded', function() {
    	  var calendarEl = document.getElementById('calendar');

    	  var calendar = new FullCalendar.Calendar(calendarEl, {
    		  schedulerLicenseKey: 'CC-Attribution-NonCommercial-NoDerivatives',
    		  expandRows: true,
    		  timeZone: 'local',
    		  aspectRatio: 1.5,
    		 slotMinTime: "09:00:00", // 최소시간
             slotMaxTime: "20:00:00", // 최대시간 (23시까지만 화면에 보여짐)
    	    initialView: 'resourceTimelineDay',
    	    resourceAreaHeaderContent: '회의실정보',
    	    dateClick: function(info) {
                //alert('Clicked on: ' + info.dateStr); // 날짜 띄우는 것까지 성공 ㅅㅂ
              /*   info.dayEl.style.backgroundColor = '#d6dfcc'; */
               // $("#reservationForm").modal("show");
              
            },
    	    customButtons:{
    	    	info:{
    	    		text:'예약상세조회',
    	    		click:function(){
    	    			  $("#cfrRes").modal("show");
    	    		}
            	}
    	    	
    	    },
    	    headerToolbar: {
    	        left: 'info',
    	        center: 'title',
    	        right: 'prev,next'
    	      },
            
            buttonText: {
                prev:"<",
                next:">",
                today: "오늘",
                month:"월",
                week:"주",
                day:"일",
                list: "목록",
            },
            nowIndicator: true, // 현재 시간 마크
            navLinks:false, // 달력상의 날짜를 클릭할 수 있는지 여부, 클릭시 일 달력/주 달력으로 넘어감(Boolean, default:false/Demo)
            locale: 'ko',
            day:'numeric',
            navLinks: true,
    	    resources: [
    	      $.ajax({
    	    		url:"list.acfrn",
    	    		success:function(list){
    	    			for(let i=0; i<list.length; i++){
    	    				calendar.addResource({
    	    				id:list[i].cfrName,
    	    				title:list[i].cfrName
    	    				})
    	    			}
    	    		}
    	    		
    	    	})
    	    ],
    	 
                 events: [
                 	<c:forEach var="c" items="${list}">
                 		<c:if test="${c.cfrName eq '1회의실'}">
                     	{ id: '${c.resNo}', resourceId: '${c.cfrName }', start: '${c.useDate} ${c.startTime}', end: '${c.useDate} ${c.endTime }', title: '${c.empName} /${c.cfTitle}', color: '#FF5B5B'},
                  		</c:if>
                     	<c:if test="${c.cfrName eq '2회의실'}">
                     	{ id: '${c.resNo}', resourceId: '${c.cfrName }', start: '${c.useDate} ${c.startTime}', end: '${c.useDate} ${c.endTime }', title: '${c.empName} /${c.cfTitle}', color: '#f7C38C'},
                  		</c:if>
                     	<c:if test="${c.cfrName eq '3회의실'}">
                     	{ id: '${c.resNo}', resourceId: '${c.cfrName }', start: '${c.useDate} ${c.startTime}', end: '${c.useDate} ${c.endTime }', title: '${c.empName} /${c.cfTitle}', color: '#FFFF7D'},
                  		</c:if>
                     	<c:if test="${c.cfrName eq '4회의실'}">
                     	{ id: '${c.resNo}', resourceId: '${c.cfrName }', start: '${c.useDate} ${c.startTime}', end: '${c.useDate} ${c.endTime }', title: '${c.empName} /${c.cfTitle}', color: '#61Cf8F'},
                  		</c:if>
                     	<c:if test="${c.cfrName eq '5회의실'}">
                     	{ id: '${c.resNo}', resourceId: '${c.cfrName }', start: '${c.useDate} ${c.startTime}', end: '${c.useDate} ${c.endTime }', title: '${c.empName} /${c.cfTitle}', color: '#8DD7EE'},
                  		</c:if>
                     	<c:if test="${c.cfrName eq '6회의실'}">
                     	{ id: '${c.resNo}', resourceId: '${c.cfrName }', start: '${c.useDate} ${c.startTime}', end: '${c.useDate} ${c.endTime }', title: '${c.empName} /${c.cfTitle}', color: '#54A1DC'},
                  		</c:if>
                     	<c:if test="${c.cfrName eq '7회의실'}">
                     	{ id: '${c.resNo}', resourceId: '${c.cfrName }', start: '${c.useDate} ${c.startTime}', end: '${c.useDate} ${c.endTime }', title: '${c.empName} /${c.cfTitle}', color: '#F0B6D8'},
                  		</c:if>
                    </c:forEach>
                 ]
                 
    	  })

    	  calendar.render();
    	});
		
    
 
    	
   
    </script>
  
  </head>
  
  <body>
    <jsp:include page="../common/menubar.jsp"/>
    <div style="width: 940px; margin:20px;">
        <h3>회의실 예약 현황</h3>
        <hr>
         <div id='calendar' style="margin:20px;">
         </div>
        
        <div>
     
           
    </div>
   </div>
	       <!--회의실 예약 상세보기 모달 -->
	 <div class="modal modal-center fade modal-lg"  id="cfrRes" tabindex="-1" role="dialog" aria-labelledby="myCenterModalLabel">
        <div class="modal-dialog modal-center" role="document">
        <div class="modal-content">
    
            <!-- Modal Header -->
            <div class="modal-header">
            <h4 class="modal-title">회의실 예약 내역</h4>
            <button type="button" class="close" data-dismiss="modal" onclick=" $('#cfrRes').modal('hide');">&times;</button>
            </div>
    
            <!-- Modal body -->
            <div class="modal-body">
                <select id="selectCfr" onchange="cfrDetailRes($(this).val());">
                	<option> - 회의실명 - </option>
                </select>
                <div>
                <br>
                    <table class="table table-bordered" id="resList" style="width:700px;"> 
                    	<thead>
	                    	<tr class="text-center">
	                            <th>회의실명</th>
	                            <th>회의명</th>
	                            <th>예약자</th>
	                            <th>예약일정</th>
	                            <th>예약상태</th>
	                    	</tr>
                    	</thead>
                    	<tbody>
	                      
                    	</tbody>
                    </table>
						<div id="pagingArea">
								<ul class="my pagination justify-content-end pagination-sm">
								</ul>
						</div>
                </div>
                
            </div>
    
        </div>
        </div>
    </div>
  	<script>
  	$(function(){
		selectResList(1);
	})
		
		function selectResList(cpage){
  		
  		$.ajax({
				url:"call.events",
				data:{cpage:cpage},
				success:function(map){
				
				     //데이터 뿌리기 
				      let value;
				      let value2; 
				     for(var i=0;i<map.list.length;i++){
				    	  console.log(map.list[i].status);
				    	  if(map.list[i].status ==2){
					    		 value="<span>예약완료<span>";
					    	 }else if(map.list[i].status ==3) {
					    		 value="<span style='color:red;'>취소완료<span>";
					    	 }else if(map.list[i].status ==4) {
					    		 value="<span>이용완료<span>";
					    	 }
				    		
						value2 += "<tr class='text-center'><td>" + map.list[i].cfrName + "</td>" 
						+"<td>" + map.list[i].cfTitle + "</td>" 
						+"<td>" + map.list[i].empName + "</td>" 
						+"<td>" + map.list[i].useDate +"&nbsp;"+map.list[i].startTime +"~"+map.list[i].endTime +"</td>" 
						+"<td>" + value + "</td></tr>";
					
				     }
					  $('#resList tbody').html(value2);
				 //페이징바
 	            let page="";
 	            if(map.pi.currentPage ==1){
 	               page += "<li class='page-item disabled' ><a class='page-link' href='#' style='color:rgb(196, 197, 197)'><</a></li>"
 	            }else{
 	               page += "<li class='page-item'><a class='page-link' onclick='selectResList(" + (map.pi.currentPage-1) + ");'><</a></li>"
 	            }
 	            
 	            for(var p=map.pi.startPage; p<=map.pi.endPage; p++){
 	               page += "<li class='page-item'><a class='page-link' onclick='selectResList(" + p + ");'>" + p + "</a></li>"
 	            }
 	            
 	            if(map.pi.currentPage == map.pi.maxPage){
 	               page += "<li class='page-item disabled'><a class='page-link ' href='#' style='color:rgb(196, 197, 197)'>></a></li>"
 	            }else{
 	               page += "<li class='page-item'><a class='page-link' onclick='selectResList(" +  (map.pi.currentPage+1) + ");'>></a></li>"
 	            }
 	            
 	            $(".pagination").html(page);
				   }
				});	
			
  		
  		
  		
  	}
  	
  		$(function(){
  				
  				 $.ajax({
     	    		url:"list.acfrn",
     	    		success:function(list){
     	    			for(let i=0; i<list.length; i++){
     	    				$("#selectCfr").append(
     	    					
     	    				"<option>"+list[i].cfrName+"</option>"		
     	    				);
     	    			}
     	    		}
     	    		
     	    	})
  				
  				})
  			
			$(function(){
				selectResList($("#selectCfr option").val(),1);
			})
  			function cfrDetailRes(val,cpage){
  				if(val == '- 회의실명 -'){
  					alert("올바른 값을 입력하세요.");
  					return false;
  				}	
  			
  				$.ajax({
  					url:"select.cfrRes",
  					data:{cfrName:val,cpage:cpage},
  					success:function(map){
  				      let value;
				      let value2; 
				     for(var i=0;i<map.list.length;i++){
				    	 
				    	 if(map.list[i].status ==2){
				    		 value="<span>예약완료<span>";
				    	 }else if(map.list[i].status ==3) {
				    		 value="<span style='color:red;'>취소완료<span>";
				    	 }else if(map.list[i].status ==4) {
				    		 value="<span>이용완료<span>";
				    	 }
				    		
						value2 += "<tr class='text-center'><td>" + map.list[i].cfrName + "</td>" 
						+"<td>" + map.list[i].cfTitle + "</td>" 
						+"<td>" + map.list[i].empName + "</td>" 
						+"<td>" + map.list[i].useDate +"&nbsp;"+map.list[i].startTime +"~"+map.list[i].endTime +"</td>" 
						+"<td>" + value + "</td></tr>";
					
				     }
					  $('#resList tbody').html(value2);
				 //페이징바
 	            let page="";
 	            if(map.pi.currentPage ==1){
 	               page += "<li class='page-item disabled' ><a class='page-link' href='#' style='color:rgb(196, 197, 197)'><</a></li>"
 	            }else{
 	               page += "<li class='page-item'><a class='page-link' onclick='selectResList(" + (map.pi.currentPage-1) + ");'><</a></li>"
 	            }
 	            
 	            for(var p=map.pi.startPage; p<=map.pi.endPage; p++){
 	               page += "<li class='page-item'><a class='page-link' onclick='selectResList(" + p + ");'>" + p + "</a></li>"
 	            }
 	            
 	            if(map.pi.currentPage == map.pi.maxPage){
 	               page += "<li class='page-item disabled'><a class='page-link ' href='#' style='color:rgb(196, 197, 197)'>></a></li>"
 	            }else{
 	               page += "<li class='page-item'><a class='page-link' onclick='selectResList(" +  (map.pi.currentPage+1) + ");'>></a></li>"
 	            }
 	            
 	            $(".pagination").html(page);
  					},error:function(){
  						console.log("회의실별 조회 ajax 통신 실패");
  						
  					}
  				})
  			
  		}

    </script>
  </body>
</html>
                        