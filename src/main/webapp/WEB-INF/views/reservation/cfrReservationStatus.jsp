<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>

<style>
   
    .outer{
        width: 960px;
        margin:20px;
    }
    #pagingArea{width:fit-content;margin:auto; margin-right: 520px; }

</style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
    <jsp:include page="../common/menubar.jsp"/>
    <div class="outer"  style="width:940px;">
        <h2>회의실 예약 이력 조회</h2>
        <hr>
        <div>
            <div style="float: left; width:8">
                <button type="button" class="btn btn-sm btn-secondary" data-toggle="modal" data-target="#cfrInfo" onclick="selectList();">회의실 정보</button>
                <button type="button" class="btn btn-sm btn-secondary" data-toggle="modal" data-target="#reservationForm">예약하기</button>&nbsp;
                <button type="button" class="btn btn-sm btn-light"><</button>
                <button type="button" class="btn btn-sm btn-light">></button>
            </div>
            <div style="float: left; font-weight: 800; font-size: 25px; margin-left: 170px;"" >
                2023년 02월 17일
            </div>
            <div style="float: left; margin-left: 170px;" >
                <button type="button" class="btn btn-light">today</button>
                <button type="button"  class="btn btn-light">week</button>
            </div>
            <br clear="both">
            <br>
            <div align="center">
                <table class="table table-bordered" style="width:900px; height:600px; text-align: center;" >
                    <tr>
                        <td></td>
                        <td>1회의실</td>
                        <td>2회의실</td>
                        <td>3회의실</td>
                        <td>4회의실</td>
                        <td>5회의실</td>
                        <td>6회의실</td>
                    </tr>
                    <tr>
                        <td>오전9시</td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                    </tr>
                    <tr>
                        <td>오전10시</td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                    </tr>
                    <tr>
                        <td>오전11시</td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                    </tr>
                    <tr>
                        <td>오후12시</td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                    </tr>
                    <tr>
                        <td>오후1시</td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                    </tr>
                    <tr>
                        <td>오후2시</td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                    </tr>
                    <tr>
                        <td>오후3시</td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                    </tr>
                    <tr>
                        <td>오후4시</td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                    </tr>
                    <tr>
                        <td>오후5시</td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                    </tr>
                    <tr>
                        <td>오후6시</td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                    </tr>

                </table>
            </div>
        </div>
    </div>
     <script>
        function selectList(){
        	
        	$.ajax({
        		url:"alist.cfr",
            	success:function(list){
            		console.log(list);
            		let value="";
            		for(var i=0; i<list.length; i++){
            			
            			value+="<button type='button' class='btn btn-sm btn-light'value='"
            					+list[i].cfrName+"' onclick='detailCfr($(this).val());'>" +list[i].cfrName
            					+"</button>";
            			
            		}
            		
            		$("#btn-area").html(value);
            		
            		
            		
            	},error:function(){
            		console.log("ajax통신실패");
            	}
            		
        	})
        	
        	
        }
        
        function detailCfr(cfrName){
        	
        	$.ajax({
        		url:"adetail.cfr"
        	   ,data:{cfrName:cfrName}
        	   ,success:function(c){
        			$("#inputCfrName").text(c.cfrName);
        			$("#firstImg").attr("src",c.firstImg);
        			$("#capacity").text(c.capacity);
        			var equipment = c.equipment.split(","); 
        			$("#equipment").text(equipment);
        	   },error:function(){
        		   
        		   console.log("ajax통신에러");
        	   }
        	   
        	});
        	
        	
        }
         
     </script>
    <!--회의실 정보 모달 -->
    <div class="modal" id="cfrInfo">
        <div class="modal-dialog">
        <div class="modal-content">
    
            <!-- Modal Header -->
            <div class="modal-header">
            <h4 class="modal-title">회의실 정보</h4>
            <button type="button" class="close" data-dismiss="modal">&times;</button>
            </div>
    
            <!-- Modal body -->
            <div class="modal-body">
                <div id="btn-area">
                	
                </div>
                <br>
                <div style="width:800px">
                    <table>
                        <tr>
                            <th>회의실명</th>
                            <td id="inputCfrName"></td>
                        </tr>
                        <tr>
                            <th>회의실 이미지</th>
                            <td >
                                <div style="width: 320px;">
                                    <img src="" width="150px" height="100px" id="firstImg">
                                  
                                </div>
                            </td>
                            
                        </tr>
                        <tr>
                            <th>수용인원</th>
                            <td id="capacity"></td>
                        </tr>
                        <tr>
                            <th>회의장비</th>
                            <td id="equipment"></td>
                        </tr>
                    </table>

                </div>
            </div>
    
        </div>
        </div>
    </div>
    
    <!--회의실 예약 모달 -->
    <div class="modal" id="reservationForm">
        <div class="modal-dialog">
        <div class="modal-content">
    
            <!-- Modal Header -->
            <div class="modal-header">
            <h4 class="modal-title">회의실 예약</h4>
            <button type="button" class="close" data-dismiss="modal">&times;</button>
            </div>
    
            <!-- Modal body -->
            <div class="modal-body">
               <form action="reserv.cfr" method="post">
                <input type="hidden" name="reservation" value="${loginUser.empNo}">
                    <table>
                        <tr>
                            <th>회의실</th>
                            <td>
                           		<select name="cfrName" id="cfrName" required> 
                           		<c:forEach items="${list}" var="c">
                                 <option>${c.cfrName}</option>
                                </c:forEach>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <th>예약자</th>
                            <td>${loginUser.empName}${loginUser.empNo}</td>
                        </tr>
                        <tr>
                            <th>날짜</th>
                            <td><input type="date" name="useDate" id="useDate" required></td>
                        </tr>
                        <tr>
                            <th>시간</th>
                            <td><input type="time" name="startTime" required>-<input type="time" name="endTime" required></td>
                        </tr>
                        <tr>
                            <th>인원</th>
                            <td><input type="number" name="capacity" required></td>
                        </tr>
                        <tr>
                            <th>회의제목</th>
                            <td><input type="text" name="cfTitle" required></td>
                        </tr>
                    </table>
                    <button type="submit" class="btn btn-primary btn-sm">예약하기</button>
               </form>
            </div>
    
        </div>
        </div>
    </div>
    <script>
	  /*  $(function(){
		   $("#useDate").datepicker({
		    	  dateFormat: 'yy-mm-dd',
		    	  minDate: 0
		    	});
		   
	   }); */
    </script>
  
</body>
</html>