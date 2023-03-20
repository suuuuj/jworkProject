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
    .businessOuter{
        padding:50px;
        margin:auto;
    }
    /* content영역 */
    .overtimeList{
        margin-top: 30px;
    }
    .selectBox{
        color:rgba(50, 50, 50);
        font-size: 15px;
        font-weight: 600;
    }
    .selectBox select{
        width:150px;
        height:30px;
        border:1px solid rgb(170, 170, 170);
        border-radius: 5px;
        color:rgb(50,50,50);
        font-weight: 500;
        font-size: 14px;
    }
    .businessTable{
        width:100%;
        text-align: center;
        margin-top:30px;
        border-collapse: collapse;
        border-spacing: 0;
        font-size: 14px;
        color:rgb(51,51,51);
    }
    .businessTable td{
        width:182px;
        height:30px;
        color:rgb(50,50,50);
        border-bottom: 1px solid rgb(234, 234, 234);
    }
    .businessTable>tbody tr:hover{
        cursor: pointer;
        opacity: 0.7;
    }
    #pagingArea{
    	width:fit-content;
    	margin:auto;
    }
</style>
</head>
<body>

	<jsp:include page="../common/menubar.jsp"/>
    <div class="businessOuter">
        
        <h4><b>신청</b></h4>

        <div class="overtimeList">

            <div class="selectBox">
                <select name="" id="">
                    <option value="">&nbsp;- 진행상황 -</option>
                    <option value="">&nbsp;결재대기(1차)</option>
                    <option value="">&nbsp;결재대기(2차)</option>
                    <option value="">&nbsp;승인</option>
                    <option value="">&nbsp;반려</option>
                </select> 
            </div>

            <div class="businessList">
                <table class="businessTable">
                    <thead>
                        <tr style="font-weight: 600; background: rgb(234, 234, 234);">
                            <td width="60px;">문서번호</td>
                            <td width="120px;">사번</td>
                            <td width="120px;">소속</td>
                            <td width="120px;">직위</td>
                            <td width="120px;">이름</td>
                            <td width="120px;">등록일</td>
                            <td width="120px;">제목</td>
                            <td width="120px;">진행상황</td>
                        </tr>
                    </thead>
                    <tbody>
                    	<c:forEach var="b" items="${ list }">
	                        <tr onclick="btDetail(${b.btNo});">
	                            <td>${ b.btNo }</td>
	                            <td>${ b.empNo }</td>
	                            <td>${ b.deptName }</td>
	                            <td>${ b.jobName }</td>
	                            <td>${ b.empName }</td>
	                            <td>${ b.enrollDate }</td>
	                            <td>출장신청</td>
	                            <td>${ b.btCheck }</td>
	                        </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>

            <script>
                function btDetail(btNo){
                    console.log(btNo);
                    location.href = 'adDetail.bt?btNo=' + btNo;
                }
            </script>


        </div>
        <br><br>
            <div id="pagingArea">
	                <ul class="pagination">
	                
	                	<c:choose>
	                		<c:when test="${ pi.currentPage eq 1 }">
	                    		<li class="page-item" disabled><a class="page-link" href="#"><</a></li>
	                    	</c:when>
	                    	<c:otherwise>
	                    		<li class="page-item"><a class="page-link" href="admin.bt?cpage=${ pi.currentPage-1 }"><</a></li>
	                    	</c:otherwise>
	                    </c:choose>
	                    
	                    <c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
		                    <li class="page-item"><a class="page-link" href="admin.bt?cpage=${ p }">${ p }</a></li>
	                    </c:forEach>
	                    
	              
	            				      <c:choose>
		                    <c:when test="${ pi.currentPage eq pi.maxPage }">
		                    	<li class="page-item" disabled><a class="page-link" href="#">></a></li>
		                    </c:when>
		                    <c:otherwise>
		                    	<li class="page-item"><a class="page-link" href="admin.bt?cpage=${ pi.currentPage+1 }">></a></li>
		                    </c:otherwise>
	                    </c:choose>
	                </ul>
            	</div>
        





















    </div>
</body>
</html>
