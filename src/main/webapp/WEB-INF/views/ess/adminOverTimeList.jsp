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
    .overtimeOuter{
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
    .overTable{
        width:100%;
        text-align: center;
        margin-top:30px;
        border-collapse: collapse;
        border-spacing: 0;
        font-size: 14px;
        color:rgb(51,51,51);
    }
    .overTable td{ 
        width:182px;
        height:30px;
        color:rgb(50,50,50);
        border-bottom: 1px solid rgb(234, 234, 234);
    }
    .overTable>tbody tr:hover{
        opacity: 0.7;
        cursor: pointer;
    }
    .paging-area button{
        width:30px;
        height:30px;
        border:none;
        border-radius: 5px;
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
    }
    .modalS{
        display: inline-block;
        margin-bottom: 10px;
    }
    .modal-body textarea{
        resize: none;
        width:90%;
        height:260px;
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
    #pagingArea{
    	width:fit-content;
    	margin:auto;
    }
</style>
</head>
<body>
	<jsp:include page="../common/menubar.jsp"/>
    <div class="overtimeOuter">
        
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

            <div class="overList">
                <table class="overTable">
                    <thead>
                        <tr style="font-weight: 600; background: rgb(234, 234, 234);">
                            <td width="40px">문서번호</td>
                            <td width="100px">사번</td>
                            <td width="100px">소속</td>
                            <td width="110px">팀명</td>
                            <td width="100px">직위</td>
                            <td width="100px">이름</td>
                            <td width="120px">조정일</td>
                            <td width="120px">제목</td>
                            <td width="120px">진행상황</td>
                        </tr>
                    </thead>
                    <tbody>
                    	<c:forEach var="o" items="${ list }">
	                        <tr onclick="detailFunction(${o.otNo});">
	                            <td>${ o.otNo }</td>
	                            <td>${ o.empNo }</td>
	                            <td>${ o.deptName }</td>
                                <td>${ o.teamName }</td>
	                            <td>${ o.jobName }</td>
	                            <td>${ o.empName }</td>
	                            <td>${ o.enrollDate }</td>
	                            <td>${ o.otCategory }</td>
	                            <td>${ o.otCheck }</td>
	                        </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>

            <script>
                function detailFunction(no){
                    location.href = 'adDetail.ot?otNo=' + no;
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

    
</body>
</html>