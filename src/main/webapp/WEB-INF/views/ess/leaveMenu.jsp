<%@ page language="java" contentType="text/html; charset=UTF-8"
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
	div{
        box-sizing: border-box;
    }
    .leaveOuter{
        padding:50px;
        margin:auto;
    }
    /*
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
    */
    .leaveMenu{
        width:200px;
        height:130px;
        border-radius: 30px;
        border:1px solid rgb(234, 234, 234);
        display: inline-block;
        margin-top:20px;
    }
    .leaveMenu>img{
        border:none;
        width:40px;
        height:40px;
        margin-top:15px;
        margin-left: 10px;
        margin-bottom: 5px;

    }
    .leaveMenu:hover{
        cursor: pointer;
    }
</style>
</head>
<body>

<jsp:include page="../common/menubar.jsp"/>

    <div class="leaveOuter">
		
		<h4><b>휴가</b></h4>
        
        <div class="vacation">
            <div class="leaveMenu" onclick="enrollForm(0);">
                <img src="resources/images/ess/annual.png" alt=""> <br>
                <span style="margin-left: 20px; font-size: 13px; color:rgb(80, 80, 80); font-weight: 600;">연차</span><br>
                <span style="margin-left: 20px; font-size: 10px; color:rgb(170, 170, 170)">매월 1일</span>
                <c:choose>
                    <c:when test="${a.annualCount == 0}">
                        <span style="float: right; margin-right: 20px; font-size: 10px; font-weight: 600;; color:rgb(0, 183, 0)">잔여 0일</span>
                    </c:when>
                    <c:otherwise>
                        <span style="float: right; margin-right: 20px; font-size: 10px; font-weight: 600;; color:rgb(0, 183, 0)">잔여 ${a.annualCount}일</span>
                    </c:otherwise>
                </c:choose>
            </div>

            <div class="leaveMenu" style="margin-left:12px;" onclick="enrollForm(1);">
                <img src="resources/images/ess/sad.png" alt=""> <br>
                <span style="margin-left: 20px; font-size: 13px; color:rgb(80, 80, 80); font-weight: 600;">조의-조부모/형제/자매</span><br>
                <span style="margin-left: 20px; font-size: 10px; color:rgb(170, 170, 170)">신청시 3일지급</span>
            </div>

            <div class="leaveMenu" style="margin-left:12px;" onclick="enrollForm(2);">
                <img src="resources/images/ess/baby.png" alt=""> <br>
                <span style="margin-left: 20px; font-size: 13px; color:rgb(80, 80, 80); font-weight: 600;;">산전후-본인</span><br>
                <span style="margin-left: 20px; font-size: 10px; color:rgb(170, 170, 170)">신청시 90일지급</span>
            </div> 

            <div class="leaveMenu" style="margin-left:12px;" onclick="enrollForm(3);">
                <img src="resources/images/ess/marry.png" alt=""> <br>
                <span style="margin-left: 20px; font-size: 13px; color:rgb(80, 80, 80); font-weight: 600;">결혼 - 자녀</span><br>
                <span style="margin-left: 20px; font-size: 10px; color:rgb(170, 170, 170)">신청시 1일지급</span>
            </div>

            <div class="leaveMenu" onclick="enrollForm(4);">
                <img src="resources/images/ess/marry.png" alt=""> <br>
                <span style="margin-left: 20px; font-size: 13px; color:rgb(80, 80, 80); font-weight: 600;">결혼 - 본인</span><br>
                <span style="margin-left: 20px; font-size: 10px; color:rgb(170, 170, 170)">신청시 3일지급</span>
            </div>

            <div class="leaveMenu" style="margin-left:12px;" onclick="enrollForm(5);">
                <img src="resources/images/ess/leave.png" alt=""> <br>
                <span style="margin-left: 20px; font-size: 13px; color:rgb(80, 80, 80); font-weight: 600;">리프레쉬휴가</span><br>
                <span style="margin-left: 20px; font-size: 10px; color:rgb(170, 170, 170)">신청시 90일지급</span>
            </div>

            <div class="leaveMenu" style="margin-left:12px;" onclick="enrollForm(6);">
                <img src="resources/images/ess/sad.png" alt=""> <br>
                <span style="margin-left: 20px; font-size: 13px; color:rgb(80, 80, 80); font-weight: 600;">조의 - 부모/배우자/자녀</span><br>
                <span style="margin-left: 20px; font-size: 10px; color:rgb(170, 170, 170)">신청시 5일지급</span>
            </div>

            <div class="leaveMenu" style="margin-left:12px;" onclick="enrollForm(7);">
                <img src="resources/images/ess/baby.png" alt=""> <br>
                <span style="margin-left: 20px; font-size: 13px; color:rgb(80, 80, 80); font-weight: 600;">산전후 - 본인(다태아)</span><br>
                <span style="margin-left: 20px; font-size: 10px; color:rgb(170, 170, 170)">신청시 120일지급</span>
            </div>

            <div class="leaveMenu" onclick="enrollForm(8);">
                <img src="resources/images/ess/leave.png" alt=""> <br>
                <span style="margin-left: 20px; font-size: 13px; color:rgb(80, 80, 80); font-weight: 600;">공가</span><br>
                <span style="margin-left: 20px; font-size: 10px; color:rgb(170, 170, 170)">신청시 지급</span>
            </div>

        </div>

    </div>
    
    <script>
    	function enrollForm(e){

            if(e == 0){
                if(${a.annualCount == 0}){
                    alert("연차를 신청하실수 없습니다.");
                }else {
                    location.href = "enrollForm.le?no=" + e ;
                }
            }else{
                location.href = "enrollForm.le?no=" + e ;
            }
    	}
    </script>




</body>
</html>