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
    .annualOuter{
        padding:50px;
        margin:auto'
    }
    /* content영역 */
    .vacation{
        margin-top: 30px;
    }
    .btnArea button{
        font-size: 13px;
        height: 30px;
		border: 0;
		border-radius: 5px;
		width: 100px;
		color: rgb(50,50,50);
        font-weight: 600;
        margin-bottom: 6px;
    }
    .btnArea button:hover{
        opacity: 0.7;
    }
    .annualTable{
        width:100%;
        text-align: center;
        margin-top:30px;
        border-collapse: collapse;
        border-spacing: 0;
        font-size: 14px;
        color:rgb(51,51,51);
    }
    .annualTable td{
        width:182px;
        height:30px;
        color:rgb(50,50,50);
        border-bottom: 1px solid rgb(234, 234, 234);
    }
    .list-area input{
        border:none;
        height:30px;
        border-radius: 5px;
        width: 80px;
        height:20px;
        text-align: center;

    }
    .annualTable button{
        width:50px;
        height:25px;
        line-height: 5px;
        font-size: 12px;
    }
    /* modal영역 */
    .modal-content{
        font-size: 14px;
        border:1px solid red;
        margin:auto;
        height:550px;
    }
    .modal-body input{
        border:1px solid rgb(170, 170, 170);
        border-radius: 5px;
    }
    .modalS{
        display: inline-block;
        margin-bottom: 10px;
    }
    .btextarea{
        resize: none;
        width:300px;
        height:260px;
        border:1px solid rgb(170, 170, 170);
        border-radius: 5px;
        padding:10px;
    }
	.otextarea{
        resize: none;
        width:300px;
        height:200px;
        border:1px solid rgb(170, 170, 170);
        border-radius: 5px;
        padding:10px;
    }
    .textWrap{
        margin-left: 230px;
        margin-bottom: 5px;
        font-size: 13px;
        font-weight: 600;
        color:rgb(50,50,50)
    }
</style>
</head>
<body>

    <jsp:include page = "../common/menubar.jsp" />
    <div class="annualOuter">

        <h4><b>신청</b></h4>
        
        <div class="vacation">

            <div class="btnArea">
                 <!-- 매년 1월1일에만 1년차이상 버튼 활설화되게 할 수 있을까? -->
                <button type="button" id="updateYear">1년차 이상</button> 
                <button type="button" id="updateMonth">1년차 미만</button>
            </div>

            <script>
                $(function(){
                    $("#upateYear").click(function(){
                        if(confirm("연도별 연차등록을 하시겠습니까?")){
                            location.href = 'adminYear.le'
                        }
                        
                    });

                    $("#updateMoth").click(function(){
                        if(confirm("월별 연차등록을 하시겠습니까?")){
                            location.href = 'adminMonth.le'
                        }
                    })
                })
            </script>
            <br>
            <div class="list-area">
                <table class="annualTable">
                    <thead>
                        <tr style="font-weight: 600; background: rgb(234, 234, 234);">
                            <td width="100px;">사번</td>
                            <td width="120px;">소속</td>
                            <td width="120px;">직위</td>
                            <td width="120px;">이름</td>
                            <td width="100px;">발생</td>
                            <td width="100px;">사용</td>
                            <td width="100px;">잔여</td>
                            <td width="160px;">입사일</td>
                            <td width="90px;"></td>
                        </tr>
                    </thead>
                    
                    <tbody>
                        <c:forEach var="a" items="${list}">
                        <tr>
                            <td>${a.empNo}</td>
                            <td>${a.deptName}</td>
                            <td>${a.jobName}</td>
                            <td>${a.empName}</td>
                            <td><input type="text" name="create" value="${a.annualCount}" max="15" readonly></td>
                            <td><input type="text" name="create" value="${a.annualDate}" readonly></td>
                            <td><input type="text" name="use" value="" readonly></td>
                            <td>${a.annualDate}</td>
                            <td><button class="btn btn-success" id="" onclick="anDetail(${a.empNo});">연차</button></td>
                        </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>

            <script>
                function anDetail(no){
                    $.ajax({
                        url:"anDetail.le",
                        data:{empNo:no},
                        success:function(result){

                        }, 
                        error:function(){
                            console.log("연차부여모달 ajax통신 실패");
                        }
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
                                <li class="page-item"><a class="page-link" href="list.le?cpage=${ pi.currentPage-1 }"><</a></li>
                            </c:otherwise>
                        </c:choose>
                        
                        <c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
                            <li class="page-item"><a class="page-link" href="list.le?cpage=${ p }">${ p }</a></li>
                        </c:forEach>
                        
                
                                    <c:choose>
                            <c:when test="${ pi.currentPage eq pi.maxPage }">
                                <li class="page-item" disabled><a class="page-link" href="#">></a></li>
                            </c:when>
                            <c:otherwise>
                                <li class="page-item"><a class="page-link" href="list.le?cpage=${ pi.currentPage+1 }">></a></li>
                            </c:otherwise>
                        </c:choose>
                    </ul>
            </div>

        </div>

    </div>

    <!--
        매월1일마다 연차탭이 abled 될 수 있도록 할수없을까? 
    -->

    <!-- The Modal -->
    <div class="modal fade" id="annualModal">
        <div class="modal-dialog modal-dialog-centered"  style="width:400px;">
            <div class="modal-content">
        
                <!-- Modal Header -->
                <div class="modal-header">
                <h4 class="modal-title">연차등록</h4>
                <button type="button" class="close" data-dismiss="modal" onclick="annualClose();">&times;</button>
                </div>
                
                <!-- Modal body -->
                <div class="modal-body" style="width:90%; margin:auto;">
                    <span class="modalS">사원번호</span> 
                    &nbsp;&nbsp;&nbsp;&nbsp;<input type="text" name="" value="" style="width:200px;" readonly><br>
                    <span class="modalS">사원이름</span> <br>
                    <input type="text" name="stDate" value="&nbsp;&nbsp;2023.03.20" style="width:133px;" readonly>
                    <span class="modalS">사원이름</span> <br>
                    <input type="text" name="edDate" value="&nbsp;&nbsp;2023.03.21" style="width:133px;" readonly>
                    <br><br>
                    <span>신청사유</span>
                    <br>
                    <div class="textWrap">
                        <span class="textCount">0자</span><span class="textTotal">/200자</span>
                    </div>
                    <textarea name="" id="" readonly>글자수세볼꺼예요몇글자가200자인지궁금해서한번써봅니다얼마나들어가나보자글자수세볼꺼예요몇글자가200자인지궁금해서한번써봅니다얼마나들어가나보자글자수세볼꺼예요몇글자가200자인지궁금해서한번써봅니다얼마나들어가나보자글자수세볼꺼예요몇글자가200자인지궁금해서한번써봅니다얼마나들어가나보자글자수세볼꺼예요몇글자가200자인지궁금해서한번써봅니다얼마나들어가나보자글자수세볼꺼예요몇글자가200</textarea>
                    
                </div>
                
                <!-- Modal footer -->
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal" onclick="annualClose();">Close</button>
                </div>
            
            </div>
        </div>
    </div>

    <script>
        function annualClose(){
            $('#annualModal').modal('hide'); 
            $('#annualModal').hide();
            $('.jquery-modal').click();
    }

    </script>
    
</body>
</html>