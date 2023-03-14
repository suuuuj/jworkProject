<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!--제이쿼리-->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>

<!-- 부트스트랩 5버전 -->
<!-- Latest compiled and minified CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet"> 
<!-- Latest compiled JavaScript -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script> 

<!--flatpickr-->
<!-- <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/flatpickr/dist/flatpickr.min.css">
<link rel="stylesheet" type="text/css" href="https://npmcdn.com/flatpickr/dist/themes/confetti.css">
<script src="https://cdn.jsdelivr.net/npm/flatpickr"></script>
<script src="https://npmcdn.com/flatpickr/dist/l10n/ko.js"></script> -->



<style>
	.innerOuter{
        /* border: 1px solid black; */
        margin: 20px;
    }
    .schDetail{
        border: 1px solid gainsboro;
        margin: 20px;
        padding: 30px;
        /* height: 700px; */
    }
    /*수정 삭제 버튼*/
    #schBtn-area{
        /* border: 1px solid blue; */
        display: inline-block;
        margin-left: 42%;
    }
    #schBtn-area button{
        margin: 3px;
    }


    #enroll-area input, #enroll-area select, #enroll-area label, #enroll-area table {
        font-size: 14px; color: rgb(47, 47, 47);
    }

    #schTitle {
        margin: 1.5px; 
        width: 755px;
    }

    #startDate, #endDate, #startTime, #endTime {
        width: 130px; height: 35px;
        margin: 3px;
        border-radius: 5px; border: 1px solid gainsboro;
        float: left;
    }
    #startDate, #endDate {
        padding: 10px;
    }
    #chkAllDay {
        display: inline;
        margin-left: 40px; 
        line-height: 35px; 
    }
    #allDay {
        margin-top: 10px;
    }

    #scheduleArea {
        margin: 7px;
    }
    #scheduleArea th {
        width: 100px;
        font-weight: 500;
    }
    #scheduleArea td {
        height: 40px;
        width: 650px;
    }
    #group, #attendee, #place {
        width: 200px; height: 35px;
        border-radius: 5px; border: 1px solid gainsboro;
        padding: 5px;
    }
    .plus {
        border: 1px solid gainsboro; border-radius: 5px;
        background-color: white;
        width: 35px; height: 35px;
    }
    textarea {
        width: 650px;
        border: 1px solid gainsboro; border-radius: 5px;
    }







</style>
</head>
<body>
	<jsp:include page="../common/scheduleMenubar.jsp"/>
	<div class="content">
        <div class="innerOuter">
            <form id="enroll-area">
    
                <div class="schDetail">
  
                    <div id="schTitle">
                        <input type="text" id="schTitle" class="form-control" name="noticeTitle" placeholder="제목" required>
                    </div>
                    
                    <div>
                        <!--플랫피커-->
                        <div>
                            <input class="" id="startDate" type="text" placeholder="연도-월-일" value="" required>           
                        </div>
                        <div class="form-group">
                            <select class="form-control" id="startTime" name="startTime" onchange="startTimeChange()">
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

                        <!--플랫피커-->      
                        <div>
                            <input class="" id="endDate" name="endDate" type="text" placeholder="연도-월-일" value="">
                        </div>
                        <div class="form-group">
                            <select class="form-control" id="endTime" name="endTime">
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
                                <option value="19:30">오후 07:30</option>
                                <option value="20:00">오후 08:00</option>
                            </select>
                        </div>
                        <div id="chkAllDay">
                            <input type="checkbox" id="allDay" class="form-check-input" value="" name="allDay">
                            <label for="allDay">종일</label>
                        </div>
                        
                    </div>

                    <table id="scheduleArea">
                        <tr>
                            <th>내 캘린더</th>
                            <td>
                                <select name="" id="group">
                                    <option value="">(기본) 내 일정</option>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <th>참석자 추가</th>
                            <td>
                                <input type="text" id="attendee" style="width: 500px;">
                                <button class="plus">+</button>
                            </td>
                        </tr>
                        <tr>
                            <th>장소</th>
                            <td>
                                <input type="text" id="place" style="width: 500px;">
                                <button class="plus">+</button>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2" style="height: 4px;"></td>
                        </tr>
                        <tr>
                            <th style="vertical-align: top;">내용</th>
                            <td>
                                <textarea name="" id="" rows="20" style="resize:none"></textarea>
                            </td>
                        </tr>
                    </table>
                    


                    <br>
                    
    
                </div>
                <div id="schBtn-area">
                    <button class="btn btn-success btn-sm" style="width:70px" onclick="location.href=''">등록</button>
                    <button class="btn btn-outline-success btn-sm" style="width:70px" onclick="location.href=''">취소</button>
                </div> 
            </form>
            <br>
            

        </div>
    </div>

    

    <!-- 데이트 피커 -->
    <link rel="stylesheet" href="http://code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css"/>
    <script src="http://code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script>
    <script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/i18n/datepicker-ko.js"></script>
    <script>
    // var today = new Date();
    // var tomorrow = new Date(Date.parse(today) + (1000 * 60 * 60 * 24));
    $(function(){
        //시작일 종료일
        $('#startDate, #endDate').datepicker({
            //showMonthAfterYear: true, //연도,달 순서로 지정
            //changeMonth: true,//달 변경 지정
            //dateFormat:"yy-mm-dd",//날짜 포맷
            //dayNamesMin: ["일", "월", "화", "수", "목", "금", "토" ],//요일 이름 지정
            //monthNamesShort: ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12"],//월 이름 지정
            minDate:0, //오늘 이전 날짜를 선택할 수 없음
            onClose:function(selectedDate){
                $('#endDate').datepicker("option", "minDate", selectedDate);
                var startDate = $.datepicker.formatDate("yy-mm-dd", $("#startDate").datepicker("getDate"));    
                var endDate = $.datepicker.formatDate("yy-mm-dd", $("#endDate").datepicker("getDate"));
                // 종료일 입력안하면 시작일이 종료일...
                // if(startDate>endDate){
                //     endDate = startDate;
                //     // $('input[name=endDate]').attr('value', endDate);
                //     $('#endDate').val = endDate;
                // }              
            },
            // 시작일 선택 시 종료일 같은 값 자동으로 넘기기
            onSelect:function(selected, evnt){
                fnChangeEnd(selected);
            }       
        });
        function fnChangeEnd(value) {
            $("#endDate").val(value);
        }
        

        
    })
    

    // 시작시간 종료시간
    function startTimeChange(){
        var start = $('#startTime').val();
        var end  = $('#endTime').val();
        if(start.substring(3, 5) == '00')
            // end = start.substring(0, 2) + ':30';
            end = (parseInt(start.substring(0, 2))+1) + ':00';
        else
            end = (parseInt(start.substring(0, 2))+1) + ':30';
        
        $('#endTime').val(end);
    }

   </script>
</html>