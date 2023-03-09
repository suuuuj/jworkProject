<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    div{
        box-sizing: border-box;
    }
    .content{
        margin: auto; 
        padding:4%
    }
    .btnArea{
        width: 545px;
    }
    .inputSearch{
        width:170px;
        border-radius: 3px;
    }
    #appListTB{
        font-size: small;
        text-align: center;
    }
   .btnArea button, .searchArea button{
        font-size: 12px;
        height: 27px;
        margin-bottom: 6px;
    }
    .my.pagination.justify-content-end.pagination-sm>li>a{
        color: green;
   } 
</style>
</head>
<body>
 <jsp:include page="../common/menubar.jsp"/>
        <div>
            <h4 style="display: inline-block;" style="float: left;"><b>전체 문서 조회</b></h4>
            <div align="right">
                <button type="button" class="btn btn-outline-success" onclick="location.href='enrollForm.app'">내 결제 문서 작성</button>
            </div>
        </div>
        <br>
        <div class="btnNSerch">
            <table>
                <tr>
                    <td class="btnArea">
                        <button type="button" class="btn btn-success btn-sm mr-2">전체(<span class="num">20</span>)</button>
                        <button type="button" class="btn btn-secondary btn-sm mr-2">진행(<span class="num">5</span>)</button>
                        <button type="button" class="btn btn-secondary btn-sm mr-2">완료(<span class="num">5</span>)</button>
                        <button type="button" class="btn btn-secondary btn-sm mr-2">반려(<span class="num">2</span>)</button>
                    </td>
                    <td class="searchArea">
                        <select class="searchBox">
                            <option selected>결재종류</option>
                            <option value="">제목</option>
                        </select>
                        <input type="text" class="inputSearch">
                        <button type="button" class="btn btn-success btn-sm mr-2" onclick="">검색</button>
                    </td>
                </tr>
            </table>
        </div>
        <br>
        
        <table class="table table-hover" id="appListTB" >
            <colgroup>
                <col width="11%">
                <col width="11%">
                <col width="*">
                <col width="11%">
                <col width="11%">
                <col width="11%">
            </colgroup>
            <thead >
                <tr>
                    <th scope="col">기안일</th>
                    <th scope="col">결재종류</th>
                    <th scope="col">제목</th>
                    <th scope="col">작성자</th>
                    <th scope="col">첨부파일</th>
                    <th scope="col">결재상태</th>
                </tr>
            </thead>
            <tbody>
            	<c:forEach var="a" items="${ list }">
	                <tr>
	                    <td>${ a.createDate }</td>
	                    <td>${ a.docType }</td>
	                    <td>${ a.docTitle }</td>
	                    <td>${ a.empName }</td>
	                    <td>
	                    	<c:if test="${ not empty a.docOriginName }">
            					★
            				</c:if>
	                    </td>
	                    <td>${ a.appStatus }</td>
	                 </tr>
                 </c:forEach>
            </tbody>
        </table>
        <br>
        <div id="pagingArea">
            <ul class="my pagination justify-content-end pagination-sm">
            
            <c:choose>
            	<c:when test="${ pi.currentPage eq 1 }">
                	<li class="page-item"><a class="page-link" href="#">Previous</a></li>
          		</c:when>
            	<c:otherwise>
             	   <li class="page-item"><a class="page-link" href="list.ap?cpage=${ pi.currentPage-1 }">Previous</a></li>
                </c:otherwise>
            </c:choose>
            
           	<c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
        		<li class="page-item"><a class="page-link" href="list.ap?cpage=${ p }">${ p }</a></li>
        	</c:forEach>
            
            <c:choose>
         		<c:when test="${ pi.currentPage eq pi.maxPage }">
          			<li class="page-item disabled"><a class="page-link" href="#">Next</a></li>
          		</c:when>
          		<c:otherwise>
          			<li class="page-item"><a class="page-link" href="list.ap?cpage=${ pi.currentPage+1 }">Next</a></li>
          		</c:otherwise>
        	</c:choose>
              </ul>
        </div>

    </div> <!-- end of outer-->
</div>
</div>
</div>
    
</body>
</html>