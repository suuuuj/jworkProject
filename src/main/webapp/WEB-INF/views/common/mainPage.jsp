<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
/*** outer스타일 ***/
.mainOuter{
    padding:30px;
}
/*** 근태버튼 style ***/
.essBtn-area{
    width:250px;
    height:300px;
    border: 1px solid rgb(220,220,220);
}
#essDate{
    padding-top:70px;
    text-align: center;
    color:rgb(150, 147, 147)
}
#essClock{
    text-align: center;
    color:rgb(50,50,50);
    font-size: 35px;
    font-weight: 600;
}
.btnWrap{
    margin-top:30px;
    text-align: center;
}
#essStart, #essEnd{
    width:80px;
    height:30px;
    border-radius: 5px;
    border:none;
}
.btnPut{
    margin-top: 10px;
    text-align: center;
}
</style>
</head>
<body>
    <jsp:include page="../common/menubar.jsp"/>
    <div class="mainOuter">

    <div class="essBtn-area">
        <div id="essDate"></div>
        <div id="essClock"></div>
        <dir class="btnWrap">
            <button id="essStart">출근</button>
            <button id="essEnd">퇴근</button>
        </dir>
        <div class="btnPut">
            <span id="btnStart" style="padding-right:15px;">08:10:53</span>
            <span id="btnEnd">20:19:53</span>
        </div>
    </div>


    </div>

    <script>
        $(function(){
            var today = new Date();
            var year = today.getFullYear();
            var month = ('0' + (today.getMonth() + 1)).slice(-2);
            var day = ('0' + today.getDate()).slice(-2);
            var week = new Array('일', '월', '화', '수', '목', '금', '토');

            var dateString = year + '년 ' + month  + '월 ' + day + '일' + '(' + week[today.getDay()] + ')';
            $("#essDate").text(dateString);
        })
    </script>
    <script>
        function setClock(){
            var dateInfo = new Date(); 
            var hour = modifyNumber(dateInfo.getHours());
            var min = modifyNumber(dateInfo.getMinutes());
            var sec = modifyNumber(dateInfo.getSeconds());
            document.getElementById("essClock").innerHTML = hour + " : " + min  + " : " + sec;
        }
        function modifyNumber(time){
            if(parseInt(time)<10){
                return "0"+ time;
            }
            else
                return time;
        }
        window.onload = function(){
            setClock();
            setInterval(setClock,1000); //1초마다 setClock 함수 실행
        }
    </script>
</body>
</html>