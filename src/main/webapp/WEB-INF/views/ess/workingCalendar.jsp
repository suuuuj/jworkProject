<%@ page language="java" contentType=`"text/html; charset=UTF-8"
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
<!-- fullcalendar CDN -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/fullcalendar@5.10.1/main.css">
<script src="https://cdn.jsdelivr.net/npm/fullcalendar@5.10.1/main.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.18.1/moment.min.js"></script>
<!-- fullcalendar 언어 CDN -->
<script src='https://cdn.jsdelivr.net/npm/fullcalendar@5.8.0/locales-all.min.js'></script>
<script>

    document.addEventListener('DOMContentLoaded', function(){
        
        var calendarEl = document.getElementById('calendar');

        var calendar = new FullCalendar.Calendar(calendarEl, {
            
            //initialView: 'dayGridMonth', // 초기 로드 될때 보이는 캘린더 화면(기본설정:달)
            height:'700px', // calendar 높이 설정
            expendRows:true, // 화면에 맞게 높이 재설정
            //aspectRatio:1.35;, // 가로세로비율정해줌. 창 크기에따라 달라지는 비율 유지
            //plugins: ['interaction', 'dayGrid'],

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
            /*
            navLinkDayClick: function(date.jsEvent){
                console.log('day',date.toISOString());
                console.log('coords',jsEvent.pageX,jsEvent.pageY);
                // 달력날짜숫자를 클릭했을때 어떤 행동을 하게 할건지 설정해주는 메뉴
            }
            */
            //editable:false, // 기존에입력되어있는 event를 드래그로 움직일 수 있도록 해주는 설정
            //selectable:true, // 달력날짜를 드래그해서 여러날짜를 지정할 수 있다
            eventLimit:true, // 달력상에 셀 크기보다 많은 이벤트가 등록되어 있는 경우 'more'로 표기함(Boolean, default:false)
            locale: 'ko', // 한국어설정
            /*
            eventAdd: function(obj){ 
                // 이벤트가 추가되면 발생하는 이벤트
            },
            eventChange: function(obj){
                // 이벤트가 수정되면 발생하는 이벤트
            },
            eventRemove: function(obj){
                // 이벤트가 삭제되면 발생하는 이벤트
            },
            */
            events:[
                {
                //title:String, 이벤트에 표시될제목,
                //start:Date object, 이벤트 시작 날짜(& 시간),
                //end:Date object, 이벤트 종료 날짜(& 시간),
                //groupid:String, 이벤트그룹, 이벤트 드래그/리사이징 할 경우 동일한 그룹 이벤트들은 자동으로 같이 수정됨,
                //editable:Boolean, 이벤트 드래그, 리사이징 등의 편집여부를 설정함(default:false)
                
                //title:'출근' + 출근시간,
                //start:근무날짜
                title:'①출근' +' ' + '08:55:53',
                color:'rgb(224, 224, 224)',
                textColor:'rgb(51,51,51)',
                start:'2023-03-07'
                },
                {
                    //title:'퇴근' + 퇴근시간,
                    //start:근무날짜
                    title:'②퇴근' +' ' + '18:05:07',
                    color:'rgb(224, 224, 224)',
                    textColor:'rgb(51,51,51)',
                    start:'2023-03-07'
                },
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
                },
                {
                    //title:'출근' + 출근시간 (지각)
                    title:'①출근' +'  ' + '09:20:02',
                    color:'rgba(241, 196, 15, 0.72)',
                    textColor:'rgb(50,50,50)',
                    start:'2023-03-09'
                },
                {
                    title:'②퇴근' +' ' + '18:05:07',
                    color:'rgb(224, 224, 224)',
                    textColor:'rgb(51,51,51)',
                    start:'2023-03-09'
                },
                {
                    //title:'출장'
                    //start:출장시작날짜 + end:출장끝날짜(출장마지막날 + 1)
                    title:' ' + '출장',
                    start:'2023-03-13',
                    end:'2023-03-16',
                    color:'rgb(41, 128, 185)',
                    textColor:'white'
                },
                {
                    //title:'출장'
                    //start:출장시작날짜 + end:출장끝날짜
                    title:' ' + '출장',
                    start:'2023-03-25',
                    color:'rgb(41, 128, 185)',
                    textColor:'white'
                },
                {
                    //title:'결근'
                    title:'결근',
                    start:'2023-03-29',
                    color:'rgba(192, 57, 43, 0.79)'
                },
                {
                    //title:'휴가'
                    title:'휴가',
                    start:'2023-03-17',
                    color:'rgba(39, 174, 96, 0.72)',
                    textColor:'white'
                }

            ]
    });

    calendar.render();
});
</script>
<title>Insert title here</title>
<style>
    /* outer영역 */
    .outer{
        width:960px;
        height:1000px;
        border:1px solid black;
    }

    /* 메뉴바 */
    .title{
        color:rgb(50,50,50);
        margin-left: 30px;
        margin-top:30px;
    }
    .selectBar{
        margin-left: 30px;
    }
    .selectBar>span{
        color:rgba(50, 50, 50, 0.79);
        font-size:15px;
        font-weight: 600;
    }
    .selectBar>div{
        margin-top:10px;
        height:3px;
        float: left;
    }
    /* content영역 */
    .work-area{
        margin-left:30px;
        margin-right: 30px;
        margin-top: 30px;
    }
    .workTable{
        margin:auto;
        text-align: center;
        width:900px;
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
    <div class="outer">

        <div class="title">
            <h3 style="color:rgb(50,50,50); font-weight: 600;">근무<h3> 
        </div>
        <br>
        <div class="selectBar">
            <span>&nbsp;근태현황</span>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span>근태이력</span> 
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span>근태수정</span> 
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:rgb(0, 172, 0)">근태조정</span>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:rgb(0, 172, 0)">근태관리</span>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:rgb(0, 172, 0)">근태통계</span>
            <br>
            <div style="width:67px; background: rgb(170, 170, 170);">&nbsp;</div>
            <div style="width:160px; background: rgb(234, 234, 234);">&nbsp;</div>
            <div style="width:684px; background: rgb(234, 234, 234);">&nbsp;</div>
        </div>


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
                            <td>32시간 00분</td>
                            <td>3시간 23분</td>
                            <td>20시간 00분</td>
                            <td>86시간 36분</td>
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