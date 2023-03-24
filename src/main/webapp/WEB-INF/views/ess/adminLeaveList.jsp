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
    .leaveOuter{
        padding:50px;
        margin:auto;
    }
    /* content영역 */
    .leave-area{
        margin-top: 30px;
    }
    .select-area{
        margin-top: 30px;
    }
    .select-area input{
        width:150px;
        height:30px;
        border-radius: 5px;
        border:1px solid rgb(170, 170, 170);
        font-size: 14px;
    }
    .select-area button{
        width:60px;
        height:30px;
        border:none;
        border-radius: 5px;
        line-height: 5px;
        font-size: 14px;
        margin-bottom:3px;
    }
    .select-area select{
        width:150px;
        height:30px;
        border:1px solid rgb(170, 170, 170);
        border-radius: 5px;
        color:rgb(50,50,50);
        font-weight: 500;
        font-size: 14px;
    }
    .select-area>div{
        display: inline-block;
    }
    .leaveTable{
        width:100%;
        text-align: center;
        margin-top:30px;
        border-collapse: collapse;
        border-spacing: 0;
        font-size: 14px;
        color:rgb(51,51,51);
    }
    .leaveTable>tbody tr:hover{
        cursor: pointer;
        opacity: 0.7;
    }
    .leaveTable td{
        width:182px;
        height:30px;
        color:rgb(50,50,50);
        border-bottom: 1px solid rgb(234, 234, 234);
    }
    .list-area input{
        border:none;
        height:30px;
    }
    #pagingArea{
    	width:fit-content;
    	margin:auto;
    }
</style>
</head>
<body>

    <jsp:include page="../common/menubar.jsp" />

    <div class="leaveOuter">

        <h4><b>휴가관리</b></h4>
        
        <div class="leave-area">

            <div class="select-area">
                <select name="" id="">
                    <option value="">&nbsp;- 휴가선택 -</option>
                    <option value="">&nbsp;연차</option>
                    <option value="">&nbsp;보건</option>
                    <option value="">&nbsp;조의</option>
                    <option value="">&nbsp;결혼</option>
                    <option value="">&nbsp;산전후</option>
                    <option value="">&nbsp;리프레쉬휴가</option>
                </select>
                <select name="" id="">
                    <option value="">&nbsp;결재대기(1차)</option>
                    <option value="">&nbsp;결재대기(2차)</option>
                    <option value="">&nbsp;승인</option>
                    <option value="">&nbsp;반려</option>
                </select>
                <div style="float:right;">
                    <input type="text" name="" value="" placeholder="&nbsp;사원명/사원번호">
                    <button type="button" class="btn btn-success">검색</button>
                </div>
            </div>
            <br>
            <div class="list-area">
                <table class="leaveTable">
                    <thead>
                        <tr style="font-weight: 600; background: rgb(234, 234, 234);">
                            <td width="">문서번호</td>
                            <td width="">사번</td>
                            <td width="">소속</td>
                            <td width="">팀명</td>
                            <td width="">직위</td>
                            <td width=";">이름</td>
                            <td width="">조정일</td>
                            <td width="">제목</td>
                            <td width="">진행상황</td>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="l" items="${list}">
                            <tr onclick="detailFunction(${l.leaveNo});">
                                <td>${ l.leaveNo }</td>
                                <td>${ l.empNo }</td>
                                <td>${ l.deptName }</td>
                                <td>${l.teamName}</td>
                                <td>${ l.jobName }</td>
                                <td>${ l.empName }</td>
                                <td>${ l.enrollDate }</td>
                                <td>${ l.lcName }</td>
                                <td>${ l.leaveCheck }</td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>

            <script>
                function detailFunction(no){
                    location.href = 'adminDetail.le?leaveNo=' + no;
                }
            </script>
            
            <br><br>

            <div id="pagingArea">
                <ul class="pagination">
                
                    <c:choose>
                        <c:when test="${ pi.currentPage eq 1 }">
                            <li class="page-item" disabled><a class="page-link" href="#"><</a></li>
                        </c:when>
                        <c:otherwise>
                            <li class="page-item"><a class="page-link" href="adminList.le?cpage=${ pi.currentPage-1 }"><</a></li>
                        </c:otherwise>
                    </c:choose>
                    
                    <c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
                        <li class="page-item"><a class="page-link" href="adminList.le?cpage=${ p }">${ p }</a></li>
                    </c:forEach>
                    
              
                                  <c:choose>
                        <c:when test="${ pi.currentPage eq pi.maxPage }">
                            <li class="page-item" disabled><a class="page-link" href="#">></a></li>
                        </c:when>
                        <c:otherwise>
                            <li class="page-item"><a class="page-link" href="adminList.le?cpage=${ pi.currentPage+1 }">></a></li>
                        </c:otherwise>
                    </c:choose>
                </ul>
            </div>

        </div>

    </div>
</body>
</html>

