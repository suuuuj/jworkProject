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
    .workingOuter{
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
        width:100px;
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
        margin-top:30px;
        width:100%;
        border-top:1px solid rgb(234, 234, 234);
        text-align: center;
        font-size: 14px;
        color: rgb(50, 50, 50);
    }
    .workTable td{
        border-bottom: 1px solid rgb(234, 234, 234);
        color:rgb(50, 50, 50);
        height:30px;
    }
    .workTable>tbody>tr:hover{
        opacity: 0.7;
        cursor: pointer;
    }
    input[type=text]{
        width:100px;
        height:25px;
        border: 1px solid rgb(170, 170, 170);
        border-radius: 5px;
    }
    #pagingArea{
    	width:fit-content;
    	margin:auto;
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
        width:200px;
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
        float:right;
        margin-bottom: 5px;
        font-size: 13px;
        font-weight: 600px;
        color:rgb(50,50,50);
    }
    .textWrap div{
        display: inline-block; 
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
    <jsp:include page="../common/menubar.jsp"/>
    <div class="workingOuter">

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
                    <div class="searchArea" style="margin-left:270px;">
                            <input type="text" name="startDate" value="" placeholder="&nbsp;시작일" id="datepicker1">
                            <span style="font-size:25px;">~</span>
                            <input type="text" name="endDate" value="" placeholder="&nbsp;종료일" id="datepicker2">
                            <button type="button" class="btn btn-success" onclick="listFunction();">검색</button>
                    </div>

                <!-- datepicker -->
                <link rel="stylesheet" href="http://code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css"/>
                <script src="http://code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script>
                <script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/i18n/datepicker-ko.js"></script>
                <script>	
                            
                $(function(){
                    
                    
                    $("#datepicker1").datepicker({
                        changeMonth: true, 
                        changeYear: true,
                        nextText: '다음 달',
                        prevText: '이전 달',
                        yearRange: 'c-50:c+20',
                        showButtonPanel: true, 
                        currentText: '오늘 날짜',
                        closeText: '닫기',
                        dateFormat: "yy-mm-dd",
                        showAnim: "slide",
                        showMonthAfterYear: true, 
                        dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
                        monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'], 
                        onSelect: function(selected){
                            $("#datepicker2").datepicker("option", "minDate", selected);
                        }
                    });	
                    
                    $("#datepicker2").datepicker({
                        changeMonth: true, 
                        changeYear: true,
                        minDate: '0',
                        nextText: '다음 달',
                        prevText: '이전 달',
                        yearRange: 'c-50:c+20',
                        showButtonPanel: true, 
                        currentText: '오늘 날짜',
                        closeText: '닫기',
                        dateFormat: "yy-mm-dd",
                        showAnim: "slide",
                        showMonthAfterYear: true, 
                        dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
                        monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'], 
                        onSelect: function(selected){
                            $("#datepicker1").datepicker("option", "maxDate", selected);
                        }
                    });	
                    
                    
                    
                });
                
                </script> 

                <!-- 에러 해결 시작 - 홈짱 -->

                <script>

                    jQuery.browser = {};
                    
                    (function () {
                    
                        jQuery.browser.msie = false;
                    
                        jQuery.browser.version = 0;
                    
                        if (navigator.userAgent.match(/MSIE ([0-9]+)\./)) {
                    
                            jQuery.browser.msie = true;
                    
                            jQuery.browser.version = RegExp.$1;
                    
                        }
                    
                    })();
                    
                    </script>
                    
                    <!-- 에러 해결 종료 - 홈짱 -->
                
            </div>
            <div>
                <table class="workTable">
                    <thead>
                        <tr style="font-size: 15px; font-weight: 600; height:30px; background-color: rgba(0, 172, 0, 0.102);">
                            <td width="182px;">날짜</td>
                            <td width="182px;">근무상태</td>
                            <td width="182px;">출근시간</td>
                            <td width="182px;">퇴근시간</td>
                            <td width="182px;">총근무시간</td>
                        </tr>
                    </thead>
                    <tbody>
                        <input type="hidden" name="attNo" value="">
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
        $(function(){
            $("#textBox").keyup(function(e){
                let content = $(this).val();

                if(content == 0 || content == ""){
                    $(".textCount").text('0자');
                }else{
                    $('.textCount').text(content.length + '자');
                }

                if(content.length > 100){
                    $(this).val($(this).val().substring(0, 100));

                    alert("글자수는 100자까지 입력 가능합니다.");
                };
            });
        })
    </script>

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
            url: "ajaxlist.at",
            data:{
                empNo:${e.empNo},
                attStatus: status,
                cpage: cpage
                },
            success:function(map){
                console.log(map);
                let value = "";
                
                for(i=0; i<map.list.length; i++){
                    value += "<tr onclick='workDetail(" + map.list[i].attNo + ");'>"
                             + "<td>" + map.list[i].attDate + "</td>"
                             + "<td>" + map.list[i].attStatus + "</td>"
                             + "<td>" + map.list[i].startTime + "</td>"
                             + "<td>" + map.list[i].endTime + "</td>"
                             + "<td>" + map.list[i].attTime + "</td></tr>";
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

<!-- 근무수정 상세페이지 -->
<script>
    function workDetail(no){
        console.log(no);
        $.ajax({
            url:"detail.at",
            data:{
                attNo:no
            },
            success:function(a){
                //console.log(result);
                $("#workModal input[name=workDate]").val(a.attDate);
                $("#workModal input[name=workStart]").val(a.startTime);
                $("#workModal input[name=workEnd]").val(a.endTime);
                $("#workModal input[name=attNo]").val(a.attNo);
                $("#workModal input[name=wtNo]").val(a.wtNo);
                $("#workModal").modal('show');
            },
            error:function(){
                console.log("근태상세 ajax 통신실패");
            }
        })

    }
</script>

<!-- 기간검색 : 시작일 종료일로 리스트 조회 -->
<script>
    $(function(){
        listFunction(1);
    })
    function listFunction(cpage){
        var start = $(".searchArea input[name=startDate]").val();
        var end = $(".searchArea input[name=endDate]").val();
        //console.log(start);
        //console.log(end);

        $.ajax({
            url:"ajaxAttendenceList.at",
            type:"GET",
            dateType:"JSON",
            data:{
                startDate:start,
                endDate:end,
                cpage:cpage
            },
            success:function(map){
                console.log(map);
               

                let value = "";
                
                for(i=0; i<map.list.length; i++){
                    value += "<tr onclick='workDetail(" + map.list[i].attNo + ");'>"
                             + "<td>" + map.list[i].attDate + "</td>"
                             + "<td>" + map.list[i].attStatus + "</td>"
                             + "<td>" + map.list[i].startTime + "</td>"
                             + "<td>" + map.list[i].endTime + "</td>"
                             + "<td>" + map.list[i].attTime + "</td></tr>";
                }
                $(".workTable tbody").html(value);
                //$(".workTable tbody >tr").remove();
                
                //페이징바
                let page="";
        	            if(map.pi.currentPage ==1){
        	               page += "<li class='page-item disabled' ><a class='page-link' href='#' style='color:rgb(196, 197, 197)'>Previous</a></li>"
        	            }else{
        	               page += "<li class='page-item'><a class='page-link' onclick='listFunction(" + (map.pi.currentPage-1) + ");'>Previous</a></li>"
        	            }
        	            
        	            for(var p=map.pi.startPage; p<=map.pi.endPage; p++){
        	               page += "<li class='page-item'><a class='page-link' onclick='listFunction(" + p + ");'>" + p + "</a></li>"
        	            }
        	            
        	            if(map.pi.currentPage == map.pi.maxPage){
        	               page += "<li class='page-item disabled'><a class='page-link ' href='#' style='color:rgb(196, 197, 197)'>Next</a></li>"
        	            }else{
        	               page += "<li class='page-item'><a class='page-link' onclick='listFunction(" + (map.pi.currentPage+1) + ");'>Next</a></li>"
        	            }
	            			
                
                $(".pagination").html(page);
            },
            error:function(){
                console.log("ajax 시작일 종료일 사이의 근무상태리스트조회 통신실패");
            }
        })
    }
</script>

<!-- The Modal -->
<div class="modal fade" id="workModal">
    <div class="modal-dialog modal-dialog-centered" style="width:400px;">
        <div class="modal-content">
    
            <!-- Modal Header -->
            <div class="modal-header">
            <h4 class="modal-title" style="color:rgb(0,172,0)">출퇴근 시간변경</h4>
            <button type="button" class="close" data-dismiss="modal" onclick="workClose();">&times;</button><br>
            </div>

            <form action="modify.at" method="post" onsubmit="return confirm('출퇴근시간변경을 등록하시겠습니까?')">
            <!-- Modal body -->
                <div class="modal-body" style="width:360px; margin:auto;">
                    <input type="hidden" name="attNo" value="">
                    <span class="modalS">수정할 날짜</span> 
                    &nbsp;&nbsp;&nbsp;&nbsp;<input type="text" name="workDate" value="" style="float:right;" readonly><br>
                    <span class="modalS">지정 출근시간</span> 
                    &nbsp;&nbsp;&nbsp;&nbsp;<input type="text" name="workStart" value="" readonly><br>
                    <span class="modalS">지정 퇴근시간</span>
                    &nbsp;&nbsp;&nbsp;&nbsp;<input type="text" name="workEnd" value="" readonly><br>
                    <hr>
                    <span class="modalS">수정할 출근시간</span> 
                    &nbsp;&nbsp;&nbsp;&nbsp;<input type="time" name="reStartTime" value=""><br>
                    <span class="modalS">수정할 퇴근시간</span>
                    &nbsp;&nbsp;&nbsp;&nbsp;<input type="time" name="reEndTime" value=""><br>
                    <hr>
                    <span>신청사유</span>
                    <br>
                    <div class="textWrap">
                        <div class="textCount">&nbsp;&nbsp;</div><div class="textTotal">/100자</div>
                    </div>
                    <textarea name="reContent" id="textBox" maxlength="99" placeholder="신청사유를 입력하시오."></textarea>
                    
                </div>
                
                <!-- Modal footer -->
                <div class="modal-footer">
                    <button type="submit" class="btn btn-success">수정</button>
                    <button type="button" class="btn btn-secondary" data-dismiss="modal" onclick="workClose();">Close</button>
                </div>
            </form>
        
        </div>

    </div>
</div>


</body>
</html>