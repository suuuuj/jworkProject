<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
 <head>
<style>
		.innerOuter{
         width: 900px; 
        margin: 20px;
    }
    #calendar {
        max-width: 850px;
        padding: 30px;
    }
    /*xxx년x월 제목*/
    .fc .fc-toolbar-title {
        color: rgb(63, 69, 65);
        font-size: 30px;
        font-weight: 600;
    }
    /*요일*/
    .fc-col-header-cell-cushion {
        color: rgb(50, 50, 50);
        font-size:15px;
        font-weight: 500;
    }
    .fc-col-header-cell-cushion:hover {
        text-decoration: none;
        color: rgb(50, 50, 50);
    }
    /*일자*/
    .fc-daygrid-day-number{
        color: rgb(50, 50, 50);
        font-size:12px;
    }
    .fc-daygrid-day-number:hover{
        color: rgb(50, 50, 50);
    }
    
    /*종일제목*/
    .fc-event-title.fc-sticky{
        
    }
    /*more버튼*/ 
    .fc-daygrid-more-link.fc-more-link{
        color: rgb(50, 50, 50);
    }
    /*일정시간*/
    .fc-daygrid-event > .fc-event-time{
        color:rgb(122, 134, 127);
    }
    /*시간제목*/
    .fc-daygrid-dot-event > .fc-event-title{
        color:rgb(50, 50, 50) !important; /*나중에 바꿀 예정*/
    }
    /*가로 줄 - 월달력 종일 or 복수일자*/
    .fc-h-event{

    }
    /*세로 줄 - 주달력, 일달력*/
    .fc-v-event{
        
    }
    /*title 옆에 점*/
    .fc-daygrid-event-dot{
        
    }
    /*month/week/day*/
    .fc .fc-button-primary {
        border-color: rgb(39, 174, 96);
        background-color: white;
        color: rgb(39, 174, 96);
        font-size:13px;
        width: 45px;
    }  
    .fc .fc-button-primary:hover {
        border-color: rgb(39, 174, 96);
        background-color: rgb(39, 174, 96);
        color: white;
    }
    .fc .fc-button-active:active {
        border-color: rgb(39, 174, 96);
        background-color: rgb(39, 174, 96);
        color: white;
    }  
    .fc-button-active {
        border-color: rgb(39, 174, 96)  		!important;
        background-color: rgb(39, 174, 96) 	!important;
        color: white 				            !important;
        /* font-weight: bold 			 !important; */
    }
    .fc .fc-button:active {
        border-color: rgb(39, 174, 96)  !important;
        background-color: white         !important;
        color: rgb(39, 174, 96)         !important;
    }
    .fc .fc-button-primary:disabled{
        background-color: rgb(39, 174, 96);
        border-color: rgb(39, 174, 96);
    }
    .fc .fc-non-business {
        background-color: rgb(245, 249, 246);
    }
    .fc-list-table a {
        color: rgb(50, 50, 50);
    }
</style>
    <meta charset='utf-8' />
    <script src='https://cdn.jsdelivr.net/npm/fullcalendar-scheduler@6.1.4/index.global.min.js'></script>
    <script>
    $(function(){
    	$.ajax({
    		url:"list.acfrn",
    		success:function(list){
    			console.log(list);
    			
    		}
    		
    		
    	});
    })
    
    
    
    
    document.addEventListener('DOMContentLoaded', function() {
    	  var calendarEl = document.getElementById('calendar');

    	  var calendar = new FullCalendar.Calendar(calendarEl, {
    		  schedulerLicenseKey: 'CC-Attribution-NonCommercial-NoDerivatives',
    		 timeZone: 'UTC',
    	    initialView: 'resourceTimeGridDay',
    	    headerToolbar: {
                left: 'prev,next',
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
    	      { id: 'a', title: 'Room A' },
    	      { id: 'b', title: 'Room B'},
    	      { id: 'c', title: 'Room C' },
    	      { id: 'd', title: 'Room D' },
    	      { id: 'e', title: 'Room E' },
    	      { id: 'f', title: 'Room F' }
    	    ],
    	    events: 'https://fullcalendar.io/api/demo-feeds/events.json?with-resources=4&single-day'
    	  });

    	  calendar.render();
    	});
		
    
    </script>
  </head>
  <body>
   <jsp:include page="../common/menubar.jsp"/>
	<div class="content">
        <div class="innerOuter">

            <div id='calendar'></div>

        </div>
    </div>

  </body>
</html>