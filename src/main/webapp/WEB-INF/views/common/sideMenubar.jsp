<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

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
    .logo{ width:200px; margin-left:20px; }


    /*사이드메뉴바 스르륵*/
    div[class="menubar"] {
        width:230px;
        height:100%;
        position: fixed;
        top: 110px;
        left: -300px;
        z-index: 1;
        transition: all .35s;
        box-sizing: border-box ;
        float: left;
        background-color: rgb(255, 255, 255);
    }
    input[id="menuicon"]:checked + label + div {
        left:0;
    }
    input[id="menuicon"] {
        position: fixed;
        z-index:2;
        left: 215px;

        width: 1rem; height: 1rem;
        border-radius: 50%; border: 2px solid rgb(0, 0, 0);
        background-color: #FEEBB6;
        appearance: none; cursor: pointer;
    }
    input[id="menuicon"]:checked {
        background: white;
    }
    input[id="menuicon"] + label {
        display:block;
        width: 60px;
        height: 50px;
        position: fixed;
        right: 0;
        top: calc(50% -25px);
        transition: all .35s;
        cursor: pointer;
    }
    input[id="menuicon"]:checked + label {
        z-index:2;
        left:-300px;
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
    .mainMenu{
        font-weight: bold;
        padding: 5px;
        height:35px;
        border-radius: 5px;
    }
    .mainMenu:hover{
        cursor:pointer;
        background-color: rgb(205, 248, 205);
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
        display: block;
        border-radius: 5px;
        text-decoration: none;
        color: black;
    }
    .menuDetail a:hover{
        text-decoration: none;
        color: black;
        background-color: rgb(205, 248, 205);
        cursor:pointer;
    }
    #alarmBtn{
        border:none;
        background-color: white;
    }
    .alarm-area{
        width: 300px;
    }
    .alarms{
        height: 50px;
    }
    .new{
        background-color: rgb(242, 232, 189);
    }
    .alarm-delete{
        text-align: right;
        font-size: 12px;
    }
    .alarm-delete:hover{
        cursor: pointer;
    }

    
</style>
<title>menubar</title>
</head>
<body>
	<jsp:include page="../common/header.jsp"/>
            <input type="checkbox" id="menuicon">
            <label for="menuicon">
                <span></span>
                <span></span>
                <span></span>
            </label>
            <div class="menubar">
                <div class="info-box">
                    <div class="left"><a href="myPage.emp"><img class="profile" src="<c:out value='${ loginUser.profileUrl }' default='resources/images/common/profileDefault3.png' />" /></a></div>
                    <div class="right">
                        <p class="name">${ loginUser.empName }</p>
                        <p style="font-size: 12px;">${ loginUser.deptName }&nbsp;${ loginUser.teamName }&nbsp;${ loginUser.jobName }</p>
                        </div>
                </div>

                <div class="menubarArea">
                    <div class="menu"  id="">
                        <div class="mainMenu" onclick="location.href='mainPage.ess'"><img class="menuIcon" src="resources/images/common/homepage.png" alt="" />홈피드</div>
                        
                    </div>

                    <div class="menu"  id="">
                        <div class="mainMenu" onclick="location.href='schedule.emp'"><img class="menuIcon" src="resources/images/common/calendar1.png" alt="" />일정</div>
                        
                    </div>

                    <div class="menu"  id="">
                        <div class="mainMenu"><img class="menuIcon" src="resources/images/common/org.png" alt="" />조직도</div>
                        <div class="menu-wrap">
                            <div class="menuDetail">
                                <a id="" href="organizationChart.emp">조직도</a>
                                <a id="" href="department.ad">부서 관리</a>
                                <a id="" href="employeeList.ad">사원 관리</a>
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
                                <a id="" href="workCalendar.at">근태현황</a>
                                <a id="" href="list.at">근태이력</a>
                                <a id="" href="wtModify.at">근태수정</a>
                                <a id="" href="adModify.wt" style="color:rgb(2, 152, 52)">근태조정</a>
                                <a id="" href="adminWorktime.at" style="color:rgb(2, 152, 52)">근태관리</a>
                                <a id="" href="adminWorkStatistic.at" style="color:rgb(2, 152, 52)">근태통계</a>
                            </div>
                        </div>
                    </div>

                    <div class="menu"  id="">
                        <div class="mainMenu"><img class="menuIcon" src="resources/images/common/holiday.png" alt="" />휴가</div>
                        <div class="menu-wrap">
                            <div class="menuDetail">
                                <a id="" href="menu.le">휴가신청</a>
                                <a id="" href="list.le">휴가상세</a>
                                <a id="" href="adminAll.le">전체휴가일정</a>
                                <a id="" href="adminAnnual.le" style="color:rgb(2, 152, 52)">연차관리</a>
                                <a id="" href="adminList.le"  style="color:rgb(2, 152, 52)">휴가내역</a>
                            </div>
                        </div>
                    </div>
                    
                    <div class="menu"  id="">
                        <div class="mainMenu"><img class="menuIcon" src="resources/images/common/application.png" alt="" />신청</div>
                        <div class="menu-wrap">
                            <div class="menuDetail">
                                <a id="" href="enrollForm.bt">출장신청</a>
                                <a id="" href="enrollForm.ot">시간외 근무신청</a>
                                <a id="" href="list.wt">신청상세</a>
                                <a id="" href="admin.bt" style="color:rgb(2, 152, 52)">출장관리</a>
                                <a id="" href="admin.ot" style="color:rgb(2, 152, 52)">시간외 근무관리</a>
                            </div>
                        </div>
                    </div>

                    <div class="menu"  id="">
                        <div class="mainMenu"><img class="menuIcon" src="resources/images/common/address2.png" alt="" />예약</div>
                        <div class="menu-wrap">
                            <div class="menuDetail">
                                <a id="" href="status.car">차량예약신청</a>
                                <a id="" href="status.cfr">회의실예약신청</a>
                                <a id="" href="list.cfrMe">나의회의실예약</a>
                                <a id="" href="list.carMe">나의차량예약</a>
                                <a id="" href="list.cfr" style="color:rgb(2, 152, 52)">회의실관리</a>
                                <a id="" href="list.car" style="color:rgb(2, 152, 52)">차량관리</a>
                            </div>
                        </div>
                    </div>

                    <div class="menu"  id="approval">
                        <div class="mainMenu"><img class="menuIcon" src="resources/images/common/approval1.png" alt="" />전자결재</div>
                        <div class="menu-wrap">
                            <div class="menuDetail">
                                <a id="myApprovalList" href="mylist.app">기안 문서함</a>
                                <a id="selectunSignList" href="unsignlist.app">미결재 문서함</a>
                                <a id="selectSignList" href="signlist.app">결재 문서함</a>
                                <a id="" href="reflist.app">수신/참조 문서함</a>
                                <a id="selectdraftList" href="draftList.app">임시저장함</a>
                            </div>
                        </div>
                    </div>
                    
                    <div class="menu"  id="email">
                        <div class="mainMenu" onclick="location.href='list.ma?mailCategory=받은메일함'"><img class="menuIcon" src="resources/images/common/email1.png" />이메일</div>
                        
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
            <div class="content">
            
            

</body>
</html>