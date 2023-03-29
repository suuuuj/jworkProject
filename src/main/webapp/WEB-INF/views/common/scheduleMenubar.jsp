<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
    <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
    <!-- jQuery library -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
    <!-- Popper JS -->
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <!-- Latest compiled JavaScript -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
    <!-- 구글 글씨체 -->
	<link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic:wght@400;700&display=swap" rel="stylesheet">
    <!-- sweetalert -->
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    <!-- 조직도 트리 -->
    <script src="http://code.jquery.com/jquery-latest.js"></script> 
    <link rel="stylesheet" type="text/css" href="resources/css/treeview/jquery.treeview.css"/>

    <style>
        /*sweetalert css*/
        .swal-button{
            background-color: rgb(172, 222, 172); font-size: 12px;
            text-shadow: 0px -1px 0px rgba(0, 0, 0, 0.3);
        }
        .swal-button:hover{
            background-color: rgb(206, 236, 206); font-size: 12px;
            text-shadow: 0px -1px 0px rgba(0, 0, 0, 0.3);
        }
        .swal-title {font-size: 20px;}

        .outer *{font-family: 'Nanum Gothic', sans-serif;}
        .outer{width: 1200px;}
        .totalOuter{
            width:1200px; background-color: #fff;
        }

        .subMenubar{
            box-sizing: border-box ; position: relative; float: left;
            width:230px; height:100%;
            background-color: rgb(255, 255, 255);
            border-right: 1px rgba(46, 170, 46, 0.219) solid; 
        }
        #line{
            width: 10px; height: 1000px;
            background-color: rgb(217, 255, 227);
            border-left: 2px solid; border-right: 2px solid;
        }
        .content{
            width:960px; height:1000px;
            box-sizing: border-box; float: left;
        }
        .outer>div{float: left;}
        
        * {padding: 0;margin: 0;box-sizing: border-box;}
   
        .info-box{
            display: flex; align-items: center;
            margin: 0 15px; padding: 15px 0; 
            border-bottom: 1px solid #5e5e5e;
        }
        .right .name{
            margin-bottom: 3px;
            font-size: 17px; font-weight: bold;
        }
        /* .common{
            height: 1000px;
            background-color: rgba(46, 170, 46, 0.219);
        } */
        .scheduleMenu{
            width: 230px; height: 1000px;
        }
        /* .subMenubar>div{
            float: left;
        } */
        /* .subMenubarArea{
           margin-left: 8px; margin-right: 8px;     
        } */
        .menu{
           margin-top: 10px;
        }
        .menuIcon{
            margin-right: 10px;
            /* width: 40px; */
        }
        .menu-wrap{
           margin-left: 50px; display:none;
        }
        .menuDetail a{
           margin-top:5px; padding:3px;
           text-decoration: none; color: black;
        }
        .menuDetail a:hover{
           text-decoration: none;
           color: black; background-color: rgb(130, 180, 130);
           cursor:pointer;
        }
        .subTitle{
            margin:40px 30px 15px 30px;
            font-size: 16px; font-weight: 600;
        }
        .enrollBtn{
            margin:15px 30px 15px 30px;
        }
        .scheduleBox{margin: 10px;}
        .addSchBox{
            border: 0px;
            background-color: white;
        }
        .mainScheduleBox .btn-block{
            text-align: left;
        }
        .myScheduleBox {margin:15px; font-size: 14px;}
        .addScheduleBox{
            color: gray; font-size: 14px;
            padding: 10px;
        }
        .editScheduleBox button {
            border: 0px; background-color: white;
            float: right;
        }
        .oneScheduleBox {
            margin-top: 10px; margin-left: 15px;    
        }
        .schGroupName {padding-left: 3px;}
        .scheduleBoxName {
            width: 130px; height: 18px; margin-left: 10px;
            overflow: hidden; text-overflow: ellipsis; white-space: nowrap; display: inline-block;   
        }

        /*체크박스 색상*/
        .myScheduleBox input[type="checkbox"] {
            width: 0.8rem; height: 0.8rem;
            border-radius: 50%; border: 1px solid gainsboro;
            appearance: none; cursor: pointer;
        }

        #otherEnroll:checked {
            background: black;
        }
        
        /*내 일정 수정*/
        #modifyModal, #addModal {
            margin: 30px;
        }
        .modalTitle {
            text-align: center; margin-bottom: 15px;
            font-size: 18px; font-weight: 600;
        }
        #modifyModal input[type="text"], #addModal input[type="text"] {
            width: 250px; height: 30px; font-size: 14px;
            border-radius: 3px; border: 1px solid gainsboro;
            padding: 10px;
        }
        #modifyModal input[type="radio"], #addModal input[type="radio"] {
            width: 1rem;  height: 1rem;
            border-radius: 50%; border: 1px solid gainsboro;
            appearance: none; cursor: pointer; transition: background 0.2s;
        }
        #modifyModal input[type="radio"]:checked, #addModal input[type="radio"]:checked {
            box-shadow: 0 0 0 max(2px, 0.2em) rgb(244, 235, 235) !important;					/*ridge : 테두리가 튀어나온 것처럼 표시*/
        }
        #modifyModal input[type="radio"]:hover, #addModal input[type="radio"]:hover {
            box-shadow: 0 0 0 max(2px, 0.2em) rgb(244, 235, 235);
            cursor: pointer;
        }

        .modalSubTitle1, .modalSubTitle2 {
            height: 50px; font-size: 14px;
            padding-top: 10px; padding-left: 10px;
        }


        /*일정등록*/
        .schDetail{
            margin: 20px; padding: 30px; padding-bottom: 0px;
        }
        /*등록취소 버튼*/
        #schBtn-area{
            display: inline-block; margin-left: 40%;
        }
        #schBtn-area button{ margin: 3px; }

        #enroll-area input, #enroll-area select, #enroll-area label, #enroll-area table {
            font-size: 14px; color: rgb(47, 47, 47);
        }
        #schTitle, #schTitle2 {
            width: 650px;
            margin-left: 1.5px; margin-bottom: -5px;
        }

        .startDate, .endDate, #startTime, #endTime, #startTime2, #endTime2 {
            width: 130px; height: 35px;
            margin: 3px; float: left;
            border-radius: 5px; border: 1px solid gainsboro;     
        }
        .startDate, .endDate { padding: 10px; }
        #chkAllDay {
            display: inline; margin-left: 40px; 
            line-height: 35px; 
        }
        #allDay {
            margin-top: 10px;
        }
        #scheduleArea { margin: 7px; }
        #scheduleArea th {
            width: 100px !important;
            font-weight: 500;
        }
        #scheduleArea td {
            height: 40px; width: 550px;
            padding-bottom: 8px; padding-top: 8px;
        }
        #group, #attendeeInput, #place, #group2, #place2, #editAttInput {
            width: 200px; height: 35px;
            border-radius: 5px; border: 1px solid gainsboro;
            padding: 10px;
        }
        #group, #group2 {padding: 5px;}
        .plus {
            border: 1px solid gainsboro; border-radius: 5px;
            background-color: white; margin-left: 5px;
            width: 35px; height: 35px;
        }
        textarea {
            width: 545px; padding: 10px;
            border: 1px solid gainsboro; border-radius: 5px;
        }

        /*조직도*/
        .treeA{
            font-size: 12px;
        }
        .emp:hover{
            cursor: pointer;
        }
        .employeeChart{
            padding-left: 10px;
            height: 300px; width: 200px;
            overflow: auto;
        }

        /*참석자*/
        #attendee, #attendee2{
            border:0; 
            width: 60px; height: 32px; margin-left: -6px;
        }
        #attendee:focus, #attendee2:focus {
            outline: none; /* outline 테두리 없애기 */
        }
        #attendee-list, #editAtt-list {
            margin-top: 0px; margin-bottom: 0px; padding: 0px;
            list-style-type : none;
            line-height: 30px; display:inline-block;
        }
        .attendee-li, .editAtt-li{
            display: inline-block;
            background-color: rgb(235, 229, 242); border-radius: 1em;
            color: black; font-size: 13px;
            line-height: 25px; padding-left: 7px; padding-right: 7px;     
        }
        .attendee-delete, .editAtt-delete{
            display: inline-block; box-sizing: border-box; 
            margin-right: 10px; line-height: 30px;
            font-size: 18px; background-color: none;  
        }
        .attendee-delete:hover, .editAtt-delete:hover {cursor: pointer;}
        #attendeeInput , #editAttInput {display: inline-block; position: relative;}
        #chartInput, #chartInput2 {
            float: right; position: relative; right: 6px;
        }
        #attendeeInput2, #editAttInput2{
            margin-top: -10px;
        }

    </style>
</head>
<body>
	
    <div class="totalOuter">

        <div class="outer">

            <div class="subMenubar">
                <!-- <div class="common">

                    <div class="menubarArea">
                        
                    </div>
                </div> -->
                
                <div class="scheduleMenu">
                    <div class="subTitle">
                        일정관리
                    </div>
                    <div class="enrollBtn">
                        <!-- onclick="location.href='enrollSchedule.emp'" -->
                        <button id="" class="btn btn-outline-success btn-block" data-bs-toggle="modal" data-bs-target="#enrollSchedule">일정 등록</button>
                    </div>
                    <div class="subTitle">
                        내 캘린더 &nbsp;&nbsp; 
                        <span><button type="button" class="addSchBox" data-bs-toggle="modal" data-bs-target="#addGroup"><img src="resources/images/common/plus1.png" width="13px"></button></span>
                    </div>
                    <div class="myScheduleBox">
                        <div style="margin-left: 15px;">
                            
                        </div>
                        
                        <!-- 그룹 조회 반복문 돌리기-->
                        <div class="oneScheduleBox">
                                  
                        </div>
                        <!-- 다른 사람이 등록한 일정 -->
                        <div style="margin-left: 15px;">
                            <input type="checkbox" class="checkSchGroup" id="otherEnroll" >
                            <span class="scheduleBoxName schGroupName" style="margin-left:6px;">다른 사람이 등록한 일정</span>
                        </div>
                    </div>
                    
                </div>

                <!-- 그룹수정 모달 -->
                <div class="modal fade" id="modifyGroup" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                    <div class="modal-dialog ">
                    <div class="modal-content">
                        <div class="modal-body" id="modifyModal">
                            <div class="modalTitle">캘린더 그룹 수정</div>
                            <hr>
                            <form action="updateSchGroupName.emp">
                                <input type="hidden" name="groupNo" value="">
                                <div class="modalSubTitle1">
                                    내 캘린더 이름 &nbsp;&nbsp;&nbsp;
                                    <input id="groupName" name="groupName" type="text" value="">
                                </div>
                                <div class="modalSubTitle2">
                                    내 캘린더 색상 &nbsp;&nbsp;&nbsp;
                                    <input type="radio" name="groupColor" value="#FF5B5B" style="background-color: #FF5B5B;">&nbsp;&nbsp;
                                    <input type="radio" name="groupColor" value="#f7C38C" style="background-color: #f7C38C;">&nbsp;&nbsp;
                                    <input type="radio" name="groupColor" value="#FFFF7D" style="background-color: #FFFF7D;">&nbsp;&nbsp;
                                    <input type="radio" name="groupColor" value="#61Cf8F" style="background-color: #61Cf8F;">&nbsp;&nbsp;
                                    <input type="radio" name="groupColor" value="#8DD7EE" style="background-color: #8DD7EE;">&nbsp;&nbsp;
                                    <input type="radio" name="groupColor" value="#54A1DC" style="background-color: #54A1DC;">&nbsp;&nbsp;
                                    <input type="radio" name="groupColor" value="#F0B6D8" style="background-color: #F0B6D8;">&nbsp;&nbsp;
                                    <input type="radio" name="groupColor" value="#B485E9" style="background-color: #B485E9;">&nbsp;&nbsp;
                                    <input type="radio" name="groupColor" value="#CECECE" style="background-color: #CECECE;">&nbsp;&nbsp;
                                </div>
                                <div align="center">
                                    <button type="submit" class="btn btn-success btn-sm" style="width: 70px;">수정</button>&nbsp;&nbsp;
                                    <button type="button" class="btn btn-outline-success btn-sm" style="width: 70px;" data-bs-dismiss="modal">취소</button>
                                </div>
                            </form>
                        </div>
                    </div>
                    </div>
                </div>

                <!-- 그룹추가 모달 -->
                <div class="modal fade" id="addGroup" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                    <div class="modal-dialog ">
                    <div class="modal-content">
                        <div class="modal-body" id="addModal">
                            <div class="modalTitle">캘린더 그룹 추가</div>
                            <hr>
                            <form action="insertSchGroup.emp">
                                <div class="modalSubTitle1">
                                    내 캘린더 이름 &nbsp;&nbsp;&nbsp;
                                    <input type="text" name="groupName" value="">
                                </div>
                                <div class="modalSubTitle2">
                                    내 캘린더 색상 &nbsp;&nbsp;&nbsp;
                                    <input type="radio" name="groupColor" value="#FF5B5B" style="background-color: #FF5B5B;">&nbsp;&nbsp;
                                    <input type="radio" name="groupColor" value="#f7C38C" style="background-color: #f7C38C;">&nbsp;&nbsp;
                                    <input type="radio" name="groupColor" value="#FFFF7D" style="background-color: #FFFF7D;">&nbsp;&nbsp;
                                    <input type="radio" name="groupColor" value="#61Cf8F" style="background-color: #61Cf8F;">&nbsp;&nbsp;
                                    <input type="radio" name="groupColor" value="#8DD7EE" style="background-color: #8DD7EE;">&nbsp;&nbsp;
                                    <input type="radio" name="groupColor" value="#54A1DC" style="background-color: #54A1DC;">&nbsp;&nbsp;
                                    <input type="radio" name="groupColor" value="#F0B6D8" style="background-color: #F0B6D8;">&nbsp;&nbsp;
                                    <input type="radio" name="groupColor" value="#B485E9" style="background-color: #B485E9;">&nbsp;&nbsp;
                                    <input type="radio" name="groupColor" value="#CECECE" style="background-color: #CECECE;">&nbsp;&nbsp;
                                </div>
                                <div align="center">
                                    <button type="submit" class="btn btn-success btn-sm" style="width: 70px;">추가</button>&nbsp;&nbsp;
                                    <button type="button" class="btn btn-outline-success btn-sm" style="width: 70px;" data-bs-dismiss="modal">취소</button>
                                </div>
                            </form>
                        </div>
                    </div>
                    </div>
                </div>

                <!-- 일정등록 모달 -->
                <div class="modal fade" id="enrollSchedule" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                    <div class="modal-dialog modal-lg">
                      <div class="modal-content">   
                        <div class="modal-body">  
                            <form id="enroll-area" action="insertSchedule.emp">
                                <div class="schDetail">
                                    <div style="text-align: center; font-size: 18px;">일정 등록</div><br>
                                    <div id="schTitle">
                                        <input type="text" id="schTitle" class="form-control" name="schTitle" placeholder="제목" required>
                                    </div>
                                    <div>
                                        <div>
                                            <input class="startDate" id="startDate" type="text" placeholder="연도-월-일" name="schBegin" value="" required>           
                                        </div>
                                        <div class="form-group">
                                            <select class="form-control" class="startTime" id="startTime" name="timeBegin" onchange="startTimeChange()">
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
                                            <input class="endDate" id="endDate" type="text" placeholder="연도-월-일" name="schEnd" value="">
                                        </div>
                                        <div class="form-group">
                                            <select class="form-control" class="endTime" id="endTime" name="timeEnd"> 
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
                                        <!-- <div id="chkAllDay">
                                            <input type="checkbox" id="allDay" class="form-check-input" value="" name="allDay">
                                            <label for="allDay">종일</label>
                                        </div> -->
                                        
                                    </div>
                
                                    <table id="scheduleArea">
                                        <tr>
                                            <th>내 캘린더</th>
                                            <td>
                                                <select name="groupNo" id="group">
                                                    
                                                </select>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th>참석자 추가</th>
                                            <td>
                                                <div id="attendeeInput" style="width: 500px;">
                                                    <div id="attendeeInput2">
                                                        <ul id="attendee-list"></ul>
                                                        <input type="text" id="attendee" name="attendance">
                                                    </div>
                                                </div>
                                                <div id="chartInput">
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
                                                <input type="text" id="place" name="schPlace" style="width: 500px;">
                                                <!-- <button class="plus">+</button> -->
                                            </td>
                                        </tr>
                                        
                                        <tr>
                                            <th style="vertical-align: top;">내용</th>
                                            <td>
                                                <textarea name="schContent" id="" rows="10" style="resize:none" required></textarea>
                                            </td>
                                        </tr>
                                    </table>
                                    
                                </div>
                                <div id="schBtn-area">
                                    <button type="submit" class="btn btn-success btn-sm" style="width:70px" >등록</button>
                                    <button class="btn btn-outline-success btn-sm" style="width:70px" data-bs-dismiss="modal" >취소</button>
                                </div><br><br>
                            </form>
                        </div>
                        
                      </div>
                    </div>
                </div>

            </div>
            
            <script>
               // $(function(){
                    groupList();
               // })

                // 모달 닫으면 입력값 reset되게
                $('.modal').on('hidden.bs.modal', function (e) {
                    $(this).find('form')[0].reset();
                });
                
                // 캘린더 그룹 조회
                function groupList(){
                    $.ajax({
                        url:"selectSchGroup.emp",
                        success:function(slist){
                            let value = "";
                            for(let i=0; i<slist.length; i++){
                                value += '<div class="hover" style="margin-bottom:10px;">'
                                            + '<input type="checkbox" class="checkSchGroup" id="'+ slist[i].groupNo + slist[i].groupColor +'" value="'+ slist[i].groupColor +'" checked>'
                                            + '<input type="hidden" name="groupNoValue" value="'+ slist[i].groupNo +'">'
                                            + '<span class="scheduleBoxName schGroupName">' + slist[i].groupName + '</span>'
                                            + '<span class="editScheduleBox dropdown dropend" >'
                                                    + '<button class="" id="dropdownMenu" data-bs-toggle="dropdown" aria-expanded="false" style="display:none">'
                                                        + '<img src="resources/images/mail/edit.png" width="20px">'
                                                    + '</button>'
                                                    + '<ul class="dropdown-menu" aria-labelledby="dropdownMenu">'
                                                        + '<li><a class="dropdown-item" data-bs-toggle="modal" data-bs-target="#modifyGroup" style="font-size:14px" onclick="updateGroup(' + slist[i].groupNo + ')">그룹 수정</a></li>'
                                                        + '<li><a class="dropdown-item" href="" style="font-size:14px" onclick="deleteGroup(' + slist[i].groupNo + ')">그룹 삭제</a></li>'
                                                    + '</ul>'
                                            + '</span>'
                                       + '</div>';
                                $("#group").append(
                                    '<option id="' + slist[i].groupNo + '1' +'" value="'+ slist[i].groupNo +'">'+ slist[i].groupName +'</option>'
                                ) 
                                  
                            }

                            $(".oneScheduleBox").html(value);

                            $('.hover').mouseover(function(){
                                $(this).children().next().next().children("button").show();
                            });
                            $('.hover').mouseout(function(){
                                $(this).children().next().next().children("button").hide();
                            });
                           // $("input:checkbox[id='" + slist[0].groupNo + slist[0].groupColor +"']").prop('checked', 'checked');
                            console.log($("input:checkbox[id='" + slist[0].groupNo + slist[0].groupColor +"']").val());
                          //  $("input:checkbox[id='" + slist[0].groupNo + slist[0].groupColor +"']").trigger("click");
                            
                            for(let i=0; i<slist.length; i++){
                                let chk = $("input:checkbox[id='" + slist[i].groupNo + slist[i].groupColor +"']");
                                if(chk.is(":checked")){
                                    chk.css("background-color", "$('#' "+ slist[i].groupNo + slist[i].groupColor +").val()");
                                }
                                chk.change(function(){
                                    if(chk.is(":checked")){
                                        chk.css("background-color", "$('#' "+ slist[i].groupNo + slist[i].groupColor +").val()");
                                    }else{
                                        chk.css("background-color", "white");
                                    }
                                })  
                            }
                        }, error: function(){
                            console.log("캘린더 그룹 조회 ajax 통신실패");
                        }
                    })
                }
                

                // 캘린더 그룹 수정
                function updateGroup(groupNo) {
                    $.ajax({
                        url:"selectSchGroupName.emp",
                        data:{groupNo:groupNo},
                        success:function(g){
                            $("input[name=groupNo]").val(groupNo);
                            $('#groupName').val(g.groupName);
                            $(":radio[name='groupColor'][value='"+ g.groupColor+"']").attr("checked", true);
                        }, error: function(){
                            console.log("그룹수정 ajax 통신실패")
                        }
                    })
                }

                // 캘린더 그룹 삭제
                function deleteGroup(groupNo) {
                    $.ajax({
                        url:"deleteSchGroup.emp",
                        data:{groupNo:groupNo},
                        success:function(result){           
                            if(result == "success"){
                                //swal('삭제완', '', 'success');
                                alert("삭제완"); 
                                document.location.href = document.location.href;  
                            }
                        }, error: function(){
                            console.log("그룹삭제 ajax 통신실패")
                        } 
                    })

                }
                
                


            </script>

            <!-- 데이트 피커 -->
            <link rel="stylesheet" href="http://code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css"/>
            <script src="http://code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script>
            <script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/i18n/datepicker-ko.js"></script>
            <script>
                // var today = new Date();
                // var tomorrow = new Date(Date.parse(today) + (1000 * 60 * 60 * 24));
                $(function(){
                    //시작일 종료일
                    $('.startDate, .endDate').datepicker({
                        //showMonthAfterYear: true, //연도,달 순서로 지정
                        //changeMonth: true,//달 변경 지정
                        //dateFormat:"yy-mm-dd",//날짜 포맷
                        //dayNamesMin: ["일", "월", "화", "수", "목", "금", "토" ],//요일 이름 지정
                        //monthNamesShort: ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12"],//월 이름 지정
                        minDate:0, //오늘 이전 날짜를 선택할 수 없음
                        onClose:function(selectedDate){
                            $('.endDate').datepicker("option", "minDate", selectedDate);
                            var startDate = $.datepicker.formatDate("yy-mm-dd", $(".startDate").datepicker("getDate"));    
                            var endDate = $.datepicker.formatDate("yy-mm-dd", $(".endDate").datepicker("getDate"));           
                        },
                        // 시작일 선택 시 종료일 같은 값 자동으로 넘기기
                        onSelect:function(selected, evnt){
                            fnChangeEnd(selected);
                        }       
                    });
                    function fnChangeEnd(value) {
                        $(".endDate").val(value);
                        console.log('종료일 값' + $(".endDate").val())
                    }
                        
                })    

                // 시작시간 종료시간
                function startTimeChange(){
                    var start = $('#startTime').val();
                    var end  = $('#endTime').val();
                    var start2 = $('#startTime2').val();
                    var end2  = $('#endTime2').val();
                    if(start.substring(3, 5) == '00')
                        // end = start.substring(0, 2) + ':30';
                        end = (parseInt(start.substring(0, 2))+1) + ':00';
                    else
                        end = (parseInt(start.substring(0, 2))+1) + ':30';
                    if(start2.substring(3, 5) == '00')
                        // end = start.substring(0, 2) + ':30';
                        end2 = (parseInt(start2.substring(0, 2))+1) + ':00';
                    else
                        end2 = (parseInt(start2.substring(0, 2))+1) + ':30';
                    
                    $('#endTime').val(end);
                    $('#endTime2').val(end2);
                }

            </script>

            <script src="resources/js/treeview/jquery.cookie.js" type="text/javascript"></script>
            <script src="resources/js/treeview/jquery.treeview.js" type="text/javascript"></script>
            <!-- 주소록 불러오기 -->
            <script>
                $(document).ready(function(){    
                    $(document).on("click", "#chart", function(){
                        $.ajax({
                            url: "employeeChart.emp",
                            success: function(deptList){
                                //console.log(deptList);
                                let chart = "";
                                for(let i=0; i<deptList.length; i++){
                                    //console.log(deptList[i]);
                                    if(deptList[i].deptName == "사장"){
                                        chart += "<li><span class='emp' empNo='" + deptList[i].teamList[0].empList[0].empNo + "' empName='" + deptList[i].teamList[0].empList[0].empName + "'>" 
                                                                            + deptList[i].teamList[0].empList[0].jobName + '&nbsp;' + deptList[i].teamList[0].empList[0].empName + "</span></li>";
                                    } else{
                                        chart += '<li class="closed"><span class="folder">' + deptList[i].deptName + '</span>';
                                        for(let j=0; j<deptList[i].teamList.length; j++){
                                            if(deptList[i].teamList[j].teamName == "임원"){
                                                for (let k=0; k<deptList[i].teamList[j].empList.length; k++){
                                                    chart += '<ul><li><span class="emp" empNo="' + deptList[i].teamList[j].empList[k].empNo + '" empName="' + deptList[i].teamList[j].empList[k].empName + '">'
                                                            + deptList[i].teamList[j].empList[k].jobName + '&nbsp;' + deptList[i].teamList[j].empList[k].empName + '</span></li></ul>';
                                                }
                                            } else{
                                                chart += '<ul><li class="closed"><span class="folder">' + deptList[i].teamList[j].teamName + '</span>';
                                                for(let k=0; k<deptList[i].teamList[j].empList.length; k++){
                                                    chart += '<ul><li><span class="emp" empNo="' + deptList[i].teamList[j].empList[k].empNo + '" empName="' + deptList[i].teamList[j].empList[k].empName + '">'
                                                        + deptList[i].teamList[j].empList[k].jobName + '&nbsp;' + deptList[i].teamList[j].empList[k].empName + '</span></li></ul>';
                                                }
                                                chart+= '</li></ul>';
                                            }     
                                        }
                                        chart += "</li>";
                                    } 
                                }
                                $(".treeA").html(chart);
                                $(".treeA").treeview({});
                            }, error: function(){
                                console.log("조직도 조회용 ajax 통신 실패");
                            }
                        })
                    })

                    // 주소록에서 사원 클릭할 때
                    $(document).on("click", "#enrollSchedule .emp", function(){

                        const empNo = $(this).attr("empNo");
                        const empName = $(this).attr("empName");

                        if($("#attendee-list").children().length == 0){ 
                        // li 요소가 없을 때
                            $("#attendee-list").append($("<input type='hidden' name='attendance' value='" + empNo + "'><input type='hidden' name='attendee' value='" + empName + "'><li class='attendee-li'>" + empName + "</li><div class='attendee-delete'>&times;</div>"));
                            $("#attendee-list").css("width", "$('#attendee-list').children().eq(0).val().length + 30");
                        } else { 
                        // li 요소가 있을 때
                            for(let i=0; i<$("#attendee-list").children().length; i++){
                                if($("#attendee-list").children().eq(i).val() == empNo){
                                    alert("중복된 사람입니다.");
                                    return;
                                }
                            }
                            $("#attendee-list").append($("<input type='hidden' name='attendance' value='" + empNo + "'><input type='hidden' name='attendee' value='" + empName + "'><li class='attendee-li'>" + empName + "</li><div class='attendee-delete'>&times;</div>"));   
                        }
                    })
                });


                // 사번으로 참석자 조회
                $("#attendee").keydown(function(){
                    if(event.keyCode == 13 || event.keyCode == 32){ // 13 enter, 32 space
                        event.preventDefault(); // 기본동작 방지(안쓰면 엔터했을 때 폼의 다른 영역에 영향을 줄 수 있음)
                        let attendee = $(this).val();

                        $.ajax({
                            url: "selectAttendee.emp",
                            data:{empNo:attendee},
                            success: function(e){
                                console.log(e);
                                if(e == null){
                                    alert("일치하는 사원이 없습니다.");
                                    $("#attendee").val("");
                                    $("#attendee").focus();
                                } else{
                                    if($("#attendee-list").children().length == 0){ // li 요소 있을 때
                                        $("#attendee-list").append($("<input type='hidden' name='attendance' value='" + e.empNo + "'><input type='hidden' name='attendeeName' value='" + e.empName + "'><li class='attendee-li'>" + e.empName + "</li><div class='attendee-delete'>&times;</div>")); //&times; x 기호
                                        $("#attendee-list").css("width", "$('#attendee-list').children().eq(0).val().length + 30");
                                        $("#attendee").val("");
                                        $("#attendee").focus();
                                    } else{ // li 요소 없을 때
                                        for(let i=0; i<$("#attendee-list").children().length; i++){
                                            if($("#attendee-list").children().eq(i).val() == e.empNo){
                                                alert("중복된 사원입니다.");
                                                $("#attendee").val("");
                                                $("#attendee").focus();
                                                return;
                                            }
                                        }
                                        $("#attendee-list").append($("<input type='hidden' name='attendance' value='" + e.empNo + "'><input type='hidden' name='attendeeName' value='" + e.empName + "'><li class='attendee-li'>" + e.empName + "</li><div class='attendee-delete'>&times;</div>"));
                                        $("#attendee").val("");
                                        $("#attendee").focus();
                                    }
                                }  
                            }, error:function(){
                                console.log("사원 조회용 ajax 통신 실패");
                            }
                        })

                    }
                });

                // x 버튼 눌러서 참석자 목록에서 제거
                $(document).on("click", ".attendee-delete", function(){
                    $(this).prev().prev().prev().remove();
                    $(this).prev().prev().remove();
                    $(this).prev().remove();
                    $(this).remove();
                })

            </script>



            <div id="line"></div>
            <div class="content">
            

</body>
</html>