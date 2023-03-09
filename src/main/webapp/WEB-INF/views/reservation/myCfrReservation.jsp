<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<style>
     #pagingArea{width:fit-content;margin:auto;}
     div{box-sizing: border-box;}
     .outer{
        width: 960px;
        margin:20px;
    }
</style>

<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
     <jsp:include page="../common/menubar.jsp"/>
    <div class="outer">
        <h2>내 회의실 예약내역</h2>
        <hr><br>
        <div>
            <div>
                <table id="reservation-area" class="table table-hover">
                    <thead>
                        <tr>
                            <th>No.</th>
                            <th>회의실명</th>
                            <th>회의명</th>
                            <th>회의일시</th>
                            <th>상태</th>
                        </tr>
                    </thead>
                    <tbody>
                    	<c:forEach var="c" items="${list}">
	                        <tr>    
	                            <td>1</td>
	                            <td>${c.cfrName}</td>
	                            <td>${c.cfTitle}</td>
	                            <td>${useDate}${c.startTime}~${c.endTime}</td>
	                           
                            <td>
                            <c:choose>
	                            <c:when test="">
	                                <button type="button" class="btn btn-sm btn-primary">일정변경</button>
	                                <button type="button" class="btn btn-sm btn-warning">예약취소</button>
	                            </c:when>
	                            <c:when test="">
	                                <button type="button" class="btn btn-sm btn-secondary">이용완료</button>
	                            </c:when>
	                            <c:otherwise>
	                                <button type="button" class="btn btn-sm btn-danger" >취소완료</button>
	                            </c:otherwise>
                             </c:choose>
	                         </td>
		                            
	                           
	                        </tr>
                        </c:forEach>
                    </tbody>

                </table>

            </div>
            
            <br><br>
            <div id="pagingArea">
                <ul class="pagination">
                	<c:choose>
	                	<c:when test="${pi.currentPage eq  1}">
	                    	<li class="page-item disabled"><a class="page-link" href="#"><</a></li>
	                    </c:when>
	                    <c:otherwise>
		                    <li class="page-item"><a class="page-link" href="list.cfrMe=${pi.currentPage -1 }"><</a></li>
		                </c:otherwise>
		            </c:choose>
		            <c:forEach var="p"  begin="${pi.startPage }" end="${pi.endPage }">
	                    <li class="page-item"><a class="page-link" href="list.cfrMe?cpage=${p }">${p }</a></li>
	 
                   	</c:forEach>
                   	<c:choose>
                   		<c:when test="${pi.currentPage eq pi.maxPage}">
	                   		<li class="page-item disabled"><a class="page-link" href="#">></a></li>
	             	 	</c:when>
	             	 	<c:otherwise>
	             	 		<li class="page-item"><a class="page-link" href="list.cfrMe?cpage=${pi.currentPage + 1 }">></a></li>
           				</c:otherwise>
             		</c:choose>
                </ul>
            </div>

        </div>
        <br>
        


    </div>
</body>
</html>