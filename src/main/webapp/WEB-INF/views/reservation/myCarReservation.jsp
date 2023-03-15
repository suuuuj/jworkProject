<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<style>
     #pagingArea{width:fit-content;margin:auto;}
     div{box-sizing: border-box;}
	

</style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
    <jsp:include page="../common/menubar.jsp"/>
    <div class="outer" style="width:940px; margin:20px;">
        <h2>나의 차량 예약내역</h2>
        <hr><br>
        <div>
        <div align="right" style="width:900px;">
            <input type="date">- <input type="date">
        </div>
            <div id="" style="width:900px; margin:20px;">
                <table class="table table-hover">
                    <thead>
                        <tr>
                            <th>신청차량명</th>
                            <th>신청일시</th>
                            <th>신청날짜</th>
                            <th>신청사유</th>
                            <th>신청상태</th>
                        </tr>
                   </thead>
                   <tbody>
                   		<c:forEach items="${list}" var="c">
	                        <tr>
	                            <td>${c.carName }</td>
	                            <td>${c.requestDate}</td>
	                            <td>${c.resDate} &nbsp;${c.startTime }~${c.endTime}</td>
	                            <td>${c.cause}</td>
	                            <td>
	                            	<c:choose>
		                            	<c:when test="${c.apStatus eq 1}">
		                            		 <button type="button" class="btn btn-sm btn-secondary" disabled>승인대기</button>
		                            	</c:when>
		                            	<c:when test="${c.apStatus eq 2}">
		                                	<button type="button" class="btn btn-sm btn-primary" disabled>승인완료</button>
		                                </c:when>
		                                <c:otherwise>
		                                	 <button type="button" class="btn btn-sm btn-warning" disabled>반려</button>
		                                </c:otherwise>
	                            	</c:choose>
	                            </td>
	                        </tr>
                        </c:forEach>
                   </tbody>

                </table>

            </div>
        </div>
        <br>
        <div id="pagingArea" style="width:940px; margin:20px; margin-left: 400px;">
             <ul class="pagination">
             	<c:choose>
              	<c:when test="${pi.currentPage eq  1}">
                  	<li class="page-item disabled"><a class="page-link" href="#"><</a></li>
                  </c:when>
                  <c:otherwise>
                   <li class="page-item"><a class="page-link" href="list.carMe?cpage=${pi.currentPage -1 }"><</a></li>
               </c:otherwise>
           </c:choose>
           <c:forEach var="p"  begin="${pi.startPage}" end="${pi.endPage}">
                  <li class="page-item"><a class="page-link" href="list.carMe?cpage=${p }">${p }</a></li>
            </c:forEach>
             <c:choose>
              	<c:when test="${pi.currentPage eq pi.maxPage}">
               		<li class="page-item disabled"><a class="page-link" href="#">></a></li>
           	 	</c:when>
           	 	<c:otherwise>
           	 		<li class="page-item"><a class="page-link" href="list.carMe?cpage=${pi.currentPage + 1 }">></a></li>
        		</c:otherwise>
          	</c:choose>
             </ul>
        </div>
    </div>
    <!-- 상세보기 모달 -->
    <div class="modal" id="detail-view">
        <div class="modal-dialog">
        <div class="modal-content">
    
            <!-- Modal Header -->
            <div class="modal-header">
            <h4 class="modal-title">예약내역 상세조회</h4>
            <button type="button" class="close" data-dismiss="modal">&times;</button>
            </div>
    
            <!-- Modal body -->
            <div class="modal-body">
                <table>
                    <tr>
                        <th>신청일시</th>
                        <td>2022.02.02 10:10:00</td>
                    </tr>
                    <tr>
                        <th>담당자</th>
                        <td>총무부사번(인사부)</td>
                    </tr>
                    <tr>
                        <th>신청결과</th>
                        <td>
                            <button type="button" class="btn btn-sm btn-primary">승인완료</button>
                        </td>
                    </tr>
                    <tr>
                        <th>사유</th>
                        <td>
                            <textarea name="" id="" cols="30" rows="10">
                                사유~~
                            </textarea>
                        </td>
                    </tr>
                </table>
            </div>
    
            <!-- Modal footer -->
            <div class="modal-footer">
            <button type="button" class="btn btn-primary btn-sm" data-dismiss="modal">확인</button>
            </div>
    
        </div>
        </div>
    </div>
    
</body>
</html>