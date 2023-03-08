<%@ page language="java" contentType=`"text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- 부트스트랩 -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<!-- jquery CDN -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<title>Insert title here</title>
<style>
    .outer{
        width:960px;
        height:1000px;
        border:1px solid black;
    }
    .title{
        color:rgb(50,50,50);
        margin-left: 30px;
        margin-top:30px;
    }
    .selectBar{
        margin-left: 30px;
    }
    .vacation{
        margin-left:30px;
        margin-right: 30px;
    }
    .selectBar>span{
        color:rgba(50, 50, 50, 0.79);
        font-size:15px;
        font-weight: 600;
    }
    .selectBar>div{
        margin-top:10px;
        height:3px;
        float: left;
    }
    .menu{
        width:210px;
        height:150px;
        border-radius: 30px;
        border:1px solid rgb(234, 234, 234);
        display: inline-block;
        margin-top:30px;
    }
    .menu>img{
        border:1px solid black;
        width:50px;
        height:50px;
        margin-top:30px;
        margin-left: 20px;
        margin-bottom: 10px;

    }
    .menu>div{
        border:1px solid black;
        margin-left: 20px;
    }
    .menu:hover{
        cursor: pointer;
    }
</style>
</head>
<body>

    <div class="outer">

        <div class="title">
            <h1 style="color:rgb(50,50,50)">휴가<h1> 
        </div>
        <br>
        <div class="selectBar">
            <span>&nbsp;휴가등록</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span>휴가상세</span> <br>
            <div style="width:67px; background: rgb(170, 170, 170);">&nbsp;</div>
            <div style="width:67px; background: rgb(234, 234, 234);">&nbsp;</div>
            <div style="width:766px; background: rgb(234, 234, 234);">&nbsp;</div>
        </div>

        <div class="vacation">
            <div class="menu">
                <img src="" alt=""> <br>
                <span style="margin-left: 20px; font-size: 14px; color:rgb(80, 80, 80); font-weight: 600;">연차</span><br>
                <span style="margin-left: 20px; font-size: 12px; color:rgb(170, 170, 170)">매월 1일</span>
                <span style="float: right; margin-right: 15px; font-size: 12px; font-weight: 600;; color:rgb(0, 183, 0)">잔여 11일</span>
            </div>

            <div class="menu" style="margin-left: 12px;">
                <img src="" alt=""> <br>
                <span style="margin-left: 20px; font-size: 14px; color:rgb(80, 80, 80); font-weight: 600;">조의-조부모/형제/자매</span><br>
                <span style="margin-left: 20px; font-size: 12px; color:rgb(170, 170, 170)">신청시 3일지급</span>
            </div>

            <div class="menu" style="margin-left: 12px;">
                <img src="" alt=""> <br>
                <span style="margin-left: 20px; font-size: 14px; color:rgb(80, 80, 80); font-weight: 600;;">산전후-본인</span><br>
                <span style="margin-left: 20px; font-size: 12px; color:rgb(170, 170, 170)">신청시 90일지급</span>
            </div> 

            <div class="menu">
                <img src="" alt=""> <br>
                <span style="margin-left: 20px; font-size: 14px; color:rgb(80, 80, 80); font-weight: 600;">결혼 - 자녀</span><br>
                <span style="margin-left: 20px; font-size: 12px; color:rgb(170, 170, 170)">신청시 1일지급</span>
            </div>

            <div class="menu" style="margin-left: 12px;">
                <img src="" alt=""> <br>
                <span style="margin-left: 20px; font-size: 14px; color:rgb(80, 80, 80); font-weight: 600;">결혼 - 본인</span><br>
                <span style="margin-left: 20px; font-size: 12px; color:rgb(170, 170, 170)">신청시 3일지급</span>
            </div>

            <div class="menu" style="margin-left: 12px;">
                <img src="" alt=""> <br>
                <span style="margin-left: 20px; font-size: 14px; color:rgb(80, 80, 80); font-weight: 600;">리프레쉬휴가</span><br>
                <span style="margin-left: 20px; font-size: 12px; color:rgb(170, 170, 170)">신청시 90일지급</span>
            </div>

            <div class="menu">
                <img src="" alt=""> <br>
                <span style="margin-left: 20px; font-size: 14px; color:rgb(80, 80, 80); font-weight: 600;">조의 - 부모/배우자/자녀</span><br>
                <span style="margin-left: 20px; font-size: 12px; color:rgb(170, 170, 170)">신청시 5일지급</span>
            </div>

            <div class="menu" style="margin-left: 12px;">
                <img src="" alt=""> <br>
                <span style="margin-left: 20px; font-size: 14px; color:rgb(80, 80, 80); font-weight: 600;">산전후 - 본인(다태아)</span><br>
                <span style="margin-left: 20px; font-size: 12px; color:rgb(170, 170, 170)">신청시 120일지급</span>
            </div>

            <div class="menu" style="margin-left: 12px;">
                <img src="" alt=""> <br>
                <span style="margin-left: 20px; font-size: 14px; color:rgb(80, 80, 80); font-weight: 600;">공가</span><br>
                <span style="margin-left: 20px; font-size: 12px; color:rgb(170, 170, 170)">신청시 지급</span>
            </div>







        </div>





    </div>




</body>
</html>