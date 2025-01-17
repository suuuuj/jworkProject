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
        /* max-width: 900px; */
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
    /*오늘 날짜*/
    .fc .fc-daygrid-day.fc-day-today {
        background-color: rgb(245, 249, 246);
    }
    /*more버튼*/ 
    .fc-daygrid-more-link.fc-more-link{
        color: rgb(50, 50, 50);
    }
    /*일정시간*/
    .fc-daygrid-event > .fc-event-time{
        color:rgb(122, 134, 127);
        font-size: 12px;
    }
    /*시간제목*/
    .fc-event-title{
        color:rgb(50, 50, 50) !important; 
        font-size: 12px;
    }
    .fc-event-time{
        font-size: 12px;
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
        background-color: rgb(249, 247, 255);
    }
    /*목록*/
    .fc-list-table a {
        color: rgb(50, 50, 50);
    }
    .fc-list-day-side-text, .fc-list-day-text, .fc-list-event-time, .fc-list-event-title {
        font-size: 14px;
    }
    .fc-col-header-cell-cushion, .fc-timegrid-slot-label-cushion {
        font-size: 14px;
    }
    .fc-daygrid-body-unbalanced, .fc-daygrid-body-natural {
        display: none;
    }

    /*일정 상세 모달*/
    #editSchedule, #editSchedule input, #editSchedule select { 
        font-size: 14px;
    }
    #schBtn-area2 {
        margin-left: 35%;
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
        
        // document.addEventListener('DOMContentLoaded', function() {
        function calendarRendering(eventArr) {
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
                
                navLinks: true, // can click day/week names to navigate views

                // 여기서부터 날짜 클릭 시 이벤트   
                selectable: true,
                selectMirror: true,
                select: function(arg) {
                    console.log(arg);
                },

                // 일정 클릭시 상세 조회 (수정, 삭제)
                eventClick: function(arg) {  
                    viewDetail(arg.event._def.groupId);
                    console.log(arg);
                },
                
                //일정 조회해오기
                events: eventArr
            });
            calendar.render();
        };
 
    </script>

    <!-- 일정수정/삭제 모달 -->
    <div class="modal fade" id="editSchedule" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-lg">
          <div class="modal-content">   
            <div class="modal-body">  
                <form id="edit-area" action="updateSchedule.emp">
                    <div class="schDetail">
                        <div style="text-align: center; font-size: 18px;">일정 상세</div><br>
                        <input type="hidden" name="schNo" value="">
                        <input type="hidden" name="attendanceOld" value="">
                        <input type="hidden" name="enrollEmpNo">
                        <div id="schTitle">
                            <input type="text" id="schTitle2" class="form-control" name="schTitle" placeholder="제목" required>
                        </div>
                        <div>
                            <div>
                                <input class="startDate" id="startDate2" type="text" placeholder="연도-월-일" name="schBegin" value="" required>           
                            </div>
                            <div class="form-group">
                                <select class="form-control" id="startTime2" name="timeBegin" onchange="startTimeChange()">
                                    <option value="09:00">오전 09:00</option>
                                    <option value="09:30">오전 09:30</option>
                                    <option value="10:00">오전 10:00</option>
                                    <option value="10:30">오전 10:30</option>
                                    <option value="11:00">오전 11:00</option>
                                    <option value="11:30">오전 11:30</option>
                                    <option value="12:00">오후 12:00</option>
                                    <option value="12:30">오후 12:30</option>
                                    <option value="13:00">오후 01:00</option>
                                    <option value="13:30">오후 01:30</option>
                                    <option value="14:00">오후 02:00</option>
                                    <option value="14:30">오후 02:30</option>
                                    <option value="15:00">오후 03:00</option>
                                    <option value="15:30">오후 03:30</option>
                                    <option value="16:00">오후 04:00</option>
                                    <option value="16:30">오후 04:30</option>
                                    <option value="17:00">오후 05:00</option>
                                    <option value="17:30">오후 05:30</option>
                                    <option value="18:00">오후 06:00</option>
                                    <option value="18:30">오후 06:30</option>
                                    <option value="19:00">오후 07:00</option>
                                </select>
                            </div>
                                  
                            <div style="width:30px; float: left; text-align: center; line-height: 35px;">~</div>
         
                            <div>
                                <input class="endDate" id="endDate2" type="text" placeholder="연도-월-일" name="schEnd" value="">
                            </div>
                            <div class="form-group">
                                <select class="form-control" id="endTime2" name="timeEnd"> 
                                    <option value="10:00">오전 10:00</option>
                                    <option value="10:30">오전 10:30</option>
                                    <option value="11:00">오전 11:00</option>
                                    <option value="11:30">오전 11:30</option>
                                    <option value="12:00">오후 12:00</option>
                                    <option value="12:30">오후 12:30</option>
                                    <option value="13:00">오후 01:00</option>
                                    <option value="13:30">오후 01:30</option>
                                    <option value="14:00">오후 02:00</option>
                                    <option value="14:30">오후 02:30</option>
                                    <option value="15:00">오후 03:00</option>
                                    <option value="15:30">오후 03:30</option>
                                    <option value="16:00">오후 04:00</option>
                                    <option value="16:30">오후 04:30</option>
                                    <option value="17:00">오후 05:00</option>
                                    <option value="17:30">오후 05:30</option>
                                    <option value="18:00">오후 06:00</option>
                                    <option value="18:30">오후 06:30</option>
                                    <option value="19:00">오후 07:00</option>
                                    <option value="19:30">오후 07:30</option>
                                    <option value="20:00">오후 08:00</option>
                                </select>
                            </div>
                            
                            
                        </div>
    
                        <table id="scheduleArea">
                            <tr>
                                <th>내 캘린더</th>
                                <td>
                                    <select name="groupNo" id="group2">
                                        
                                    </select>
                                </td>
                            </tr>
                            <tr>
                                <th>참석자 추가</th>
                                <td>
                                    <div id="editAttInput" style="width: 500px;">
                                        <div id="editAttInput2">
                                            <ul id="editAtt-list"></ul>
                                            <input type="text" id="attendee2" name="attendance">
                                        </div>
                                    </div>
                                    <div id="chartInput2">
                                        <button type="button" id="chart" class="btn btn-sm dropdown-toggle plus" type="button" data-bs-toggle="dropdown" data-bs-auto-close="outside">+</button>
                                        <li class="dropdown-menu">
                                            <div class="employeeChart">
                                                <ul class="treeA" class="filetree treeview-famfamfam">
                
                                                </ul>
                                            </div>
                                        </li>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <th>장소</th>
                                <td>
                                    <input type="text" id="place2" name="schPlace" style="width: 500px;">
                                    <!-- <button class="plus">+</button> -->
                                </td>
                            </tr>
                            
                            <tr>
                                <th style="vertical-align: top;">내용</th>
                                <td>
                                    <textarea name="schContent" id="schContent2" rows="10" style="resize:none" required></textarea>
                                </td>
                            </tr>
                        </table>
                        
                    </div>
                    <div id="schBtn-area2">
                        <button type="submit" class="btn btn-success btn-sm" style="width:70px" >수정</button>
                        <button type="button" class="btn btn-success btn-sm" style="width:70px" onclick="deleteSchedule($('input[name=schNo]').val(), $('input[name=enrollEmpNo]').val())">삭제</button>
                        <button type="button" class="btn btn-outline-success btn-sm" style="width:70px" data-bs-dismiss="modal" onClick="window.location.reload()">취소</button>
                    </div><br><br>
                </form>
            </div>
            <script>
            // 주소록에서 사원 클릭할 때
            $(document).on("click", "#editSchedule .emp", function(){

                const empNo = $(this).attr("empNo");
                const empName = $(this).attr("empName");

                if($("#editAtt-list").children().length == 0){ 
                // li 요소가 없을 때
                    $("#editAtt-list").append($("<input type='hidden' name='attendance' value='" + empNo + "'><input type='hidden' name='attendee2' value='" + empName + "'><li class='editAtt-li'>" + empName + "</li><div class='editAtt-delete'>&times;</div>"));
                    $("#editAtt-list").css("width", "$('#editAtt-list').children().eq(0).val().length + 30");
                } else { 
                // li 요소가 있을 때
                    for(let i=0; i<$("#editAtt-list").children().length; i++){
                        if($("#editAtt-list").children().eq(i).val() == empNo){
                            alert("중복된 사람입니다.");
                            return;
                        }
                    }
                    $("#editAtt-list").append($("<input type='hidden' name='attendance' value='" + empNo + "'><input type='hidden' name='attendee2' value='" + empName + "'><li class='editAtt-li'>" + empName + "</li><div class='editAtt-delete'>&times;</div>"));   
                }
            })

            // 사번으로 참석자 조회
            $("#attendee2").keydown(function(){
                    if(event.keyCode == 13 || event.keyCode == 32){ // 13 enter, 32 space
                        event.preventDefault(); // 기본동작 방지(안쓰면 엔터했을 때 폼의 다른 영역에 영향을 줄 수 있음)
                        let attendee2 = $(this).val();

                        $.ajax({
                            url: "selectAttendee.emp",
                            data:{empNo:attendee2},
                            success: function(e){
                                console.log(e);
                                if(e == null){
                                    alert("일치하는 사원이 없습니다.");
                                    $("#attendee2").val("");
                                    $("#attendee2").focus();
                                } else{
                                    if($("#editAtt-list").children().length == 0){ // li 요소 있을 때
                                        $("#editAtt-list").append($("<input type='hidden' name='attendance' value='" + e.empNo + "'><input type='hidden' name='attendanceName' value='" + e.empName + "'><li class='editAtt-li'>" + e.empName + "</li><div class='editAtt-delete'>&times;</div>")); //&times; x 기호
                                        $("#editAtt-list").css("width", "$('#editAtt-list').children().eq(0).val().length + 30");
                                        $("#attendee2").val("");
                                        $("#attendee2").focus();
                                    } else{ // li 요소 없을 때
                                        for(let i=0; i<$("#editAtt-list").children().length; i++){
                                            if($("#editAtt-list").children().eq(i).val() == e.empNo){
                                                alert("중복된 사원입니다.");
                                                $("#attendee2").val("");
                                                $("#attendee2").focus();
                                                return;
                                            }
                                        }
                                        $("#editAtt-list").append($("<input type='hidden' name='attendance' value='" + e.empNo + "'><input type='hidden' name='attendanceName' value='" + e.empName + "'><li class='editAtt-li'>" + e.empName + "</li><div class='editAtt-delete'>&times;</div>"));
                                        $("#attendee2").val("");
                                        $("#attendee2").focus();
                                    }
                                }  
                            }, error:function(){
                                console.log("사원 조회용 ajax 통신 실패");
                            }
                        })
                    }
                });

                // x 버튼 눌러서 참석자 목록에서 제거
                $(document).on("click", ".editAtt-delete", function(){
                    $(this).prev().prev().prev().remove();
                    $(this).prev().prev().remove();
                    $(this).prev().remove();
                    $(this).remove();
                })
                
            </script>
          </div>
        </div>
    </div>

    <script>
        // 일정 상세 조회
        function viewDetail(schNo){
            $.ajax({
                url:"selectScheduleDetail.emp",
                data:{schNo:schNo},
                success: function(data){
                    $('#schTitle2').val(data.s.schTitle);
                    $('#startDate2').val(data.s.schBegin);
                    $('#startTime2').val(data.s.timeBegin);
                    $('#endDate2').val(data.s.schEnd);
                    $('#endTime2').val(data.s.timeEnd);
                    $('#group2').val(data.s.groupName);
                    $('#place2').val(data.s.schPlace);
                    $('#schContent2').val(data.s.schContent);

                    let attendee = ""
                    for(let j=0; j<data.alist.length; j++){
                        attendee += "<input type='hidden' name='attendance' value='" + data.alist[j].empNo + "'><input type='hidden' name='attendanceName' value='" + data.alist[j].empName + "'><li class='editAtt-li'>" + data.alist[j].empName + "</li><div class='editAtt-delete'>&times;</div>"
                    }
                    $("#editAtt-list").html(attendee);

                    
                    for(let i=0; i<data.slist.length; i++){
                        $("#group2").append(
                            '<option id="' + data.slist[i].groupNo + '" value="'+ data.slist[i].groupNo +'">'+ data.slist[i].groupName +'</option>'
                        )
                                            
                        if(data.slist[i].groupNo==data.s.groupNo){
                            $('#' + data.slist[i].groupNo).attr('selected', true);
                        }
                    }
                    

                    $("input[name=schNo]").val(schNo);
                    $("input[name=attendanceOld]").val(data.s.attendance);
                    $("input[name=enrollEmpNo]").val(data.s.empNo);

                    $("#editSchedule").modal("show");
                }, error: function(){
                    console.log("일정상세조회 ajax 통신실패")
                },

            })
        }

        // 일정 삭제
        function deleteSchedule(schNo, enrollEmpNo){
            if(confirm("일정을 삭제하시겠습니까?")){
                $.ajax({
                    url:"deleteSchedule.emp",
                    data:{schNo: schNo},
                    success: function(result){
                        if(result == "success"){
                            alert('삭제완');
                            document.location.href = document.location.href;
                        }
                        if(result == "fail"){
                            alert('일정을 등록한 사람만 삭제할 수 있습니다~~');
                        }
                    }, error: function(){
                        console.log("일정 삭제 ajax 통신실패");
                    }
                })
            }
        }
        
    </script>

    <script>
        // 체크된 캘린더 조회하기 위한
        $("#calendar").on("click", "input[type='checkbox']", function(){
            console.log($(this).is(":checked"))
            
            if($(this).is(":checked")){
                $('#calendar').find("."+$(this).attr("id")).show();
                console.log($(this))
                
            }else{
                $('#calendar').find("."+$(this).attr("id")).hide();
            }
        });

        // 체크되어있는 캘린더 번호
        check=[];

        $(function(){
            $(".checkSchGroup").each(function(){
                if($(this).is(":checked") == true){
                    check.push($(this).next().val());
                }
            })
            console.log("체크된 그룹번호들", check);

            selectScheduleList();
        })

        


        // 체크 이벤트 발생시 캘린더 번호 arr로
        $(document).on("click", ".checkSchGroup", function(){
            check=[];
            $(".checkSchGroup").each(function(){
                if($(this).is(":checked") == true){
                    check.push($(this).next().val());
                }
            })
            console.log(check);

            let eventArr = [];

            for(let i=0; i<check.length; i++){
                for(let j=0; j<schedules.length; j++){
                    if(check[i] == schedules[j].groupNo){
                        let eventObj = {
                            groupId: schedules[j].schNo,
                            title: schedules[j].schTitle,
                            start: schedules[j].schBegin + " " + schedules[j].timeBegin, 
                            end: schedules[j].schEnd + " " + schedules[j].timeEnd,
                            color: schedules[j].groupColor



                            

                        }
                        eventArr.push(eventObj);
                    }
                }
            }
            calendarRendering(eventArr);
        })

        let schedules;
        function selectScheduleList(){
            $.ajax({
                url:"selectSchedule.emp",
                dataType:"JSON",
                type:"post",
                success:function(sList){

                    console.log(sList);

                    schedules = sList;
                    let eventArr = [];
                    for(let c=0; c<check.length; c++){
                        // check[c] = > groupNo
                        for(let i=0; i<sList.length; i++){
                            //sList[i].groupNo => groupNo  // groupNo 조회해오기!!!!!
                            if(check[c] == sList[i].groupNo){
                                let eventObj = {
                                    groupId: sList[i].schNo,
                                    title: sList[i].schTitle,
                                    start: sList[i].schBegin + " " + sList[i].timeBegin,
                                    end: sList[i].schEnd + " " + sList[i].timeEnd,
                                    color: sList[i].groupColor
                                }
                                eventArr.push(eventObj);
                            }   
                        }
                    }

                    calendarRendering(eventArr);   
                }, error: function(){
                    console.log("일정조회 ajax 통신실패")
                }   
            })
        }

    </script>

</body>
</html>