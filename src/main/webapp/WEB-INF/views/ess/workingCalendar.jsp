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
                /*
                {
                //title:String, 이벤트에 표시될제목,
                //start:Date object, 이벤트 시작 날짜(& 시간),
                //end:Date object, 이벤트 종료 날짜(& 시간),
                //groupid:String, 이벤트그룹, 이벤트 드래그/리사이징 할 경우 동일한 그룹 이벤트들은 자동으로 같이 수정됨,
                //editable:Boolean, 이벤트 드래그, 리사이징 등의 편집여부를 설정함(default:false)
                
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
                            console.log(map);
                            for(i=0; i<map.alist.length; i++){
                                calendar.addEvent({
                                    title: "①출근 " + map.alist[i].startTime ,
                                    start: map.alist[i].startTime,
                                    color:'rgb(224, 224, 224)',
                                    textColor:'rgb(51, 51, 51)'
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
        text-align: center;
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