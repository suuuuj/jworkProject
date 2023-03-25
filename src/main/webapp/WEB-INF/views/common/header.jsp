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

<!-- sweetalert -->
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<!-- <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script> -->

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
        position: relative;
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
    #alarmBtn, #profileBtn{
        border:none;
        background-color: white;
    }
    .alarm-area {
        width: 300px;
        height: 300px;
        overflow: auto;
    }
    .profile-area{
        height: 150px;
        width: 300px;
    }
    .number{
        font-size: 12px;
        color: gray;
    }
    .profileControl-area{
        margin-top: 10px;
        text-align: center;
    }
    .alarms{
        height: 40px;
    }
    .readN{
        background-color: rgb(248, 242, 215);
    }
    .alarmControl{
        font-size:14px;
    }
    .alarm-delete{
        font-size:12px;
        float: right;
    }
    .alarm-delete:hover{
        cursor: pointer;
    }
    .alarm-logo{
        width: 30px;
    }
    .textmsg{
        font-size: 14px;
        padding-left: 10px;
    }
    .newAlarm{
        position: absolute;
        top: 30px;
        right: 50px;
        font-size: 12px;
        color: white;
        background-color: red;
        border-radius: 5px;
    }
     

	
</style>
<title>menubar</title>
</head>
<body>
	<c:if test="${not empty alertMsg }">
		<script>
			//alertify.alert('${alertMsg}');
            swal('${alertMsg}', '', 'success');
		</script>
		<c:remove var="alertMsg" scope="session"/>	
	</c:if>
	    
    <div class="totalOuter">

        <div class="home">
            <div class="header">
                <div class="logo-box">
                    
                    <a href="home.jwork"><img class="logo" src="resources/images/common/jworkLogo.png" alt="" style="width: 230px;" /></a>
                    
                </div>

            </div>
			<div class="header-right dropdown">
                <span class="newAlarm" id="newIcon" style="display:none">&nbsp;new&nbsp;</span>
                <button id="alarmBtn"  data-bs-toggle="dropdown" data-bs-auto-close="outside"><img class="headerIcon " src="resources/images/common/alarmLogo.png" ></button>
                <ul class="dropdown-menu">
                    <div class="alarm-area">
                        <li class="alarmControl">
                            <div class="dropdown-item-text">
                                &nbsp;안읽은 알람 <span class="alarmCount"></span> 개<span class="alarm-delete">모두 삭제</span>
                            </div>
                        </li>
                        <div class="alarmsDiv">
                            


                        </div>
                        
                        
                    </div>
                </ul>
                &nbsp;&nbsp;
                <button id="profileBtn"  data-bs-toggle="dropdown" data-bs-auto-close="outside"><img class="headerIcon" src="resources/images/common/profileDefault3.png" alt=""></button>
                <ul class="dropdown-menu">
                    <div class="profile-area">
                        <li class="profileInformation">
                            <div class="info-box dropdown-item-text">
                                <div class="left"><a href="myPage.emp"><img class="menubarProfileImg" src="<c:out value='${ loginUser.profileUrl }' default='resources/images/common/profileDefault3.png' />" /></a></div>
                                <div class="right">
                                    <span class="name">${ loginUser.empName }</span> <span class="number">${loginUser.empNo}</span>
                                    <p style="font-size: 12px;">${ loginUser.deptName }&nbsp;${ loginUser.teamName }&nbsp;${ loginUser.jobName }</p>
                                </div>
                            </div>
                        </li>
                        <li class="profileControl">
                            <div class="dropdown-item-text profileControl-area">
                                <button class="btn btn-outline-success">마이페이지</button>&nbsp;&nbsp;<button class="btn btn-outline-warning">로그아웃</button>
                            </div>
                        </li>
                        
                    </div>
                </ul>
            </div>
            <script src="https://cdn.jsdelivr.net/sockjs/1/sockjs.min.js"></script>          
            <script>
                var socket = null;
                $(function(){
                    connectWS();
                    
                });

                function connectWS(){
                    var ws = new SockJS("${ pageContext.request.contextPath }/alarm");
                    socket = ws;
                    
                    ws.onopen = function() {
                        console.log('open');

                        ws.onmessage = function(event) {
                            console.log("onmessage : " +event.data);
                            
                            $("#newIcon").css("display", "block");

                        };
                        
                        ws.onclose = function(event) {
                            console.log('close');
                            //setTimeout( function(){connect();}, 1000); // retry connection
                        };
                    };
                    
                    

                    ws.onerror = function(event){
                        console.log('close');
                    };
                }
                
                function loadAlarm(){
                    const empNo = ${ loginUser.empNo };
                    $.ajax({
                        url: "list.alarm",
                        data:{targetNo:empNo},
                        success: function(alarm){
                            //console.log(alarm);
                            const unRead = alarm.unRead;
                            const list = alarm.list;

                            $(".alarmCount").text(unRead);
                            let msg = "";

                            if(list.length == 0){
                                msg += '<li class="noAlarm"><a class="dropdown-item disabled" href="#"><div class="alarms"><img class="alarm-logo" src="resources/images/common/noAlarm.png" alt=""><span class="textmsg">알림이 없습니다.<span></div></a></li>';
                                
                            } else{
                                for(let i=0; i<list.length; i++){
                                    msg += '<li class="alarm read' + list[i].read + '"><a class="dropdown-item " alarmNo=' + list[i].alarmNo + ' href="#" url=' + list[i].url + ' read=' + list[i].read + '><div class="alarms">';
                                    if(list[i].refType == 'mail'){
                                        msg += '<img class="alarm-logo" src="resources/images/common/email1.png" alt="">';
                                    } else{
                                        // 다른 종류의 알람일때

                                    }
                                    msg += '<span class="textmsg">' + list[i].alarmMsg + '</span></div></a>';
                                    
                                }
                            }
                            $(".alarmsDiv").html(msg);
                            //console.log($("li").length);
                            

                        }, error: function(){
                            console.log("알람 리스트 조회용 ajax통신 실패");
                        }
                    })


                    
                }

                $(document).on("click", "#alarmBtn", function(){
                    //console.log($("#newIcon").css("display"));
                    if($("#newIcon").css("display") == "block"){
                        $("#newIcon").css("display", "none");
                    }
                    loadAlarm();
                })

                $(document).on("click", ".alarmsDiv .dropdown-item", function(){
                    const $alarmNo = $(this).attr("alarmNo");
                    const $read = $(this).attr("read");
                    const $url = $(this).attr("url");
                    console.log($alarmNo);
                    console.log($url);
                    if($read == 'N'){
                        $.ajax({
                            url: "readAlarm.al",
                            data: {alarmNo: $alarmNo},
                            success: function(result){
                                if(result == "fail"){
                                    alert("알 수 없는 오류로 읽어올 수 없습니다. 다시 시도해주세요");
                                }
                            }, error: function(){
                                console.log("알림 읽기 및 이동용 ajax 통신 실패");
                            }
                        })
                    }

                    location.href = $url;
                    
                })

                $(document).on("click", ".alarm-delete", function(){
                    // 알람이 1개 이상인 경우
                    if($(".alarm").length > 0){
                        $.ajax({
                            url:"deleteAlarms.al",
                            data:{targetNo:${ loginUser.empNo }},
                            success: function(result){
                                if(result == "fail"){
                                    alert("알 수 없는 오류로 실패했습니다. 다시 시도해주세요.");
                                }else{
                                    $(".alarmsDiv").html("");
                                    loadAlarm();
                                }
                            }, error: function(){
                                console.log("알람 삭제용 ajax 통신 실패");
                            }
                            
                        })
                        
                    }
                    $(".alarmsDiv").html("");
                    loadAlarm();
                    
                })




            </script>
        </div>
        <div class="gradation"></div>
        <div class="outer">



</body>
</html>