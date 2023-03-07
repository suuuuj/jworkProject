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

     ul, li {list-style: none; text-align: left;}
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

     .header ul{
         display: flex;
         margin-left: auto;
         padding:5px 15px 0;
     }

     .header ul li{
         width: 38px;margin: 0 5px;
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
         font-size: 15px;
         font-weight: bold;
     }
     .menuIcon{
         width: 20px;
         margin-right: 10px;
     }
     .menuDetail{
         padding-left: 30px;
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
                      <a href="#"><img src="resources/img/logo.jpg" alt="" /></a>
                    </h1>
                  </div>
                <ul>
                    <li><a href="#"><img src="resources/img/mail.jpg" alt=""></a></li>
                    <li><a href="#"><img src="resources/img/login.jpg" alt=""></a></li>
                </ul>
            </div>

        </div>

        <div class="outer">

            <div class="menubar">
                <div class="info-box">
                    <div class="left"><img src="resources/img/profile.jpg" alt="" /></div>
                    <div class="right">
                        <p class="name">김정만</p>
                        <p style="font-size: 12px;">사원이지롱</p>
                        </div>
                </div>

                <div class="menubarArea">
                    <div class="mainMenu"  id="" onclick="">
                        <img class="menuIcon" src="resources/img/menu_ico.jpg" alt="" />홈피드
                    </div>

                    <div class="mainMenu"  id="" onclick="">
                        <img class="menuIcon" src="resources/img/menu_ico.jpg" alt="" />일정관리
                    </div>

                    <div class="mainMenu"  id="" onclick="">
                        <img class="menuIcon" src="resources/img/menu_ico.jpg" alt="" />조직도
                    </div>

                    <div class="mainMenu"  id="" onclick="">
                        <img class="menuIcon" src="resources/img/menu_ico.jpg" alt="" />근무
                    </div>

                    <div class="mainMenu"  id="approval" onclick="">
                        <img class="menuIcon" src="resources/img/menu_ico.jpg" alt="" />전자결재
                    </div>
                    <ul class="menuDetail">
                        <li id="insertApproval" onclick="location.href=''">결재 문서 작성</li>
                        <li id="myApproval" onclick="">내 결재 문서</li>
                        <li id="" onclick="">미결재 문서</li>
                        <li id="" onclick="">수신 참조 문서함</li>
                        <li id="" onclick="">임시저장함</li>
                    </ul>

                    <div class="mainMenu"  id="" onclick="">\
                        <img class="menuIcon" src="resources/img/menu_ico.jpg" alt="" />이메일
                    </div>

                    <div class="mainMenu"  id="" onclick="">
                        <img class="menuIcon" src="resources/img/menu_ico.jpg" alt="" />게시판
                    </div>

                    <div class="mainMenu"  id="" onclick="">
                        <img class="menuIcon" src="resources/img/menu_ico.jpg" alt="" />도움말
                    </div>

                </div>

                <script>
                    $(function(){
                        $(".mainMenu").click(function(){
                            const menu1 = $(this).html();

                            if($(this)){
                                
                                if($(this).next().css("display")=="none"){
                                    $(this).siblings("ul").slideUp();
                                    $(this).next().slideDown();
                                }else{
                                    $(this).next().slideUp();
                                }
                            }

                            $(".pageRoute1").html("> <a>" + category1 + "</a>");

                        })

                        $(".categoryMain").next().children("li").click(function(){
                            const category2 = $(this).html();
                            $(".pageRoute2").html("> <a>" + category2 + "</a>");
            
                        })

            
                    })
                </script>


            </div>
            <div class="content">
            
            </div>

        </div>  

    </div>

</body>
</html>