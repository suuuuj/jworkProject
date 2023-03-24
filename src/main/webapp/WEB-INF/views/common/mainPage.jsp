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
    margin-top:40px;
    text-align: center;
}
#essStart, #essEnd{
    width:80px;
    height:30px;
    border-radius: 5px;
    border:none;
    font-weight: 500;
    font-size: 15px;
}
#essStart:hover, #essEnd:hover{
    background-color: rgb(0,172,0);
    color:white;
}
.btnPut{
    margin-top: 10px;
}
#startResult, #endResult{
    width:100px;
    height:30px;
    color:rgb(150, 147, 147)
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
                <button type="button" id="essStart" onclick="startResult(${at.attNo});">출근</button>
                <button type="button" id="essEnd" onclick="endResult(${at.attNo});">퇴근</button>
            </dir>
            <div class="btnPut">
                <span id="startResult" style="margin-left:47px;">${at.startTime}</span>
                <span id="endResult" style="margin-left:13px;">${at.endTime}</span>
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

</body>
</html>