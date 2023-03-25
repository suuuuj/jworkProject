<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>


<!-- datepicker -->
<script src="//code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">

<!-- timepicker -->
<link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.css">
<script src="//cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.js"></script>



<!-- sweetalert -->
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>


<style>
	/*sweetalert css*/
    .swal-button{
        background-color: rgb(172, 222, 172);
        font-size: 12px;
        text-shadow: 0px -1px 0px rgba(0, 0, 0, 0.3);
    }
    .swal-button:hover{
        background-color: rgb(206, 236, 206);
        font-size: 12px;
        text-shadow: 0px -1px 0px rgba(0, 0, 0, 0.3);
    }
    .swal-title { font-size: 20px;}

    .outer *{
        font-family: 'Nanum Gothic', sans-serif;
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
        background: white;
    }
    .gradation{
        height:10px;
        /* background: linear-gradient(45deg, rgba(76, 209, 76, 0.219), rgb(74, 195, 74)); */
        background-color: rgb(217, 255, 227);
        border-top: solid 2px;
        border-bottom: solid 2px;
    }
    .line{
        height:2px;
        background: linear-gradient(45deg, rgb(2, 152, 52), rgb(3, 110, 63));
    }
    .sideLine{
        width: 10px;
        background-color: rgb(217, 255, 227);
        height: 1000px;
        border-left: 2px solid;
        border-right: 2px solid;
    }
    .logo{ width:200px; margin-left:20px; }
    .menubar{
        width:230px;
        height:1000px;
        box-sizing: border-box ;
        float: left;
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
    .profileImg{width:60px;}
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
    .left{width: 70px;}
    .left img{
        width:60px; height:60px; border:0.5px solid lightgray; border-radius: 50%;
    }
    .right .name{
        margin-bottom: 3px;
        font-size: 17px;
        font-weight: bold;
    }
    .menubar{background-color: white;}
    .menubarArea{
        margin: 20px;
        color: #363636;
        font-size: 15px;
    }
    .menubarArea img{
        width: 30px;
        margin-right: 20px;
    }
    .menu{
        margin-top: 10px;
    }
    .mainMenu{height:35px}
    .mainMenu:hover{
        cursor:pointer;
        background-color: rgb(130, 180, 130);
    }
    .menuIcon{
        width: 30px;
        margin-right: 10px;
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
     

	
</style>
<title>menubar</title>
</head>
<body>
	<jsp:include page="../common/header.jsp"/>

            <div class="menubar">
                <div class="info-box">
                    <div class="left"><a href="myPage.emp"><img class="profileImg" src="<c:out value='${ loginUser.profileUrl }' default='resources/images/common/profileDefault3.png' />" /></a></div>
                    <div class="right">
                        <p class="name">${ loginUser.empName }</p>
                        <p style="font-size: 12px;">${ loginUser.deptName }&nbsp;${ loginUser.teamName }&nbsp;${ loginUser.jobName }</p>
                        </div>
                </div>

                <div class="menubarArea">
                    <div class="menu"  id="">
                        <div class="mainMenu" onclick="location.href='mainPage.ess'"><img class="menuIcon" src="resources/images/common/homepage.png" alt="" />홈피드</div>
                        <div class="menu-wrap">

                        </div>
                    </div>

                    <div class="menu"  id="">
                        <div class="mainMenu" onclick="location.href='schedule.emp'"><img class="menuIcon" src="resources/images/common/calendar1.png" alt="" />일정</div>
                        <div class="menu-wrap">
                            
                        </div>
                    </div>

                    <div class="menu"  id="">
                        <div class="mainMenu"><img class="menuIcon" src="resources/images/common/org.png" alt="" />조직도</div>
                        <div class="menu-wrap">
                            <div class="menuDetail">
                                <a id="" href="">조직도</a><br>
                                <a id="" href="department.ad">부서 관리</a><br>
                                <a id="" href="">사원 관리</a><br>
                            </div>
                        </div>
                    </div>
                    
                    <div class="menu"  id="">
                        <div class="mainMenu" onclick="location.href='addressIn.emp'"><img class="menuIcon" src="resources/images/common/address1.png" alt="" />주소록</div>
                        <div class="menu-wrap">

                        </div>
                    </div>

                    <div class="menu"  id="">
                        <div class="mainMenu"><img class="menuIcon" src="resources/images/common/working.png" alt="" />근무</div>
                        <div class="menu-wrap">
                            <div class="menuDetail">
                                <a id="" href="workCalendar.at">근태현황</a><br>
                                <a id="" href="list.at">근태이력</a><br>
                                <a id="" href="wtModify.at">근태수정</a><br>
                                <a id="" href="" style="color:rgb(2, 152, 52)">근태조정</a><br>
                                <a id="" href="" style="color:rgb(2, 152, 52)">근태관리</a><br>
                                <a id="" href="" style="color:rgb(2, 152, 52)">근태통계</a><br>
                            </div>
                        </div>
                    </div>

                    <div class="menu"  id="">
                        <div class="mainMenu"><img class="menuIcon" src="resources/images/common/holiday.png" alt="" />휴가</div>
                        <div class="menu-wrap">
                            <div class="menuDetail">
                                <a id="" href="menu.le">휴가신청</a><br>
                                <a id="" href="list.le">휴가상세</a><br>
                                <a id="" href="adminAll.le">전체휴가일정</a><br>
                                <a id="" href="adminAnnual.le" style="color:rgb(2, 152, 52)">연차관리</a><br>
                                <a id="" href="adminList.le"  style="color:rgb(2, 152, 52)">휴가내역</a><br>
                            </div>
                        </div>
                    </div>
                    
                    <div class="menu"  id="">
                        <div class="mainMenu"><img class="menuIcon" src="resources/images/common/ess.png" alt="" />신청</div>
                        <div class="menu-wrap">
                            <div class="menuDetail">
                                <a id="" href="enrollForm.bt">출장신청</a><br>
                                <a id="" href="enrollForm.ot">시간외 근무신청</a><br>
                                <a id="" href="list.wt">신청상세</a><br>
                                <a id="" href="admin.bt" style="color:rgb(2, 152, 52)">출장관리</a><br>
                                <a id="" href="admin.ot" style="color:rgb(2, 152, 52)">시간외 근무관리</a><br>
                            </div>
                        </div>
                    </div>

                    <div class="menu"  id="">
                        <div class="mainMenu"><img class="menuIcon" src="resources/images/common/ess.png" alt="" />예약</div>
                        <div class="menu-wrap">
                            <div class="menuDetail">
                                <a id="" href="status.car">차량예약신청</a><br>
                                <a id="" href="status.cfr">회의실예약신청</a><br>
                            </div>
                        </div>
                    </div>

                    <div class="menu"  id="approval">
                        <div class="mainMenu"><img class="menuIcon" src="resources/images/common/approval1.png" alt="" />전자결재</div>
                        <div class="menu-wrap">
                            <div class="menuDetail">
                                <a id="myApprovalList" href="mylist.app">기안 문서함</a><br>
                                <a id="selectunSignList" href="unsignlist.app">미결재 문서함</a><br>
                                <a id="selectSignList" href="signlist.app">결재 문서함</a><br>
                                <a id="" href="">수신/참조 문서함</a><br>
                                <a id="selectdraftList" href="draftList.app">임시저장함</a><br>
                            </div>
                        </div>
                    </div>
                    
                    <div class="menu"  id="">
                        <div class="mainMenu" onclick="location.href='list.ma?mailCategory=받은메일함'"><img class="menuIcon" src="resources/images/common/email1.png" />이메일</div>
                        <div class="menu-wrap">
                            
                        </div>
                    </div>

                    <div class="menu"  id="">
                        <div class="mainMenu"><img class="menuIcon" src="resources/images/common/board1.png" alt="" />게시판</div>
                        <div class="menu-wrap">
                            <div class="menuDetail">
                                <a id="" href=""></a><br>
                                <a id="" href=""></a><br>
                                <a id="" href=""></a><br>
                                <a id="" href=""></a><br>
                                <a id="" href=""></a><br>
                            </div>
                        </div>
                    </div>

                    <div class="menu"  id="">
                        <div class="mainMenu"><img class="menuIcon" src="resources/images/common/notice1.png" alt="" />공지사항</div>
                        <div class="menu-wrap">
                            <div class="menuDetail">
                                <a id="" href=""></a><br>
                                <a id="" href=""></a><br>
                                <a id="" href=""></a><br>
                                <a id="" href=""></a><br>
                                <a id="" href=""></a><br>
                            </div>
                        </div>
                    </div>

                </div>

                <script>
                    $(function(){
                        $(".mainMenu").click(function(){
                        	$(this).next().slideToggle();
                        })
            
                    })
                </script>


            </div>
            
            <div class="sideLine"></div>
            <div class="content">
            
            

</body>
</html>