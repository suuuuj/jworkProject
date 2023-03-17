<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
 <head>
<style>
	
</style>
    <meta charset='utf-8' />
    <script src='https://cdn.jsdelivr.net/npm/fullcalendar-scheduler@6.1.4/index.global.min.js'></script>
    
    <script>
    document.addEventListener('DOMContentLoaded', function() {
    	  var calendarEl = document.getElementById('calendar');

    	  var calendar = new FullCalendar.Calendar(calendarEl, {
    		  schedulerLicenseKey: 'CC-Attribution-NonCommercial-NoDerivatives',
    		 timeZone: 'UTC',
    		 minTime:'08:00:00',
    		 maxTime:'19:00:00',
    	    initialView: 'resourceTimeGridDay',
    	    dateClick: function(info) {
                alert('Clicked on: ' + info.dateStr); // 날짜 띄우는 것까지 성공 ㅅㅂ
                // change the day's background color just for fun
                info.dayEl.style.backgroundColor = 'red';
                $("#calendarModal").modal("show");
            },
    	    customButtons:{
    	    	info:{
    	    		text:'회의실정보',
    	    		click:function(event){
    	    			onSelectEvent(event);
    	    		}
    	    	}
    	    	
    	    },
    	    headerToolbar: {
                left: 'info,prev,next',
                center: 'title',
               right:'today'
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
    	    select:function(arg) {
                var title = prompt('Event Title:');
                if(title) {
                      calendar.addEvent({
                          title: title,
                          start: arg.start,
                          end: arg.end,
                          allDay: arg.allDay
                         })

                     }

                    calendar.unselect()

                 },
    	    events: [
    	    	   $.ajax({
       	    		url:"call.events",
       	    		success:function(list){
       	    			for(let i=0; i<list.length; i++){
       	    				calendar.addResource({
       	    				id:list[i].cfrName,
       	    				title:list[i].cfrName
       	    				})
       	    			}
       	    		}
       	    		
       	    	})
    	    	
    	    ]
    	  })

    	  calendar.render();
    	});
		
    
   
    
    	
    
   
    </script>
    
  </head>
  <body>
   <jsp:include page="../common/menubar.jsp"/>
	<div class="content">
	
        <div class="innerOuter">
			
                <button type="button" class="btn btn-sm btn-secondary" data-toggle="modal" data-target="#cfrInfo" onclick="selectList();">회의실 정보</button>
                <button type="button" class="btn btn-sm btn-secondary" data-toggle="modal" data-target="#reservationForm" onclick="selectList();">예약하기</button>&nbsp;
            <div id='calendar'>
          
           
            </div>

        </div>
    </div>
    <!-- Edit Modal -->
		<div class="modal fade" id="calendarModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
	        aria-hidden="true">
	        <div class="modal-dialog" role="document">
	            <div class="modal-content">
	                <div class="modal-header">
	                    <h5 class="modal-title" id="exampleModalLabel">일정을 입력하세요.</h5>
	                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	                        <span aria-hidden="true">&times;</span>
	                    </button>
	                </div>
	                <div class="modal-body">
	                    <div class="form-group">
	                        <label for="taskId" class="col-form-label">일정 내용</label>
	                        <input type="text" class="form-control" id="calendar_content" name="calendar_content">
	                        <label for="taskId" class="col-form-label">시작 날짜</label>
	                        <input type="date" class="form-control" id="calendar_start_date" name="calendar_start_date">
	                        <label for="taskId" class="col-form-label">종료 날짜</label>
	                        <input type="date" class="form-control" id="calendar_end_date" name="calendar_end_date">
	                    </div>
	                </div>
	                <div class="modal-footer">
	                    <button type="button" class="btn btn-warning" id="addCalendar">추가</button>
	                    <button type="button" class="btn btn-secondary" data-dismiss="modal"
	                        id="sprintSettingModalClose">취소</button>
	                </div>
	    
	            </div>
	        </div>
	    </div>
    
  </body>
</html>