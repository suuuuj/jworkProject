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
<!-- Modal -->
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.3/dist/jquery.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>

<title>Insert title here</title>
<style>
    /* outer영역 */
    .worktimeOuter{
       padding:50px;
    }

    /* content영역 */
    .work-area{
        margin-top: 30px;
    }
    .work-area>span{
        color:rgb(51,51,51);
        font-size: 17px;
        font-weight: 600;
    }
    .workSelect select{
        width:100px;
        height:30px;
        border-radius: 5px;
        border:1px solid rgb(170, 170, 170);
        font-size:14px;
    }
    .workTable{
        width:950px;
        text-align: center;
        margin-top:30px;
        border-collapse: collapse;
        border-spacing: 0;
        font-size: 14px;
        color:rgb(51,51,51);
    }
    .workTable td{
        height:30px;
        color:rgb(50,50,50);
        border-bottom: 1px solid rgb(234, 234, 234);
    }
    .workTable button{
        width:60px;
        height: 30px;
        font-size: 12px;
        line-height: 5px;
        color:white;
    }
    .workTable>tbody>tr:hover{
        opacity: 0.7;
        cursor: pointer;
    }
    .paging-area button{
        width:30px;
        height:30px;
        border:none;
        border-radius: 5px;
    }
    #pagingArea{
    	width:fit-content;
    	margin:auto;
    }
    .btnArea button{
        font-size: 12px;
        height: 27px;
		border: 0;
		border-radius: 5px;
		color: white;
        margin-bottom: 6px;
    }
    .my.pagination.justify-content-end.pagination-sm>li>a{
        color: rgb(14, 126, 14);
        font-weight: bolder;
    } 
    /* modal영역 */
    .modal-content{
        height:600px;
        width:400px;
        font-size: 14px;
    }
    .modal-body input{
        border:1px solid rgb(170, 170, 170);
        border-radius: 5px;
        float:right;
    }
    .modalS{
        display: inline-block;
        margin-bottom: 10px;
    }
    .modal-body textarea{
        resize: none;
        width:330px;
        height:130px;
        margin:auto;
        border:1px solid rgb(170, 170, 170);
        border-radius: 5px;
        padding:10px;
    }
    .textWrap{
        margin-left: 255px;
        margin-bottom: 5px;
        font-size: 13px;
        font-weight: 600px;
        color:rgb(50,50,50)
    }
</style>
</head>
<body>
    <jsp:include page = "../common/menubar.jsp" />
    <div class="worktimeOuter">

        <h4><b>출퇴근시간변경</b></h4>

        <div class="work-area">

            <div class="workSelect" style="display:inline-block">
                <div class="btnArea" style="margin-top: 5px; font-weight: 600;">
                    결재상태&nbsp;&nbsp;&nbsp;
                    <button type="button" id="allBtn" style="background: green; width:39px;">전체</button>
                    <button type="button" id="waitBtn" style="background: gray; width:80px;">결재대기</button>
                    <button type="button" id="ingBtn" style="background: gray; width:39px;">승인</button>
                    <button type="button" id="finBtn" style="background: gray; width:39px;">반려</button>
                </div>
            </div>

            <br>
            
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
                    <tr style="font-weight: 600; background-color: rgba(0, 172, 0, 0.075);">
                        <td scope="col">No.</td>
                        <td scope="col">사번</td>
                        <td scope="col">소속</td>
                        <td scope="col">팀명</td>
                        <td scope="col">직위</td>
                        <td scope="col">이름</td>
                        <td scope="col">조정일</td>
                        <td scope="col">제목</td>
                        <td scope="col">진행상황</td>
                    </tr>
                </thead>
                <tbody>
                    
                </tbody>
            </table>
        </div>

        <script>
            function workDetailFunction(no){
                $.ajax({
                    url:"detailModify.wt",
                    data:{
                        wtNo:no
                    },
                    success:function(w){
                        $("#workModal input[name=workDate]").val(w.attDate);
                        $("#workModal input[name=workStart]").val(w.startTime);
                        $("#workModal input[name=workEnd]").val(w.endTime);
                        $("#workModal input[name=attNo]").val(w.attNo);

                        if(w.reStartTime != null){
                            $("#workModal input[name=reStartTime]").val(w.reStartTime);
                        }else{
                            $("#workModal input[name=reStartTime]").val(w.startTime);
                        }

                        if(w.reEndTime != null){
                            $("#workModal input[name=reEndTime]").val(w.reEndTime);
                        }else{
                            $("#workModal input[name=reEndTime]").val(w.endTime);
                        }
                        $("#reContent").text(w.reContent);

                        var length = w.reContent.length;
                        $(".textCount").text(length + '자');

                    },
                    error:function(){
                        console.log("근태수정상세페이지 ajax 통신실패");
                    }
                })

            }
            $(function(){
                $(".workTable>tbody>tr").click(function(){
                    $("#workModal").modal('show');
                })
            })
        </script>

        <br><br>
        <div id="pagingArea">
			
            <ul class="my pagination justify-content-end pagination-sm">
        
            </ul>
        </div>

    </div>

    <!-- The Modal -->
    <div class="modal fade" id="workModal">
        <div class="modal-dialog modal-dialog-centered" style="width:400px;">
            <div class="modal-content">
        
                <!-- Modal Header -->
                <div class="modal-header">
                <h4 class="modal-title" style="color:rgb(0,172,0)">출퇴근 시간변경</h4>
                <button type="button" class="close" data-dismiss="modal" onclick="workClose();">&times;</button><br>
                </div>
                
                <!-- Modal body -->
                <div class="modal-body" style="width:360px; margin:auto;">
                    <span class="modalS">수정할 날짜</span> 
                    &nbsp;&nbsp;&nbsp;&nbsp;<input type="text" name="workDate" value="" style="float:right;" readonly><br>
                    <span class="modalS">지정 출근시간</span> 
                    &nbsp;&nbsp;&nbsp;&nbsp;<input type="text" name="workStart" value="" readonly><br>
                    <span class="modalS">지정 퇴근시간</span>
                    &nbsp;&nbsp;&nbsp;&nbsp;<input type="text" name="workEnd" value="" readonly><br>
                    <hr>
                    <span class="modalS">수정할 출근시간</span> 
                    &nbsp;&nbsp;&nbsp;&nbsp;<input type="text" name="reStartTime" value="" readonly><br>
                    <span class="modalS">수정할 퇴근시간</span>
                    &nbsp;&nbsp;&nbsp;&nbsp;<input type="text" name="reEndTime" value="" readonly><br>
                    <hr>
                    <span>신청사유</span>
                    <br>
                    <div class="textWrap">
                        <span class="textCount"></span><span class="textTotal">/100자</span>
                    </div>
                    <textarea name="" id="reContent" readonly></textarea>
                    
                </div>
                
                <!-- Modal footer -->
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal" onclick="workClose();">Close</button>
                </div>
            
            </div>
        </div>
    </div>

    <script>
        function workClose(){
            $('#workModal').modal('hide'); 
            $('#workModal').hide();
            $('.jquery-modal').click();
    }

    </script>

    <script>
        
        let statusCode = 100;
      
        function selectAppList(status, cpage){
            $.ajax({
                url: "ajaxWtModify.at",
                data:{
                    approvalCheck: status,
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
                        value += "<tr onclick='workDetailFunction(" + map.list[i].wtNo + ")'>"
                                 + "<td>" + map.list[i].wtNo + "</td>"
                                 + "<td>" + map.list[i].empNo + "</td>"
                                 + "<td>" + map.list[i].deptName + "</td>"
                                 + "<td>" + map.list[i].teamName + "</td>"
                                 + "<td>" + map.list[i].jobName + "</td>"
                                 + "<td>" + map.list[i].empName + "</td>"
                                 + "<td>" + map.list[i].attDate + "</td>"
                                 + "<td>출퇴근시간변경</td>"
                                 + "<td>" + map.list[i].approvalCheck + "</td></tr>";
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
        /*
        $("#reBtn").click(function(){
            selectAppList(3, 1);
            $(this).css("background-color", "green").css("color", "white");
            $("#allBtn").css("background-color", "gray").css("color", "white");
            $("#waitBtn").css("background-color", "gray").css("color", "white");
            $("#finBtn").css("background-color", "gray").css("color", "white");
            $("#ingBtn").css("background-color", "gray").css("color", "white");
            
            statusCode = 3;
        })
        */

    </script>

</body>
</html>