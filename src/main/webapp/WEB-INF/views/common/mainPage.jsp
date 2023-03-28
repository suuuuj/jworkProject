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

div{
    box-sizing: border-box;
}
/*** outer스타일 ***/
.ess-area{
    margin: 0;
    width: 315px;
 
}
/*** 근태버튼 style ***/
.essBtn-area{
    width:268px;
    height:300px;
    border: 1px solid rgb(220,220,220);
    border-radius: 10px;
    margin: 20px;
}
#essDate{
    padding-top:70px;
    text-align: center;
    color:rgb(150, 147, 147)
}
#essClock{
    text-align: center;
    color:rgb(50,50,50);
    font-size: 35px;
    font-weight: 600;
}
.btnWrap{
    margin-top:40px;
    text-align: center;
}
#essStart, #essEnd{
    width:80px;
    height:30px;
    border-radius: 5px;
    border:none;
    font-weight: 500;
    font-size: 15px;
}
#essStart:hover, #essEnd:hover{
    background-color: rgb(0,172,0);
    color:white;
}
.btnPut{
    margin-top: 10px;
}
#startResult, #endResult{
    width:100px;
    height:30px;
    color:rgb(150, 147, 147)
}

.calender-area{
    width: 580px;
    height: 650px;
    border: 1px solid rgb(220,220,220);
    border-radius: 10px;
    margin: 20px;
}
.outer>div{
    float: left;
}
.plan{
    height: 300px;
    border: 1px solid rgb(220,220,220);
    border-radius: 10px;
    margin: 20px;
}

/*캘린더 스타일*/
#calendar {
    padding: 30px; 
}
/*xxx년x월 제목*/
.fc .fc-toolbar-title {
    color: rgb(63, 69, 65);
    font-size: 20px;
}
/*요일*/
.fc-col-header-cell-cushion {
    color: rgb(50, 50, 50); text-decoration: none;
    font-size:12px; font-weight: 500;
}
.fc-col-header-cell-cushion:hover {
    text-decoration: none;
    color: rgb(50, 50, 50);
}

/*일자*/
.fc-daygrid-day-number{
    color: rgb(50, 50, 50);
    font-size:12px; text-decoration: none;
}
.fc-daygrid-day-number:hover{
    color: rgb(50, 50, 50); text-decoration: none;
}
/*more버튼*/ 
.fc-daygrid-more-link.fc-more-link{
    color: rgb(50, 50, 50);
    font-size:10px;
}
/*일요일 토요일*/
.fc .fc-non-business {
    background-color: rgb(249, 246, 255);
}
/*달력내용*/
.fc-event-title-container {
    height: 13px;
}
.fc-event-title {
    font-size: 2px;
}
/*오늘날짜*/
.fc .fc-daygrid-day.fc-day-today {
    background-color: rgb(245, 249, 246);
}

</style>
</head>
<body>
    <jsp:include page="../common/menubar.jsp"/>
<div class="outer">
    <div class="calender-area">
        <div id='calendar'></div>

    </div>
    <script>
        document.addEventListener('DOMContentLoaded', function() {
        var calendarEl = document.getElementById('calendar');

        var calendar = new FullCalendar.Calendar(calendarEl, {
            businessHours: true,
            dayMaxEvents: true, // 일정이 너무 많으면 more
            expendRows:true, // 화면에 맞게 높이 재설정
            headerToolbar: {
                left: '',
                center: 'title',
                right: ''
            },
            nowIndicator: true, // 현재 시간 마크
            navLinks:false, // 달력상의 날짜를 클릭할 수 있는지 여부, 클릭시 일 달력/주 달력으로 넘어감(Boolean, default:false/Demo)
            //locale: 'ko',
            day:'numeric',
            navLinks: true, // can click day/week names to navigate views
            // 여기서부터 날짜 클릭 시 이벤트
            //selectable: true,
            //selectMirror: true,
            
            events: [
            $(function(){
                    $.ajax({
                        url:"selectSchedule.emp",
                        dataType:"JSON",
                        type:"GET",
                        success:function(sList){
                            
                            for(let i=0; i<sList.length; i++){
                                calendar.addEvent({
                                    groupId: sList[i].schNo,
                                    title: sList[i].schTitle,
                                    start: sList[i].schBegin,
                                    end: sList[i].schEnd,
                                    color: sList[i].groupColor
                                })
                            }

                        }, error: function(){
                            console.log("일정조회 ajax 통신실패")
                        }
                        
                    })
                })

            ]
        });

        calendar.render();
    });

    </script>



    <div>
        <!-- 근태 체크 버튼 영역-->
        <div class="ess-area">

            <div class="essBtn-area">
                <div id="essDate"></div>
                <div id="essClock"></div>
                <div class="btnWrap">
                    <button type="button" id="essStart" onclick="startResult(${at.attNo});">출근</button>
                    <button type="button" id="essEnd" onclick="endResult(${at.attNo});">퇴근</button>
                </div>
                <div class="btnPut">
                    <span id="startResult" style="margin-left:47px;">
                        <c:choose>
                            <c:when test="${not empty loginUser.startTime}">
                                ${loginUser.startTime}
                            </c:when>
                            <c:otherwise>
                                ${at.startTime}
                            </c:otherwise>
                        </c:choose>
                    </span>
                    <span id="endResult" style="margin-left:13px;">
                        <c:choose>
                            <c:when test="${not empty loginUser.endTime}">
                                ${loginUser.endTime}
                            </c:when>
                            <c:otherwise>
                                ${at.endTime}
                            </c:otherwise>
                        </c:choose>
                    </span>
                </div>
            </div>
        

            

        </div>
        <div class="plan">
                
            <!-- <div class="calender-area">
                <div id='calendarList'></div>
        
            </div>
            <script>
                document.addEventListener('DOMContentLoaded', function() {
                var calendarEl = document.getElementById('calendarList');
        
                var calendar = new FullCalendar.Calendar(calendarEl, {
                    businessHours: true,
                    dayMaxEvents: true, // 일정이 너무 많으면 more
                    expendRows:true, // 화면에 맞게 높이 재설정
                    headerToolbar: {
                        left: '',
                        center: 'title',
                        right: ''
                    },
                    nowIndicator: true, // 현재 시간 마크
                    navLinks:false, // 달력상의 날짜를 클릭할 수 있는지 여부, 클릭시 일 달력/주 달력으로 넘어감(Boolean, default:false/Demo)
                    //locale: 'ko',
                    day:'numeric',
                    navLinks: true, // can click day/week names to navigate views
                    // 여기서부터 날짜 클릭 시 이벤트
                    //selectable: true,
                    //selectMirror: true,
                    views: {
                        listDay: { buttonText: 'list day' },
                        listWeek: { buttonText: 'list week' }
                    },
                    initialView: 'listWeek',
                    events: [
                    $(function(){
                            $.ajax({
                                url:"selectSchedule.emp",
                                dataType:"JSON",
                                type:"GET",
                                success:function(sList){
                                    
                                    for(let i=0; i<sList.length; i++){
                                        calendar.addEvent({
                                            groupId: sList[i].schNo,
                                            title: sList[i].schTitle,
                                            start: sList[i].schBegin,
                                            end: sList[i].schEnd,
                                            color: sList[i].groupColor
                                        })
                                    }
        
                                }, error: function(){
                                    console.log("일정조회 ajax 통신실패")
                                }
                                
                            })
                        })
        
                    ]
                });
        
                calendar.render();
            });
        
            </script> -->




        </div>
    </div>
</div>
    <script>
        $(function(){
            var today = new Date();
            var year = today.getFullYear();
            var month = ('0' + (today.getMonth() + 1)).slice(-2);
            var day = ('0' + today.getDate()).slice(-2);
            var week = new Array('일', '월', '화', '수', '목', '금', '토');

            var dateString = year + '년 ' + month  + '월 ' + day + '일' + '(' + week[today.getDay()] + ')';
            $("#essDate").text(dateString);

        })
    </script>
    <script>
        function setClock(){
            var dateInfo = new Date(); 
            var hour = modifyNumber(dateInfo.getHours());
            var min = modifyNumber(dateInfo.getMinutes());
            var sec = modifyNumber(dateInfo.getSeconds());
            document.getElementById("essClock").innerHTML = hour + " : " + min  + " : " + sec;
        }
        function modifyNumber(time){
            if(parseInt(time)<10){
                return "0"+ time;
            }
            else
                return time;
        }
        window.onload = function(){
            setClock();
            setInterval(setClock,1000); //1초마다 setClock 함수 실행
        }
    </script>
    <script>
        $(function(){
            if(${not empty at.startTime}){
                $("#essStart").attr("disabled", true);
            }

            if(${not empty at.endTime}){
                $("#essEnd").attr("disabled", true);
            }
            
        })

        function startResult(no){
            $.ajax({
                url:"insertStart.at",
                data:{attNo:no},
                success:function(start){
                    //console.log(result);
                    location.replace("mainPage.ess");
                },
                error:function(){
                    console.log("출근시간입력 ajax통신실패");
                }
            })
        }

        function endResult(no){
            $.ajax({
                url:"insertEnd.at",
                data:{attNo:no},
                success:function(end){
                    //console.log(end);
                    location.replace("mainPage.ess");
                },
                error:function(){
                    console.log("출근시간입력 ajax통신실패");
                }
            })
        }

        
    </script>

   
    
    



</body>
</html>