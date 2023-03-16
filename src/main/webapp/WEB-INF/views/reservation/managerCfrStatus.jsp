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
    	    initialView: 'resourceTimeGridDay',
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
    
  </body>
</html>