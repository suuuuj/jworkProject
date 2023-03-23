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
    .workSelect button{
        width:60px;
        height:30px;
        font-size: 12px;
        line-height:normal;
        margin-bottom: 5px;
    }
    .workSelect input[type=date]{
        width:100px;
        height:30px;
        border:1px solid rgb(170, 170, 170);
        color:rgb(50,50,50);
        border-radius: 5px;
    }
    .workSelect select{
        width:100px;
        height:30px;
        border:1px solid rgb(170, 170, 170);
        border-radius: 5px;
        font-size: 14px;
        color:rgb(50,50,50);
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
        text-align: center; 
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
    
</style>
</head>
<body>
    <jsp:include page="../common/menubar.jsp"/>
    <div class="workingOuter">

        <h4><b>근무</b></h4>

        <div class="work-area">

            <div class="workSelect">
                기간조회&nbsp;&nbsp;&nbsp;
                <input type="text" name="stDate" value="" id="datepicker1">
                <span style="font-size: 20px; color:rgb(170, 170, 170)">~</span>
                <input type="text" name="edDate" id="datepicker2">
                <button class="btn btn-success">검색</button>
                <br><br>
                근무상태&nbsp;&nbsp;&nbsp;
                <select name="" id="">
                    <option value="">&nbsp;전체</option>
                    <option value="">&nbsp;정상</option>
                    <option value="">&nbsp;지각</option>
                    <option value="">&nbsp;조퇴</option>
                    <option value="">&nbsp;결근</option>
                </select>
                
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
                    dayNamesMin: ['월', '화', '수', '목', '금', '토', '일'],
                    monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월']
                });	
                
                $("#datepicker2").datepicker({
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
                    dayNamesMin: ['월', '화', '수', '목', '금', '토', '일'],
                    monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월']
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
                        <c:forEach var="a" items="${list}">
                            <tr onclick="workDetailFunction(${a.attNo});">
                                <td>${a.attDate}</td>
                                <td>${a.attStatus}</td>
                                <td>${a.startTime}</td>
                                <td>${a.endTime}</td>
                                <td>${a.attTime}</td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>

            <script>
                function workDetailFunction(no){

                }
                $(function(){
                    $(".workTable>tbody>tr").click(function(){
                        $("#workModal").modal('show');
                    })
                })
            </script>

            <br><br>

            <div id="pagingArea">
                <ul class="pagination">
    
                    <c:choose>
                        <c:when test="${ pi.currentPage eq 1 }">
                            <li class="page-item" disabled><a class="page-link" href="#"><</a></li>
                        </c:when>
                        <c:otherwise>
                            <li class="page-item"><a class="page-link"
                                href="admin.ot?cpage=${ pi.currentPage-1 }"><</a></li>
                        </c:otherwise>
                    </c:choose>
    
                    <c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
                        <li class="page-item"><a class="page-link"
                            href="admin.ot?cpage=${ p }">${ p }</a></li>
                    </c:forEach>
    
    
                    <c:choose>
                        <c:when test="${ pi.currentPage eq pi.maxPage }">
                            <li class="page-item" disabled><a class="page-link" href="#">></a></li>
                        </c:when>
                        <c:otherwise>
                            <li class="page-item"><a class="page-link"
                                href="admin.ot?cpage=${ pi.currentPage+1 }">></a></li>
                        </c:otherwise>
                    </c:choose>
                </ul>
            </div>

        </div>

    </div>

    <!-- The Modal -->
    <div class="modal fade" id="workModal">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">
        
                <!-- Modal Header -->
                <div class="modal-header">
                <h4 class="modal-title" style="color:rgb(0,172,0)">출퇴근 시간변경</h4>
                <button type="button" class="close" data-dismiss="modal">&times;</button><br>
                </div>
                
                <!-- Modal body -->
                    <div class="modal-body" style="width:360px; margin:auto;">
                        <span class="modalS">수정할 날짜</span> 
                        &nbsp;&nbsp;&nbsp;&nbsp;<input type="text" name="" value="&nbsp;&nbsp;2023.03.20" style="float:right;" readonly><br>
                        <span class="modalS">지정 출근시간</span> 
                        &nbsp;&nbsp;&nbsp;&nbsp;<input type="text" name="" value="&nbsp;&nbsp;09:20:53" readonly><br>
                        <span class="modalS">지정 퇴근시간</span>
                        &nbsp;&nbsp;&nbsp;&nbsp;<input type="text" name="" value="&nbsp;&nbsp;19:20:53" readonly><br>
                        <hr>
                        <span class="modalS">수정할 출근시간</span> 
                        &nbsp;&nbsp;&nbsp;&nbsp;<input type="time" name="" value="&nbsp;&nbsp;09:20:53"><br>
                        <span class="modalS">수정할 퇴근시간</span>
                        &nbsp;&nbsp;&nbsp;&nbsp;<input type="time" name="" value="&nbsp;&nbsp;19:20:53"><br>
                        <hr>
                        <span>신청사유</span>
                        <br>
                        <div class="textWrap">
                            <div class="textCount">&nbsp;&nbsp;0자</div><div class="textTotal">/100자</div>
                        </div>
                        <textarea name="" id="textBox" maxlength="99" placeholder="신청사유를 입력하시오."></textarea>
                        
                    </div>
                    
                    <!-- Modal footer -->
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                    </div>
            
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


</body>
</html>