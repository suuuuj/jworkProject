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
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/flatpickr/dist/flatpickr.min.css">
<link rel="stylesheet" type="text/css" href="https://npmcdn.com/flatpickr/dist/themes/confetti.css">
<script src="https://cdn.jsdelivr.net/npm/flatpickr"></script>
<script src="https://npmcdn.com/flatpickr/dist/l10n/ko.js"></script>


<style>
	.innerOuter{
        border: 1px solid black;
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
        margin-left: 80%;
        margin-bottom: -8px;
    }
    #schBtn-area button{
        margin: 3px;
    }

    #fileDiv{
        border: 1px solid gainsboro;
        padding: 15px;
        border-radius: 5px;
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
                        <input type="text" id="title" class="form-control" name="noticeTitle" required>
                    </div>
                    <div>
                        <!--플랫피커-->
                        <div style="width:150px; float: left;">
                            <input class="" id="startDate" type="text" placeholder="연도-월-일" value="" onchange="startDateChange()" required>
                        </div>
                       
                        <div class="form-group" style="width: 150px; float: left;">
                            <select class="form-control" id="start" onchange="startTimeChange()">
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
                              
                        <div style="width:30px; float: left; text-align: center;">~</div>

                        <!--플랫피커-->      
                        <div style="width:150px; float: left;">
                            <input class="" id="endDate" type="text" placeholder="연도-월-일" value="">
                        </div>
                        <div class="form-group" style="width: 150px; float: left;">
                            <select class="form-control" id="end">
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
                        <div>
                            <input type="checkbox" class="form-check-input" value="" name="allDay">종일
                        </div>
                        
                    </div>
                    <br>
                    <div>내 캘린더</div>
                    <div>참석자 추가</div>
                    <div>장소</div>
                    <hr>
                    


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


    <script>
        var startDate = flatpickr(document.getElementById("startDate"), {
            'monthSelectorType' : 'static',
            "locale": "ko",
            // "enableTime": true,
            // "minuteIncrement": 30,
            "altInput": true,   //기존 입력을 숨기고 새 입력을 만듦
            "altFormat": 'Y-m-d', //날짜 선택 후 표시 형태 Y-m-d H:i
            "dateFormat": 'Y-m-d' // date format 형식
            // "defaultDate": "00:00"
        });

        var endDate = flatpickr(document.getElementById("endDate"), {
            'monthSelectorType' : 'static',
            "locale": "ko",
            "altInput": true,
            "altFormat": 'Y-m-d', 
            "dateFormat": 'Y-m-d'
        });

        // 시작날짜 종료날짜
        function startDateChange(){
            var start = $('#startDate').val();
            var end  = $('#endDate').val();
            
            if($('#startDate').click()){
                end = start;
            }
            if($('#endDate').click()){
                end = $('#endDate').val();
            }

            
                
            
            // if(end == null){
            //     end = start;
            // }

            console.log("end : " + end);
        }

        // 시작시간 종료시간
        function startTimeChange(){
            var start = $('#start').val();
            var end  = $('#end').val();
            if(start.substring(3, 5) == '00')
                // end = start.substring(0, 2) + ':30';
                end = (parseInt(start.substring(0, 2))+1) + ':00';
            else
                end = (parseInt(start.substring(0, 2))+1) + ':30';
            
            $('#end').val(end);
        }

        
    </script>
   
</html>