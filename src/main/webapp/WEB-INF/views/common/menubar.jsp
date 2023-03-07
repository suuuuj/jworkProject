<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
    <!-- jQuery library -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
    <!-- Popper JS -->
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <!-- Latest compiled JavaScript -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
<style>

     .totalOuter{
         width:1200px;
         background-color: #fff;

     }
     .outer{width:1200px;}
     .home{
         height:100px;
         width:1200px;
         box-sizing: border-box ;
         background: rgba(240, 240, 240, 0.712);
     }
     .menubar{
         width:240px;
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

    
     a {color: #000;text-decoration: none;}
     a:hover{background: rgb(199, 199, 199);}

     .header{
         display: flex;
         align-items: center;
         width: 100%;
         height: 67px;
         border-bottom: 1px solid #5e5e5e;
         background: rgba(240, 240, 240, 0.712);
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
     .menubarArea{
        margin: 10px;
     }
     .menu{
        margin-top: 10px;
     }
     .mainMenu{height:30px}
     .mainMenu:hover{
        cursor:pointer;
        background-color: rgb(130, 180, 130);
    }
     .menuIcon{
         width: 20px;
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
	    
    <div class="totalOuter">

        <div class="home">
            <div class="header">
                <div class="logo-box">
                    <h1 class="logo">
                      <a href="#"><img src="resources/images/common/logo.jpg" alt="" /></a>
                    </h1>
                  </div>
                <ul>
                    <li><a href="#"><img src="resources/images/common/mail.jpg" alt=""></a></li>
                    <li><a href="#"><img src="resources/img/common/login.jpg" alt=""></a></li>
                </ul>
            </div>

        </div>

        <div class="outer">

            <div class="menubar">
                <div class="info-box">
                    <div class="left"><img src="resources/images/common/profile.jpg" alt="" /></div>
                    <div class="right">
                        <p class="name">김정만</p>
                        <p style="font-size: 12px;">사원이지롱</p>
                        </div>
                </div>

                <div class="menubarArea">
                    <div class="menu"  id="">
                        <div class="mainMenu"><img class="menuIcon" src="resources/images/common/menu_ico.jpg" alt="" />홈피드</div>
                        <div class="menu-wrap">

                        </div>
                    </div>

                    <div class="menu"  id="">
                        <div class="mainMenu"><img class="menuIcon" src="resources/images/common/menu_ico.jpg" alt="" />일정관리</div>
                        <div class="menu-wrap">
                            
                        </div>
                    </div>

                    <div class="menu"  id="">
                        <div class="mainMenu"><img class="menuIcon" src="resources/images/common/menu_ico.jpg" alt="" />조직도</div>
                        <div class="menu-wrap">
                            
                        </div>
                    </div>

                    <div class="menu"  id="">
                        <div class="mainMenu"><img class="menuIcon" src="resources/images/common/menu_ico.jpg" alt="" />근무</div>
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

                    <div class="menu"  id="approval">
                        <div class="mainMenu"><img class="menuIcon" src="resources/images/common/menu_ico.jpg" alt="" />전자결재</div>
                        <div class="menu-wrap">
                            <div class="menuDetail">
                                <a id="insertApproval" href="">결재 문서 작성</a><br>
                                <a id="myApproval" href="">내 결제 문서</a><br>
                                <a id="" href="">미결재 문서</a><br>
                                <a id="" href="">수신 참조 문서함</a><br>
                                <a id="" href="">임시저장함</a><br>
                            </div>
                        </div>
                    </div>
                    
                    <div class="menu"  id="">
                        <div class="mainMenu"><img class="menuIcon" src="resources/images/common/menu_ico.jpg" alt="" />이메일</div>
                        <div class="menu-wrap">
                            <div class="menuDetail">
                                <a id="" href="list.ma">받은 메일함</a><br>
                                <a id="" href=""></a><br>
                                <a id="" href=""></a><br>
                                <a id="" href=""></a><br>
                                <a id="" href=""></a><br>
                            </div>
                        </div>
                    </div>

                    <div class="menu"  id="">
                        <div class="mainMenu"><img class="menuIcon" src="resources/images/common/menu_ico.jpg" alt="" />게시판</div>
                        <div class="menu-wrap">
                            
                        </div>
                    </div>

                    <div class="menu"  id="">
                        <div class="mainMenu"><img class="menuIcon" src="resources/images/common/menu_ico.jpg" alt="" />도움말</div>
                        <div class="menu-wrap">
                            
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