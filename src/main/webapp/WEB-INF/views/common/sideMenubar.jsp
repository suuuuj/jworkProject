<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<!-- Popper JS -->
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<!-- Latest compiled JavaScript -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>

<!-- Alertify JavaScript -->
<script src="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/alertify.min.js"></script>

<!-- CSS -->
<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/css/alertify.min.css"/>
<!-- Default theme -->
<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/css/themes/default.min.css"/>
<!-- Semantic UI theme -->
<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/css/themes/semantic.min.css"/>
<!-- Bootstrap theme -->
<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/css/themes/bootstrap.min.css"/>

<!-- 구글 글씨체 -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic:wght@400;700&display=swap" rel="stylesheet">

<!-- Bootstrap 5버전 -->
<!-- Latest compiled and minified CSS -->
<!-- <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">  -->
<!-- Latest compiled JavaScript -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script> 
<style>
    
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
	<c:if test="${not empty alertMsg }">
		<script>
			alertify.alert('${alertMsg}');
		</script>
		<c:remove var="alertMsg" scope="session"/>	
	</c:if>
	    
    <div class="totalOuter">

        <div class="home">
            <div class="header">
                <div class="logo-box">
                    
                    <a href="#"><img class="logo" src="resources/images/common/jworkLogo.png" alt="" style="width: 230px;"/></a>
                    
                </div>

            </div>
			<div class="header-right">
                	<a href="#"><img class="headerIcon" src="resources/images/common/email1.png" alt=""></a>&nbsp;&nbsp;
                	<a href="#"><img class="headerIcon" src="resources/images/common/profileDefault3.png" alt=""></a>
            </div>
            
        </div>
        <div class="gradation"></div>
        <div class="outer">
            <input type="checkbox" id="menuicon">
            <label for="menuicon">
                <span></span>
                <span></span>
                <span></span>
            </label>
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
                        <div class="mainMenu"><img class="menuIcon" src="resources/images/common/homepage.png" alt="" />홈피드</div>
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
                                <a id="" href="">부서 관리</a><br>
                                <a id="" href="">사원 관리</a><br>
                            </div>
                        </div>
                    </div>
                    
                    <div class="menu"  id="">
                        <div class="mainMenu" onclick="location.href='address.emp'"><img class="menuIcon" src="resources/images/common/address1.png" alt="" />주소록</div>
                        <div class="menu-wrap">

                        </div>
                    </div>

                    <div class="menu"  id="">
                        <div class="mainMenu"><img class="menuIcon" src="resources/images/common/working.png" alt="" />근무</div>
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
                        <div class="mainMenu"><img class="menuIcon" src="resources/images/common/holiday.png" alt="" />휴가</div>
                        <div class="menu-wrap">
                            <div class="menuDetail">
                                <a id="" href="menu.le">휴가신청</a><br>
                                <a id="" href="list.le">휴가상세</a><br>
                                <a id="" href=""></a><br>
                                <a id="" href=""></a><br>
                                <a id="" href=""></a><br>
                            </div>
                        </div>
                    </div>

                    <div class="menu"  id="approval">
                        <div class="mainMenu"><img class="menuIcon" src="resources/images/common/approval1.png" alt="" />전자결재</div>
                        <div class="menu-wrap">
                            <div class="menuDetail">
                                <a id="myApprovalList" href="mylist.app">내 결제 문서</a><br>
                                <a id="" href="">미결재 문서</a><br>
                                <a id="" href="">수신 참조 문서함</a><br>
                                <a id="" href="">임시저장함</a><br>
                            </div>
                        </div>
                    </div>
                    
                    <div class="menu"  id="">
                        <div class="mainMenu" onclick="location.href='list.ma'"><img class="menuIcon" src="resources/images/common/email1.png" />이메일</div>
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
            <div class="content">
            
            

</body>
</html>