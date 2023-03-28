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
<!-- 풀캘린더 -->
<script src='https://cdn.jsdelivr.net/npm/fullcalendar@6.1.4/index.global.min.js'></script>
<!-- <link href='https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css' rel='stylesheet'> -->
<!-- <link href='https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.1/font/bootstrap-icons.css' rel='stylesheet'> -->
<!-- fullcalendar 언어 CDN -->
<script src='https://cdn.jsdelivr.net/npm/fullcalendar@5.8.0/locales-all.min.js'></script>
<script>

    document.addEventListener('DOMContentLoaded', function(){

        var calendarEl = document.getElementById('calendar');

        var calendar = new FullCalendar.Calendar(calendarEl, {
            
            height:'700px', // calendar 높이 설정
            header: {
                left: '',
                center: 'prev, title, next',
                right:'',
            },
            titleFormat: function(date){
                return date.date.year + '년' + (parseInt(date.date.month) + 1) + '월';
            },
            defualtDate: new Date(), // 미지정시 현재날짜
            nowIndicator: true, // 현재 시간 마크
            navLinks:false, // 달력상의 날짜를 클릭할 수 있는지 여부, 클릭시 일 달력/주 달력으로 넘어감(Boolean, default:false/Demo)
            eventLimit:true, // 달력상에 셀 크기보다 많은 이벤트가 등록되어 있는 경우 'more'로 표기함(Boolean, default:false)
            locale: 'ko', // 한국어설정
            events:
            [   
                
                
                //title:String, 이벤트에 표시될제목,
                //start:Date object, 이벤트 시작 날짜(& 시간),
                //end:Date object, 이벤트 종료 날짜(& 시간),
                //groupid:String, 이벤트그룹, 이벤트 드래그/리사이징 할 경우 동일한 그룹 이벤트들은 자동으로 같이 수정됨,
                //editable:Boolean, 이벤트 드래그, 리사이징 등의 편집여부를 설정함(default:false)
                
                /*
                {
                    // 시간외근무
                    title:'③연장' +' ' + '00:30:00',
                    color:'rgb(41, 128, 185)',
                    textColor:'white',
                    start:'2023-03-07'
                },
                {
                    title:'①출근' +' ' + '08:55:53',
                    color:'rgb(224, 224, 224)',
                    textColor:'rgb(51,51,51)',
                    start:'2023-03-08'
                },
                {
                    //title:'퇴근' + 퇴근시간 (조퇴)
                    title:'②퇴근' + ' ' + '17:20:02',
                    color:'rgba(241, 196, 15, 0.72)',
                    textColor:'rgb(50,50,50)',
                    start:'2023-03-08'
                }
                */
                
                
                $(function(){
                    $.ajax({
                        url:"ajaxWorkCalendar.at",
                        dataType:"JSON",
                        type:"GET",
                        success:function(map){
                            console.log(map.alist[0].attDate);
                            for(i=0; i<map.alist.length; i++){
                                if(map.alist[i].attStatus == 3){

                                    calendar.addEvent({
                                    title: "결근 " ,
                                    start: map.alist[i].attDate,
                                    color:'rgba(192, 57, 43, 0.79)',
                                    textColor:'rgb(255, 255, 255)'
                                    })

                                }else{

                                    if(map.alist[i].attStatus == 1 || map.alist[i].attStatus == 2){
                                        calendar.addEvent({
                                        title: "①출근 " + map.alist[i].startTime ,
                                        start: map.alist[i].attDate,
                                        color:'rgba(241, 196, 15, 0.72)',
                                        textColor:'rgb(51, 51, 51)'
                                        })
                                        
                                        if(map.alist[i].endTime == null){
                                            calendar.addEvent({
                                        title: "②퇴근 " ,
                                        start: map.alist[i].attDate,
                                        color:'rgba(241, 196, 15, 0.72)',
                                        textColor:'rgb(51, 51, 51)'
                                        })
                                        }else{
                                            calendar.addEvent({
                                        title: "②퇴근 " + map.alist[i].endTime ,
                                        start: map.alist[i].attDate,
                                        color:'rgba(241, 196, 15, 0.72)',
                                        textColor:'rgb(51, 51, 51)'
                                        })
                                        }
                            
                                    }else if(map.alist[i].attStatus == 0){
                                        calendar.addEvent({
                                        title: "①출근 " + map.alist[i].startTime ,
                                        start: map.alist[i].attDate,
                                        color:'rgb(224, 224, 224)',
                                        textColor:'rgb(51, 51, 51)'
                                        })

                                        if(map.alist[i].endTime == null){
                                            calendar.addEvent({
                                        title: "②퇴근 " ,
                                        start: map.alist[i].attDate,
                                        color:'rgb(224, 224, 224)',
                                        textColor:'rgb(51, 51, 51)'
                                        })
                                        }else{
                                            calendar.addEvent({
                                        title: "②퇴근 " + map.alist[i].endTime ,
                                        start: map.alist[i].attDate,
                                        color:'rgb(224, 224, 224)',
                                        textColor:'rgb(51, 51, 51)'
                                        })
                                        }
                    
                                    }
                                
                                }
                            }

                            for(i=0; i<map.blist.length; i++){
                                calendar.addEvent({
                                    title: "출장 " ,
                                    start: map.blist[i].btStart,
                                    end: map.blist[i].btEnd,
                                    color:'rgb(41, 128, 185)',
                                    textColor:'rgb(255, 255, 255)'
                                })
                            }

                            for(i=0; i<map.olist.length; i++){
                                calendar.addEvent({
                                    title: "③시간외근무" ,
                                    start: map.olist[i].enrollDate,
                                    color:'rgb(41, 128, 185)',
                                    textColor:'rgb(255, 255, 255)'
                                })
                            }
                            
                        },
                        error:function(){
                            console.log("근태현황 ajax통신 실패");
                        }
                    })
                })

            ]


    });

    calendar.render();
});
</script>
<title>Insert title here</title>
<style>
    /* outer영역 */
    .workOuter{
        padding:50px;
    }
    /* content영역 */
    .work-area{
        margin-top: 30px;
    }
    .workTable{
        margin:auto;
        text-align: center;
        width:850px;
        border-top:1px solid rgb(234, 234, 234);
        border-bottom:1px solid rgb(234, 234, 234);
        border-left:1px solid rgb(234, 234, 234);
    }
    .workTable td{
        border-right: 1px solid rgb(234, 234, 234);
        height:30px;
    }
    .workTable>thead td{
        width:225px;
        padding-top: 15px;
        color:rgba(50, 50, 50);
        font-size: 15px;
    }
    .workTable>tbody td{
        padding-bottom: 15px;
        color:rgb(0, 172, 0);
        font-size: 25px;
        font-weight: 600;
    }
    .workingCalendar{
        margin: 40px 10px;
        padding: 0;
        font-family:Arial, Helvetica Neue, Helvetica, sans-serif;
        font-size:14px;
    }
    #calendar{
        max-width:900px;
        margin:0 auto;
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
    <jsp:include page="../common/menubar.jsp"/>
    <div class="workOuter">

        <h4><b>신청</b></h4>

        <div class="work-area">
            
            <div class="workingTime">
                <table class="workTable">
                    <thead>
                        <tr style="color:rgb(170, 170, 170);font-size: 15px;font-weight: 600;">
                            <td>이번주 누적</td>
                            <td>이번주 초과</td>
                            <td>이번주 잔여</td>
                            <td>이번달 누적</td>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>${week.weekTime}</td>
                            <td>${oweek.weekTime}</td>
                            <td>${remain.remainTime}</td>
                            <td>${month.monthTime}</td>
                        </tr>
                    </tbody>
                </table>
            </div>

            <div class="workingCalendar">

                <div id="calendar"></div>

            </div>

        </div>

    </div>

</body>
</html>