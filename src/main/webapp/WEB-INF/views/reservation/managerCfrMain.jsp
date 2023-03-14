<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<style>
     #pagingArea{width:fit-content;margin:auto; margin-right: 520px; }
     div{box-sizing: border-box;}
     #img-area{
      
        margin: 0 auto;
        overflow: hidden;
        padding-top:10px;
          width:960px;
    }
    #img-area>article{
        float: left;
        margin-left: 10px;
        margin-bottom: 10px;
      

    }
    .detail-img{display: inline-block;}
    .outer{
        width: 960px;
        margin:20px;
    }
    figure {
  text-align: center;
    }
    .subImg{
        top:5px;
        right: 5px;
      
    }
</style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
      <jsp:include page="../common/menubar.jsp"/>
    <div class="outer" style="width:940px;">
        <h2>회의실 관리</h2>
        <hr><br>
        <div>
            <div class="btn-area" style="width:960px;">
                <a class="btn btn-secondary" href="enrollForm.cfr">+회의실 등록</a>
                <button type="button" class="btn btn-secondary">회의실 예약 내역</button>
            </div>
            <br><br>
            <div id="img-area" style="position: relative;">
            	
				<c:forEach var="c" items="${list}">                
	                <div class="detail-img" style="position: relative;" <%-- onclick="cfrDetail(${c.cfrName});" --%>>
	                    <article>
	                        <figure>
	                            <img src="${c.firstImg}" width="250px" height="150px">
	                            <figcaption>${c.cfrName}</figcaption>
	                        </figure>
	                    </article>
	                    <div style="position: absolute;" class="subImg">
	                        <a class="btn" onclick="deleteCfr();">
	                        	<img src="resources/images/reservation/trash.png" width="23px;" height="23px;">
	                        </a>
	                        <form action="delete.cfr" method="post" id="deleteForm">
	                        	<input type="hidden" name="cfrName" value="${c.cfrName}">
	                        </form>
	                    </div>
	                </div>
	             </c:forEach>         
            </div>
            <script>
            	function deleteCfr(){
            		
            		$("#deleteForm").submit();
            	}
            </script>
        <div id="pagingArea">
             <ul class="pagination">
             	<c:choose>
              	<c:when test="${pi.currentPage eq  1}">
                  	<li class="page-item disabled"><a class="page-link" href="#"><</a></li>
                  </c:when>
                  <c:otherwise>
                   <li class="page-item"><a class="page-link" href="list.cfr?cpage=${pi.currentPage -1 }"><</a></li>
               </c:otherwise>
           </c:choose>
           <c:forEach var="p"  begin="${pi.startPage }" end="${pi.endPage }">
                  <li class="page-item"><a class="page-link" href="list.cfr?cpage=${p }">${p }</a></li>

                	</c:forEach>
                	<c:choose>
                		<c:when test="${pi.currentPage eq pi.maxPage}">
                 		<li class="page-item disabled"><a class="page-link" href="#">></a></li>
           	 	</c:when>
           	 	<c:otherwise>
           	 		<li class="page-item"><a class="page-link" href="list.cfr?cpage=${pi.currentPage + 1 }">></a></li>
        				</c:otherwise>
          		</c:choose>
             </ul>
         </div>
        </div>
        <br>
        <script>
        /* 	function cfrDetail(cfrName){
        		
        			  		
        		
        	}
        
			$(function(){
				
				if($(".detail-img figcaption").val() == '${CfRoom.cfrName}'){
					
				}
				
			}) */
			
        </script>
        <!-- 회의실 상세보기 모달 -->
        <div class="modal" id="">
            <div class="modal-dialog">
            <div class="modal-content">
        
                <!-- Modal Header -->
                <div class="modal-header">
                <h4 class="modal-title">회의실 조회</h4>
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                </div>
        
                <!-- Modal body -->
                <div class="modal-body">
                    <form action="">
                        <table id="cfRoom-enrollForm">
                            <tr >
                                <th >회의실 이름</th>
                                <td><input type="text" name="" value=""></td>
                            </tr>
                            <tr>
                                <th>회의실 대표 이미지</th>
                                <td>
                                    <img src="" width="150px" height="100px" onclick="$('#firstImg').click();">
                                    <input type="file" id="firstImg" style="display:none;">
                                </td>
                            </tr>
                            <tr>
                                <th>회의실 상세 이미지</th>
                                <td>
                                    <img src="" width="150px" height="100px">
                                    <img src="" width="150px" height="100px">
                                    <img src="" width="150px" height="100px">
        
                                </td>
                            </tr>
                            <tr>
                                <th>수용인원</th>
                                <td><input type="number" name="" value=""></td>
                            </tr>
                            <tr>
                                <th>회의장비</th>
                                <td>
                                    TV&nbsp;<input type="checkbox">&nbsp;
                                    빔프로젝터&nbsp;<input type="checkbox">&nbsp;
                                    에어컨&nbsp;<input type="checkbox">&nbsp;
                                    커피포트&nbsp;<input type="checkbox">&nbsp;
                                    선풍기&nbsp;<input type="checkbox">&nbsp;
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2"><button type="button" class="btn btn-sm btn-secondary">+장비추가</button></td>
                            </tr>
        
        
                        </table>
                    </form>
                </div>
        
                <!-- Modal footer -->
                <div class="modal-footer">
                    <button type="submit" class="btn btn-sm btn-primary" >수정하기</button>
                    <button type="button" class="btn btn-sm btn-light" data-dismiss="modal" onclick="history.back();">이전으로</button>
                </div>
        
            </div>
            </div>
        </div>
        

    </div>
</body>
</html>