<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<!-- 풀캘린더 -->
<script src='https://cdn.jsdelivr.net/npm/fullcalendar@6.1.4/index.global.min.js'></script>
<!-- <link href='https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css' rel='stylesheet'> -->
<!-- <link href='https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.1/font/bootstrap-icons.css' rel='stylesheet'> -->
<!-- fullcalendar 언어 CDN -->
<script src='https://cdn.jsdelivr.net/npm/fullcalendar@5.8.0/locales-all.min.js'></script>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.innerOuter{
        /* width: 900px; */
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
</head>
<body>
    <jsp:include page="../common/sideMenubar.jsp"/>
	<jsp:include page="../common/scheduleMenubar.jsp"/>
	<div class="content">
        <div class="innerOuter">

            <div id='calendar'></div>

        </div>
    </div>


    <script>

        document.addEventListener('DOMContentLoaded', function() {
            var calendarEl = document.getElementById('calendar');

            var calendar = new FullCalendar.Calendar(calendarEl, {
                // initialDate: '2023-01-12', // 처음 보여주는 캘린더 화면의 날짜
                editable: true,
                selectable: true,
                businessHours: true,
                dayMaxEvents: true, // 일정이 너무 많으면 more
                expendRows:true, // 화면에 맞게 높이 재설정
                headerToolbar: {
                    left: 'prev,next today',
                    center: 'title',
                    right: 'dayGridMonth,timeGridWeek,listWeek'
                },
                titleFormat: function(date){
                    return date.date.year + '년  ' + (parseInt(date.date.month) + 1) + '월'
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
                navLinks: true, // can click day/week names to navigate views
                // 여기서부터 날짜 클릭 시 이벤트
                /*
                selectable: true,
                selectMirror: true,
                select: function(arg) {
                    var title = prompt('Event Title:');
                    if (title) {
                    calendar.addEvent({
                        title: title,
                        start: arg.start,
                        end: arg.end,
                        allDay: arg.allDay
                    })
                    }
                    calendar.unselect()
                },
                eventClick: function(arg) {
                    if (confirm('Are you sure you want to delete this event?')) {
                    arg.event.remove()
                    }
                },
                */
                events: [
                    {
                        title: 'All Day Event',
                        start: '2023-03-03',
                        color:'rgb(193, 178, 249)'      
                    },
                    {
                        title: 'Long Event',
                        start: '2023-03-07',
                        end: '2023-03-10',
                        color:'rgb(84, 161, 220)'
                    },
                    {
                        groupId: 999,
                        title: 'Repeating Event',
                        start: '2023-03-09T16:00:00',
                        color:'rgb(39, 174, 96)',
                        color:'rgb(193, 178, 249)'
                    },
                    {
                        groupId: 999,
                        title: 'Repeating Event',
                        start: '2023-03-16T16:00:00',
                        color:'rgb(193, 178, 249)'
                    },
                    {
                        title: 'Conference',
                        start: '2023-03-11',
                        end: '2023-03-13',
                        color:'rgb(255, 191, 122)'
                    },
                    {
                        title: 'Meeting',
                        start: '2023-03-12T10:30:00',
                        end: '2023-03-12T12:30:00',
                        color:'rgb(39, 174, 96)'
                    },
                    {
                        title: 'Lunch',
                        start: '2023-03-12T12:00:00',
                        color:'rgb(39, 174, 96)'
                    },
                    {
                        title: 'Meeting',
                        start: '2023-03-12T14:30:00',
                        color:'rgb(84, 161, 220)'
                    },
                    {
                        title: 'Happy Hour',
                        start: '2023-03-12T17:30:00',
                        color:'rgb(84, 161, 220)'
                    },
                    {
                        title: 'Dinner',
                        start: '2023-03-12T20:00:00',
                        color:'rgb(39, 174, 96)'
                    },
                    {
                        title: 'Birthday Party',
                        start: '2023-03-13T07:00:00',
                        color:'rgb(39, 174, 96)'
                    },
                    {
                        title: 'Click for Google',
                        url: 'http://google.com/',
                        start: '2023-03-28',
                        color:'rgb(84, 161, 220)'
                    }
                ]
            });
    
            calendar.render();
        });
    </script>
</body>
</html>