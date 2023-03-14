<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>

<style>
     div{box-sizing: border-box;}
     figure {
  text-align: center;
    }
   #day-select a, #reservation-table a{
        text-decoration: none;
        color: black;
    }
    .outer{
        width: 960px;
    }
 

</style>
<meta charset="UTF-8">
<title>Insert title here</title>
	
</head>
<body>
   
    <jsp:include page="../common/menubar.jsp"/>
    <div style="width: 940px; margin:20px;">
        <h2>차량 예약 현황</h2>
        <hr><br>
        <div>
     
            <div id="day-select" align="center">
              
                <h4>
                     <a href=""><</a>
                    2022.02.01 
                    <!-- <img src="resources/images/reservation/calendar.jpeg" width="30px" height="30px" onclick="$('#datepicker').click();"> -->
                  	<input type="text" id="datepicker" style="display:none;">
                  	   <a href="">></a>
          			
                 </h4>
         </div> 
            </div>
          
			  <script>
			   $(function() {
			       //input을 datepicker로 선언
			       $("#datepicker").datepicker({
			          dateFormat: 'yy-mm-dd' //달력 날짜 형태
			           ,showOtherMonths: true //빈 공간에 현재월의 앞뒤월의 날짜를 표시
			           ,showMonthAfterYear:true // 월- 년 순서가아닌 년도 - 월 순서
			           ,changeYear: true //option값 년 선택 가능
			           ,changeMonth: true //option값  월 선택 가능                
			           ,showOn: "both" //button:버튼을 표시하고,버튼을 눌러야만 달력 표시 ^ both:버튼을 표시하고,버튼을 누르거나 input을 클릭하면 달력 표시  
			           ,buttonImage: "http://jqueryui.com/resources/demos/datepicker/images/calendar.gif" //버튼 이미지 경로
			           ,buttonImageOnly: true //버튼 이미지만 깔끔하게 보이게함
			           ,buttonText: "선택" //버튼 호버 텍스트              
			           ,yearSuffix: "년" //달력의 년도 부분 뒤 텍스트
			           ,monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'] //달력의 월 부분 텍스트
			           ,monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'] //달력의 월 부분 Tooltip
			           ,dayNamesMin: ['일','월','화','수','목','금','토'] //달력의 요일 텍스트
			           ,dayNames: ['일요일','월요일','화요일','수요일','목요일','금요일','토요일'] //달력의 요일 Tooltip
			           ,minDate: "-5Y" //최소 선택일자(-1D:하루전, -1M:한달전, -1Y:일년전)
			           ,maxDate: "+5y" //최대 선택일자(+1D:하루후, -1M:한달후, -1Y:일년후)   
			       });                    
			       
			       //초기값을 오늘 날짜로 설정해줘야 합니다.
			      //$('#datepicker').datepicker('setDate', 'today'); //(-1D:하루전, -1M:한달전, -1Y:일년전), (+1D:하루후, -1M:한달후, -1Y:일년후)            
			   		
			       
				    // Cannot read property 'msie' of undefined 에러 나올때
				    jQuery.browser = {};
				    (function () {
				        jQuery.browser.msie = false;
				        jQuery.browser.version = 0;
				        if (navigator.userAgent.match(/MSIE ([0-9]+)\./)) {
				            jQuery.browser.msie = true;
				            jQuery.browser.version = RegExp.$1;
				        }
				    })();
				   
			   });
			</script>
            <br><br>
            <div id="tabe-area">
                <table class="table table-bordered" id="reservation-table">
                    <thead>
                        <tr>
                            <td></td>
                              <c:forEach var="c" items="${list}">
                              	<th>${c.carName }</th>
                          	  </c:forEach>
                            <td></td>    
                        </tr>
                       
                           <tr>
                           	   <td>
                           	   <ul class="pagination">
                           	   	<c:choose>
					              	<c:when test="${pi.currentPage eq  1}">
					                  	<li class="page-item disabled"><a class="page-link" href="#"><</a></li>
					                  </c:when>
					                  <c:otherwise>
					                   <li class="page-item"><a class="page-link" href="status.car?cpage=${pi.currentPage -1 }"><</a></li>
					               </c:otherwise>
				                 </c:choose>
				                 </ul>
                           	   </td>
                           	    <c:forEach var="c" items="${list}">
	                               <td>
	                                 <img src="${c.carImg}" width="280px" height="140px">
	                               </td>
	                           	</c:forEach>       
                              
                               	<td>
                               	  	<ul class="pagination">
                             		  <c:choose>
				                	<c:when test="${pi.currentPage eq pi.maxPage}">
				                 		<li class="page-item disabled"><a class="page-link" href="#">></a></li>
				           	 		</c:when>
				           	 		<c:otherwise>
				           	 		  <li class="page-item"><a class="page-link" href="status.car?cpage=${pi.currentPage + 1 }">></a></li>
				        			</c:otherwise>
			          			</c:choose>
			          			</ul>
          						</td>
          						
                            </tr>
					                     
                   </thead>
                   <tbody>
                       <tr>
                            <td>오전9시</td>
                            <td></td>
                            <td></td>
                            <td></td>
                       </tr>
                       <tr>
                            <td>오전10시</td>
                            <td></td>
                            <td></td>
                            <td></td>
                        </tr>
                        <tr>
                            <td>오전11시</td>
                            <td></td>
                            <td></td>
                            <td></td>
                        </tr>
                        <tr>
                            <td>오후12시</td>
                            <td></td>
                            <td></td>
                            <td></td>
                        </tr>
                        <tr>
                            <td>오후1시</td>
                            <td></td>
                            <td></td>
                            <td></td>
                        </tr>
                        <tr>
                            <td>오후2시</td>
                            <td></td>
                            <td></td>
                            <td></td>
                        </tr>
                        <tr>
                            <td>오후3시</td>
                            <td></td>
                            <td></td>
                            <td></td>
                        </tr>
                        <tr>
                            <td>오후4시</td>
                            <td></td>
                            <td></td>
                            <td></td>
                        </tr>
                        <tr>
                            <td>오후5시</td>
                            <td></td>
                            <td></td>
                            <td></td>
                        </tr>

                        <tr>
                            <td>오후6시</td>
                            <td></td>
                            <td></td>
                            <td></td>
                        </tr>
                        <tr>
                            <td>오후7시</td>
                            <td></td>
                            <td></td>
                            <td></td>
                        </tr>
                        <tr>
                            <td>오후8시</td>
                            <td></td>
                            <td></td>
                            <td></td>
                        </tr>
                        <tr>
                            <td>오후9시</td>
                            <td></td>
                            <td></td>
                            <td></td>
                        </tr>
                       

                   </tbody>

                </table>

            </div>
        </div>
        <br>
       

    </div>

    <!-- 상세보기 -->
    <script>
         <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#myModal">
         Open modal
         </button>

    </script>

    <!-- 차량 상세 조회 -->
    <div class="modal" id="carDetailView">
        <div class="modal-dialog">
        <div class="modal-content">
    
            <!-- Modal Header -->
            <div class="modal-header">
            <h4 class="modal-title">차량 상세 정보</h4>
            <button type="button" class="close" data-dismiss="modal">&times;</button>
            </div>
    
            <!-- Modal body -->
            <div class="modal-body">
                <table>
                    <tr>
                        <th>차량명</th>
                        <td></td>
                    </tr>
                    <tr>
                        <th>차량 대표 이미지 </th>
                        <td><img src="" alt=""></td>
                    </tr>
                    <tr>
                        <th>차량종류</th>
                        <td></td>
                    </tr>
                    <tr>
                        <th>기어형식</th>
                        <td></td>
                    </tr>
                    <tr>
                        <th>차량색상</th>
                        <td></td>
                    </tr>
                    <tr>
                        <th>제조사</th>
                        <td></td>
                    </tr>
                    <tr>
                        <th>연료형식</th>
                        <td></td>
                    </tr>
                    <tr>
                        <th>차량연식</th>
                        <td></td>
                    </tr>
                    <tr>
                        <th>비고</th>
                        <td></td>
                    </tr>
                    <tr>
                        <th>현재상태</th>
                        <td></td>
                    </tr>
           

                </table>
            </div>
    
            <!-- Modal footer -->
            <div class="modal-footer">
                <button type="button" class="btn btn-sm btn-primary" onclick="">예약하기</button>
                <button type="button" class="btn btn-sm btn-light" data-dismiss="modal">닫기</button>
            </div>
    
        </div>
        </div>
    </div>
    
    
  
</body>
</html>