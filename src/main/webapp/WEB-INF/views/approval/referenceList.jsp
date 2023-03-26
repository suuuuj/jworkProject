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
        width: 540px;
    }
    .inputSearch{
        width:170px;
        border-radius: 3px;
    }
    #appListTB{
        font-size: small;
        text-align: center;
            
    }
    
    #appListTB td{
    	 vertical-align : middle;   
    }
    
   .btnArea button, .searchArea button{
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
        <div>
            <h4 style="display: inline-block;" style="float: left;"><b>수신/참조 문서함</b></h4>
            <div align="right">
                <button type="button" class="btn btn-outline-success" onclick="location.href='enrollForm.app'">결재 문서 작성</button>
            </div>
        </div>
        <br>
        <div class="btnNSerch">
            <table>
                <tr>
                    <td class="btnArea"></td>
                    <td class="searchArea">
                        <select class="searchBox">
                            <option selected>결재종류</option>
                            <option value="">제목</option>
                            <option value="">작성자</option>
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
				<col width="10%">
                <col width="11%">
                <col width="11%">
                <col width="*">
                <col width="11%">
                <col width="5%">
                <col width="11%">
            </colgroup>
            <thead >
                <tr>
					<th scope="col">번호</th>
                    <th scope="col">기안일</th>
                    <th scope="col">결재종류</th>
                    <th scope="col">제목</th>
                    <th scope="col">작성자</th>
                    <th scope="col">파일</th>
                    <th scope="col">결재상태</th>
                </tr>
            </thead>
            <tbody id="defaultAllTB">
           
           
            	<c:forEach var="a" items="${ list }">
	                <tr>
						<td class="ano">${ a.appNo }</td>
	                    <td>${ a.createDate }</td>
	                    <td>${ a.docType }</td>
	                    <td>${ a.docTitle }</td>
	                    <td>${ a.empName }</td>
	                    <td>
	                    	<c:if test="${ not empty a.docOriginName }">
            					<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-folder2-open" viewBox="0 0 16 16">
								  <path d="M1 3.5A1.5 1.5 0 0 1 2.5 2h2.764c.958 0 1.76.56 2.311 1.184C7.985 3.648 8.48 4 9 4h4.5A1.5 1.5 0 0 1 15 5.5v.64c.57.265.94.876.856 1.546l-.64 5.124A2.5 2.5 0 0 1 12.733 15H3.266a2.5 2.5 0 0 1-2.481-2.19l-.64-5.124A1.5 1.5 0 0 1 1 6.14V3.5zM2 6h12v-.5a.5.5 0 0 0-.5-.5H9c-.964 0-1.71-.629-2.174-1.154C6.374 3.334 5.82 3 5.264 3H2.5a.5.5 0 0 0-.5.5V6zm-.367 1a.5.5 0 0 0-.496.562l.64 5.124A1.5 1.5 0 0 0 3.266 14h9.468a1.5 1.5 0 0 0 1.489-1.314l.64-5.124A.5.5 0 0 0 14.367 7H1.633z"/>
								</svg>
            				</c:if>
	                    </td>
	                    <td>${ a.appStatus }</td>
	                 </tr>
                 </c:forEach>
            </tbody>
        </table>
        
        
        <script>
        	$(function(){
        		$(document).on("click", "#defaultAllTB>tr",function(){
        			location.href='refDetail.app?no='+$(this).children(".ano").text();
        		})
        	})
        </script>
        
        
        
        <br>
        <div id="pagingArea">
        <c:if test="${ not empty list}">
            <ul class="my pagination justify-content-end pagination-sm">
            
            <c:choose>
            	<c:when test="${ pi.currentPage eq 1 }">
                	<li class="page-item disabled" ><a class="page-link" href="#" style="color:rgb(196, 197, 197)">Previous</a></li>
          		</c:when>
            	<c:otherwise>
             	   <li class="page-item"><a class="page-link" href="reflist.app?cpage=${ pi.currentPage-1 }">Previous</a></li>
                </c:otherwise>
            </c:choose>
            
           	<c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
        		<li class="page-item"><a class="page-link" href="reflist.app?cpage=${ p }">${ p }</a></li>
        	</c:forEach>
            
            <c:choose>
         		<c:when test="${ pi.currentPage eq pi.maxPage }">
          			<li class="page-item disabled"><a class="page-link " href="#" style="color:rgb(196, 197, 197)">Next</a></li>
          		</c:when>
          		<c:otherwise>
          			<li class="page-item"><a class="page-link" href="reflist.app?cpage=${ pi.currentPage+1 }">Next</a></li>
          		</c:otherwise>
        	</c:choose>
              </ul>
        </c:if>
        </div>

    </div> <!-- end of outer-->
</div>
</div>
</div>
    

</body>
</html>