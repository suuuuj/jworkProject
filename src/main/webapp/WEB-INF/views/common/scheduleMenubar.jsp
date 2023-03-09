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
    <!-- Bootstrap 5버전 -->
	<!-- Latest compiled and minified CSS -->
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet"> 
	<!-- Latest compiled JavaScript -->
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script> 

    <style>
        /*
        div, input, p{
            border: 1px solid red;
        }
        
        #mailHeader tr{
            border-top: 0.1em solid blue;
            height: 60px;
        }
        */
        .outer *{
	 		font-family: 'Nanum Gothic', sans-serif;
	 	}
        #scheduleHeader tr{height: 60px;}
        
        .outer{
            width: 1200px;
        }
        .content{
            width: 960px;
            padding: 20px;
        }
        
        .space{
            height: 15px;
        }
        .totalOuter{
            width:1200px;
            background-color: #fff;
   
        }
        .outer{width:1200px;}
        .home{
            height:100px;
            width:1200px;
            box-sizing: border-box ;
            background: rgba(246, 246, 246, 0.712);
        }
        .line{
               border : 1px solid rgba(6, 117, 6, 0.966);
        }
        .logo{ width:200px; }
        .menubar{
            width:240px;
            height:1000px;
            box-sizing: border-box ;
            float: left;
            background-color: rgba(246, 246, 246, 0.712);
        }
        .content{
            width:960px;
            height:1000px;
            box-sizing: border-box ;
        }
        .outer>div{
            float: left;
        }
        
        * {padding: 0;margin: 0;box-sizing: border-box;}
   
   
        .header{
            display: flex;
            align-items: center;
            width: 1050px;
        }
        .header-right{
            height: 70px;
             display:flex;
            width: 100px;
            padding-top: 30px;
         }
         .headerIcon{
             width:40px;
             margin-right:10px;
         }
        .home>div{
           float:left;
        }
   
        .info-box{
            display: flex;
            align-items: center;
            margin: 0 15px;
            padding: 15px 0;
            
            border-bottom: 1px solid #5e5e5e;
        }
        .right .name{
            margin-bottom: 3px;
            font-size: 17px;
            font-weight: bold;
        }
        .common{
            width: 60px;
            height: 1000px;
            background-color: rgba(46, 170, 46, 0.219);
        
        }
        .scheduleMenu{
            width: 180px;
            height: 1000px;
        }
        .menubar>div{
            float: left;
        }
        .menubarArea{
           margin-left: 8px;
           margin-right: 8px;     
        }
        .menu{
           margin-top: 10px;
        }
        
        .mainMenu:hover{
           cursor:pointer;
           border-radius: 0.5em;
           background-color: rgba(0, 172, 0, 0.219);
       }
        .menuIcon{
            margin-right: 10px;
            width: 40px;
        }
        .menu-wrap{
           margin-left: 50px;
           display:none;
        }
        .menuDetail a{
           margin-top:5px;
           padding:3px;
           text-decoration: none;
           color: black;
        }
        .menuDetail a:hover{
           text-decoration: none;
           color: black;
           background-color: rgb(130, 180, 130);
           cursor:pointer;
        }
        .subTitle{
            margin: 15px;
            margin-top: 40px;
            font-size: 18px;
            font-weight: 0600;
        }
        .enrollBtn{
            margin: 15px;
        }
        .scheduleBox{margin: 10px;}
        .mainScheduleBox .btn-block{
            text-align: left;
        }
        .myScheduleBox{margin:10px}
        .addScheduleBox{
            float: right;
            color: gray;
            font-size: 14px;
            padding: 10px;
        }
        .editScheduleBox {
            float: right;
        }
        .editScheduleBox button {
            border: 0px;   
        }
        .oneScheduleBox{
            margin-top: 10px; 
            font-size: 14px;
        }
        .scheduleBoxName{
            width: 120px;
            border: none;
            background-color: rgba(246, 246, 246, 0.712);
            padding-left: 5px;
        }
        .scheduleBoxName:focus{
            outline: 1px solid green;
            border-radius: 5px;
            background-color: rgba(246, 246, 246, 0.712);
        }

        /*체크박스 색상*/
        .oneScheduleBox input[type="checkbox"] {
            width: 0.8rem;
            height: 0.8rem;
            border-radius: 50%;
            border: 1px solid gainsboro;
            appearance: none;
            cursor: pointer;
            transition: background 0.2s;
        }

        .oneScheduleBox input[type="checkbox"]:checked {
            background: rgb(39, 174, 96);
            border: none;
        }

        /*내 일정 수정*/
        #modifyModal {
            margin: 30px;
        }
        .modalTitle {
            text-align: center;
            margin-bottom: 15px;
            font-size: 18px;
            font-weight: 600;
        }
        #modifyModal input[type="text"] {
            width: 250px;
            height: 30px;
            border-radius: 3px;
            border: 1px solid gainsboro;
            padding: 10px;
        }
        #modifyModal input[type="radio"] {
            width: 1rem;
            height: 1rem;
            border-radius: 50%;
            border: 1px solid gainsboro;
            appearance: none;
            cursor: pointer;
            transition: background 0.2s;
        }
        #modifyModal input[type="radio"]:checked {
            box-shadow: 0 0 0 max(2px, 0.2em) rgb(244, 235, 235) !important;					/*ridge : 테두리가 튀어나온 것처럼 표시*/
        }
        #modifyModal input[type="radio"]:hover {
            box-shadow: 0 0 0 max(2px, 0.2em) rgb(244, 235, 235);
            cursor: pointer;
        }

        .modalSubTitle1, .modalSubTitle2 {
            font-size: 14px;
            padding-top: 10px;
            padding-left: 10px;
            height: 50px;
        }

    </style>
</head>
<body>
	
    <div class="totalOuter">

        <div class="home">
            <div class="header">
                <div class="logo-box">
                    
                    <a href="#"><img class="logo" src="resources/images/common/jwork_logo.png" alt="" /></a>
                    
                </div>

            </div>
			<div class="header-right">
                	<a href="#"><img class="headerIcon" src="resources/images/common/mail.png" alt=""></a>
                	<a href="#"><img class="headerIcon" src="resources/profile_images/profile.png" alt=""></a>
            </div>
            
        </div>
        <div class="line"></div>
        <div class="outer">

            <div class="menubar">
                <div class="common">

                    <div class="menubarArea">
                        <br>
                        <div class="menu"  id="">
                            <div class="mainMenu"><img class="menuIcon" src="resources/profile_images/profile.png" /></div>
                        </div>
                        <div class="space"></div>
                        <div class="line"></div>
                        <div class="space"></div>

                        <div class="menu"  id="">
                            <div class="mainMenu"><img class="menuIcon" src="resources/images/common/menu_ico.png" /></div>
                        </div>

                        <div class="menu"  id="">
                            <div class="mainMenu"><img class="menuIcon" src="resources/images/common/schedule.png" /></div>
                        </div>

                        <div class="menu"  id="">
                            <div class="mainMenu"><img class="menuIcon" src="resources/images/common/chart.png" /></div>
                        </div>

                        <div class="menu"  id="">
                            <div class="mainMenu"><img class="menuIcon" src="resources/images/common/ess.png" /></div>
                        </div>

                        <div class="menu"  id="approval">
                            <div class="mainMenu"><img class="menuIcon" src="resources/images/common/vacation.png" /></div>
                        </div>
                        
                        <div class="menu"  id="">
                            <div class="mainMenu"><img class="menuIcon" src="resources/images/common/approval.png" /></div>
                        </div>

                        <div class="menu"  id="">
                            <div class="mainMenu"><img class="menuIcon" src="resources/images/common/mail.png" /></div>
                        </div>

                        <div class="menu"  id="">
                            <div class="mainMenu"><img class="menuIcon" src="resources/images/common/board.png" alt="" /></div>
                        </div>

                        <div class="menu"  id="">
                            <div class="mainMenu"><img class="menuIcon" src="resources/images/common/announce.png" alt="" /></div>
                        </div>
                    </div>
                </div>
                
                <div class="scheduleMenu">
                    <div class="subTitle">
                        일정관리
                    </div>
                    <div class="enrollBtn">
                        <button id="enrollSchedule" class="btn btn-success btn-block" onclick="location.href=''">일정 등록</button>
                    </div>
                    <div class="subTitle">
                        내 캘린더
                    </div>
                    <div class="myScheduleBox">
                        <div class="oneScheduleBox">
                            <input type="checkbox" checked>
                            <input type="text" class="scheduleBoxName" value="내 일정" readonly> 
                            <span class="editScheduleBox dropdown dropend">
                                <button class="" id="dropdownMenu" data-bs-toggle="dropdown" aria-expanded="false">
                                    <img src="resources/images/mail/edit.png" width="20px">
                                </button>
                                <ul class="dropdown-menu" aria-labelledby="dropdownMenu">
                                  <li><a class="dropdown-item" data-bs-toggle="modal" data-bs-target="#modifyGroup">그룹 수정</a></li>
                                  <li><a class="dropdown-item" href="">그룹 삭제</a></li>
                                </ul>
                            </span>
                        </div>
                        <!-- <div class="oneScheduleBox">
                            <input type="text" class="scheduleBoxName" value="테스트" readonly> <span class="editScheduleBox"><img class="menuIcon" src="resources/images/mail/edit.png" /></span>
                        </div> -->
                        <div class="addScheduleBox btn btn-sm" data-bs-toggle="modal" data-bs-target="#addGroup">+ 내 캘린더 추가</div>
                    </div>
                    
                </div>

                <!-- 그룹수정 모달 -->
                <div class="modal fade" id="modifyGroup" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                    <div class="modal-dialog ">
                    <div class="modal-content">
                        <div class="modal-body" id="modifyModal">

                            <div class="modalTitle">캘린더 그룹 수정</div>
                            <hr>
                            <div class="modalSubTitle1">
                                내 캘린더 이름 &nbsp;&nbsp;&nbsp;
                                <input type="text" value="내 일정">
                            </div>
                            <div class="modalSubTitle2">
                                내 캘린더 색상 &nbsp;&nbsp;&nbsp;
                                <input type="radio" name="color" value="" style="background-color: rgb(255, 91, 91);">&nbsp;&nbsp;
                                <input type="radio" name="color" value="" style="background-color: rgb(255, 191, 122);">&nbsp;&nbsp;
                                <input type="radio" name="color" value="" style="background-color: rgb(255, 255, 125);">&nbsp;&nbsp;
                                <input type="radio" name="color" value="" style="background-color: rgb(39, 174, 96);" checked>&nbsp;&nbsp;
                                <input type="radio" name="color" value="" style="background-color: rgb(160, 251, 239);">&nbsp;&nbsp;
                                <input type="radio" name="color" value="" style="background-color: rgb(112, 213, 241);">&nbsp;&nbsp;
                                <input type="radio" name="color" value="" style="background-color: rgb(84, 161, 220);">&nbsp;&nbsp;
                                <input type="radio" name="color" value="" style="background-color: rgb(193, 178, 249);">&nbsp;&nbsp;
                                <input type="radio" name="color" value="" style="background-color: rgb(240, 182, 216);">&nbsp;&nbsp;
                            </div>
                            <div align="center">
                                <button type="submit" class="btn btn-success btn-sm" style="width: 70px;">수정</button>&nbsp;&nbsp;
                                <button type="button" class="btn btn-outline-success btn-sm" style="width: 70px;" data-bs-dismiss="modal">취소</button>
                            </div>
                        </div>
                    </div>
                    </div>
                </div>

                <!-- 그룹추가 모달 -->
                <div class="modal fade" id="addGroup" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                    <div class="modal-dialog ">
                    <div class="modal-content">
                        <div class="modal-body" id="modifyModal">

                            <div class="modalTitle">캘린더 그룹 추가</div>
                            <hr>
                            <div class="modalSubTitle1">
                                내 캘린더 이름 &nbsp;&nbsp;&nbsp;
                                <input type="text">
                            </div>
                            <div class="modalSubTitle2">
                                내 캘린더 색상 &nbsp;&nbsp;&nbsp;
                                <input type="radio" name="color" value="" style="background-color: rgb(255, 91, 91);">&nbsp;&nbsp;
                                <input type="radio" name="color" value="" style="background-color: rgb(255, 191, 122);">&nbsp;&nbsp;
                                <input type="radio" name="color" value="" style="background-color: rgb(255, 255, 125);">&nbsp;&nbsp;
                                <input type="radio" name="color" value="" style="background-color: rgb(39, 174, 96);">&nbsp;&nbsp;
                                <input type="radio" name="color" value="" style="background-color: rgb(160, 251, 239);">&nbsp;&nbsp;
                                <input type="radio" name="color" value="" style="background-color: rgb(112, 213, 241);">&nbsp;&nbsp;
                                <input type="radio" name="color" value="" style="background-color: rgb(84, 161, 220);">&nbsp;&nbsp;
                                <input type="radio" name="color" value="" style="background-color: rgb(193, 178, 249);">&nbsp;&nbsp;
                                <input type="radio" name="color" value="" style="background-color: rgb(240, 182, 216);">&nbsp;&nbsp;
                            </div>
                            <div align="center">
                                <button type="submit" class="btn btn-success btn-sm" style="width: 70px;">수정</button>&nbsp;&nbsp;
                                <button type="button" class="btn btn-outline-success btn-sm" style="width: 70px;" data-bs-dismiss="modal">취소</button>
                            </div>
                        </div>
                    </div>
                    </div>
                </div>
                


            </div>
            <script>
                $(function(){
                    // 내 캘린더 수정 버튼 클릭 시
                    // $(document).on("click", ".editScheduleBox", function(){
                    //     $(this).prev().attr("readonly", false);
                    //     $(this).prev().select();
                    // })

                    // 내 캘린더 input box 에서 포커스 아웃될 때
                    // $(document).on("focusout", ".scheduleBoxName", function(){
                    //     $(this).attr("readonly", true);
                    //     $(this).attr("border", "none");
                    // })

                    // 내 캘린더 추가하기 클릭 시
                    // $(".addScheduleBox").on("click", function(){
                    //     const scheduleBoxInput = "<div class='oneScheduleBox'><input type='text' class='scheduleBoxName' value='새 메일함' readonly><span class='editScheduleBox'><img class='menuIcon' src='resources/images/mail/edit.png'/></span>";
                    //     $(".myScheduleBox").append(scheduleBoxInput);
                    //     const scheduleBoxArr = $(".scheduleBoxName");
                    //     const newScheduleBox = scheduleBoxArr.eq(scheduleBoxArr.length - 1);
                    //     newScheduleBox.next().click();
                    // })


                })

                

            </script>

            <div class="content">
            
            

    
</body>
</html>