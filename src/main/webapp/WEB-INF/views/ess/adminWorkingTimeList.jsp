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
    /* outer영역 */
    .workOuter{
        padding:50px;
        margin: auto;
    }
    /* content영역 */
    .work-area{
        margin-top: 30px;
    }
    .workSelect{
        color:rgba(50, 50, 50);
        font-size: 15px;
        font-weight: 600;
    }
    .workSelect select{
        width:80px;
        height:30px;
        border-radius: 5px;
        border:1px solid rgb(170, 170, 170);
    }
    .workSelect input[type=text]{
        width:80px;
        height:30px;
        border-radius: 5px;
        border:1px solid rgb(170, 170, 170);
    }
    .workSelect input[type=text]::placeholder{
        font-size: 13px;
    }
    .workSelect button{
        width:60px;
        height:30px;
        border-radius: 5px;
        line-height: 5px;
        font-size: 14px;
        margin-bottom: 3px;
    }
    .workSelect>div{
        display: inline-block;
    }
    .workTable{
        width:100%;
        text-align: center;
        margin-top:30px;
        border-collapse: collapse;
        border-spacing: 0;
        font-size: 14px;
        color:rgb(51,51,51);
    }
    .workTable td{
        width:182px;
        height:30px;
        color:rgb(50,50,50);
        border-bottom: 1px solid rgb(234, 234, 234);
    }
    .paging-area button{
        width:30px;
        height:30px;
        border:none;
        border-radius: 5px;
    }
    .workList>div{
        display: inline-block;
    }
    .workDay{
        box-sizing: border-box;
        width:100%;
        height:30px;
        margin-left:340px;
    }
    .workDay input{
        border:none;
        text-align: center;
        color:rgb(0, 172, 0);
        font-size: 18px;
        font-weight: 600;
        width:160px;
    }
    #daycheck{
        border:none;
        background-color: white;
        color:rgb(50,50,50);
        font-size: 20px;
        font-weight: 900;
    }
    .btnArea button{
        font-size: 12px;
        height: 27px;
		border: 0;
		border-radius: 5px;
		width: 39px;
		color: white;
        margin-bottom: 6px;
    }
    .my.pagination.justify-content-end.pagination-sm>li>a{
        color: rgb(14, 126, 14);
        font-weight: bolder;
    } 
</style>
</head>
<body>
    <jsp:include page = "../common/menubar.jsp" />
    <div class="workOuter">

        <h4><b>근무</b></h4>
        <div class="work-area">

            <div class="workSelect" style="display:inline-block">
                <div class="btnArea" style="margin-top: 5px;">
                    근무상태&nbsp;&nbsp;&nbsp;
                    <button type="button" id="allBtn" style="background: green;">전체</button>
                    <button type="button" id="waitBtn" style="background: gray;">정상</button>
                    <button type="button" id="ingBtn" style="background: gray;">지각</button>
                    <button type="button" id="finBtn" style="background: gray;">조퇴</button>
                    <button type="button" id="reBtn" style="background: gray;">결근</button>
                </div>
                <div style="margin-left:300px;">
                        <input type="text" name="" value="" placeholder="&nbsp;시작일">
                        <span style="font-size:25px;">~</span>
                        <input type="text" name="" value="" placeholder="&nbsp;종료일">
                        <button type="button" class="btn btn-success">검색</button>
                </div>
                
            </div>

            <br>

            <div class="workList">
                <table class="workTable">
                    <colgroup>
                        <col width="5%">
                        <col width="*">
                        <col width="*">
                        <col width="*">
                        <col width="*">
                        <col width="**">
                        <col width="12%">
                        <col width="12%">
                        <col width="12%">
                        <col width="10%">
                    </colgroup>
                    <thead>
                            <tr style="font-weight: 600; background: rgb(234, 234, 234);">
                                <td scope="col">No.</td>
                                <td scope="col">사번</td>
                                <td scope="col">소속</td>
                                <td scope="col">직위</td>
                                <td scope="col">이름</td>
                                <td scope="col">근무일자</td>
                                <td scope="col">출근시간</td>
                                <td scope="col">퇴근시간</td>
                                <td scope="col">총근무시간</td>
                                <td scope="col">근무상태</td>
                            </tr>
                        </thead>
                        <tbody>
                            
                        </tbody>
                </table>
            </div>
            
            <br><br>
            <div id="pagingArea">
			
				<ul class="my pagination justify-content-end pagination-sm">
			
				</ul>
		    </div>
            
        </div>

    </div>

    <script>
        
        let statusCode = 100;
      
        function selectAppList(status, cpage){
            $.ajax({
                url: "adWorktimeStatus.at",
                data:{
                    empNo:${e.empNo},
                    attStatus: status,
                    cpage: cpage
                    },
                success:function(map){
                    console.log(map);
                    /*
                        map
                        {
                          listCount : 10,
                          pi : {currentPage:x, listCount:x, ... },
                          list : [{empNo:xx, ...}, {}, ]
                        }
                    */
                    
                    let value = "";
                    
                    for(i=0; i<map.list.length; i++){
                        value += "<tr>"
                                 + "<td>" + map.list[i].attNo + "</td>"
                                 + "<td class='ano'>" + map.list[i].empNo + "</td>"
                                 + "<td>" + map.list[i].teamName + "</td>"
                                 + "<td>" + map.list[i].jobName + "</td>"
                                 + "<td>" + map.list[i].empName + "</td>"
                                 + "<td>" + map.list[i].attDate + "</td>"
                                 + "<td>" + map.list[i].startTime + "</td>"
                                 + "<td>" + map.list[i].endTime + "</td>"
                                 + "<td>" + map.list[i].attTime + "</td>"
                                 + "<td>" + map.list[i].attStatus + "</td></tr>";
                    }
                    $(".workTable tbody").html(value);
                    
                    //페이징바
                    let page="";
                    if(map.pi.currentPage ==1){
                       page += "<li class='page-item disabled' ><a class='page-link' href='#' style='color:rgb(196, 197, 197)'>Previous</a></li>"
                    }else{
                       page += "<li class='page-item'><a class='page-link' onclick='selectAppList(" + statusCode + ", " + (map.pi.currentPage-1) + ");'>Previous</a></li>"
                    }
                    
                    for(var p=map.pi.startPage; p<=map.pi.endPage; p++){
                       page += "<li class='page-item'><a class='page-link' onclick='selectAppList(" + statusCode + ", " + p + ");'>" + p + "</a></li>"
                    }
                    
                    if(map.pi.currentPage == map.pi.maxPage){
                       page += "<li class='page-item disabled'><a class='page-link ' href='#' style='color:rgb(196, 197, 197)'>Next</a></li>"
                    }else{
                       page += "<li class='page-item'><a class='page-link' onclick='selectAppList(" + statusCode + ", " + (map.pi.currentPage+1) + ");'>Next</a></li>"
                    }
                    
                    $(".pagination").html(page);
                    
                }, error:function(){
                       console.log("ajax 통신 실패");
                    }
            })
        }
        
        $(function(){
            selectAppList(100, 1);
        })
        
        //각 버튼 누를시 뜨는 리스트
        $("#allBtn").click(function(){
            selectAppList(100, 1);
            $(this).css("background-color", "green").css("color", "white");
            $("#waitBtn").css("background-color", "gray").css("color", "white");
            $("#ingBtn").css("background-color", "gray").css("color", "white");
            $("#finBtn").css("background-color", "gray").css("color", "white");
            $("#reBtn").css("background-color", "gray").css("color", "white");
            statusCode = 100;
        })
        
        $("#waitBtn").click(function(){
            selectAppList(0, 1);
            $(this).css("background-color", "green").css("color", "white");
            $("#allBtn").css("background-color", "gray").css("color", "white");
            $("#ingBtn").css("background-color", "gray").css("color", "white");
            $("#finBtn").css("background-color", "gray").css("color", "white");
            $("#reBtn").css("background-color", "gray").css("color", "white");

            statusCode = 0;
        })
        
        $("#ingBtn").click(function(){
            selectAppList(1, 1);
            $(this).css("background-color", "green").css("color", "white");
            $("#allBtn").css("background-color", "gray").css("color", "white");
            $("#waitBtn").css("background-color", "gray").css("color", "white");
            $("#finBtn").css("background-color", "gray").css("color", "white");
            $("#reBtn").css("background-color", "gray").css("color", "white");

            statusCode = 1;
        })
        
        $("#finBtn").click(function(){
            selectAppList(2, 1);
            $(this).css("background-color", "green").css("color", "white");
            $("#allBtn").css("background-color", "gray").css("color", "white");
            $("#waitBtn").css("background-color", "gray").css("color", "white");
            $("#ingBtn").css("background-color", "gray").css("color", "white");
            $("#reBtn").css("background-color", "gray").css("color", "white");
            
            statusCode = 2;
        })
        
        $("#reBtn").click(function(){
            selectAppList(3, 1);
            $(this).css("background-color", "green").css("color", "white");
            $("#allBtn").css("background-color", "gray").css("color", "white");
            $("#waitBtn").css("background-color", "gray").css("color", "white");
            $("#finBtn").css("background-color", "gray").css("color", "white");
            $("#ingBtn").css("background-color", "gray").css("color", "white");
            
            statusCode = 3;
        })
    

    </script>

    
</body>
</html>