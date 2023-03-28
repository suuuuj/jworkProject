<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<style>
     #pagingArea{width:fit-content;margin:auto;}
     div{box-sizing: border-box;}
    #carReservForm th{
        height: 30px;
    }
    .outer{
        width: 960px;
       
    }
    #carReservForm th, td ,#car-information tr, td{
        text-align: center;
        padding: 20px;
    }
  
</style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

<body>
     <jsp:include page="../common/menubar.jsp"/>
    <div class="outer" style="width:900px; margin:20px;">
        <h3>차량 예약</h3>
        <hr>
        <div style="width:900px;">
            <h5>차량정보</h5>
            <hr>
            <table id="car-information" style="width:900px;">
                <tr>
                    <th>차량명</th>
                    <td id="cName">${c.carName}</td>
                    <th>제조사</th>
                    <td>${c.maker }</td>
                </tr>
                <tr>
                    <th>차량 대표 이미지</th>&nbsp;
                    <td>
                        <img src="${c.carImg }" width="200px" height="140px"> 
                    </td>
                    <th>연료형식</th>
                    <td>${c.fuelType}</td>
                </tr>
                <tr>
                    <th>차량종류</th>
                    <td>${c.carType }</td>
                    <th>차량연식</th>
                    <td>${c.modelYear }</td>
                </tr>
                <tr>
                    <th>기어형식</th>
                    <td>${c.gearType }</td>
                    <th>비고</th>
                    <td>${c.etc }</td>
                </tr>
                <tr>
                    <th>차량색상</th>
                    <td>${c.color }</td>
                    <th>현재상태</th>
                    <td >
                  		<span id="status"></span>
                    </td>
                </tr>

            </table>
            <script>
	        	 $(function(){
	        		if('${c.status}' == 'Y'){
						$("#status").text("정상").css("color","blue");
					}else{
						$("#status").text("고장").css("color","red");
					}
	        	}); 
            </script>
            <hr>
            <h5>대여사원 정보</h5>
            <hr>
            <div style="float: left;line-height:10;">
                <img src="<c:out value='${loginUser.profileUrl}' default='resources/images/common/profileDefault3.png'/>" width="100px" height="100px" style="border-radius: 50%;"> 
            </div>
            
            <form action="reserv.car" method="post">
            	<div style="float: left; ">    
	                <table id="carReservForm" style="width: 790px;">
	                    <tr>
	                        <th>사원명</th>
	                        <td>
	                        ${loginUser.empName}
	                        <input type="hidden" value="${loginUser.empNo}" name="reservation">
	                        <input type="hidden" value="${c.carName }" name="carName">
	                        </td>
	                        
	                        <th>신청날짜</th>
	                        <td>
	                          <div class="col-8">
	                        	<input type="date" class="form-control" name="resDate" id="resDate"  onchange="selectDay($(this).val());" required>
	                    	  </div>
	                    	 </td>
	                    </tr>
	                    <tr>
	                        <th>사번</th>
	                        <td>${loginUser.empNo}</td>
	                        <th>신청시간</th>
	                        <td>
	                         <div class="col-6">
	                        <select name="startTime" onchange="endTimeShow($(this).val());" id="startTime" disabled required>
	                          <option>- 시작시간 -</option>
                                <option value="09:00">09:00</option>
                                <option value="10:00">10:00</option>
                                <option value="11:00">11:00</option>
                                <option value="12:00">12:00</option>
                                <option value="13:00">13:00</option>
                                <option value="14:00">14:00</option>
                                <option value="15:00">15:00</option>
                                <option value="16:00">16:00</option>
                                <option value="17:00">17:00</option>
                                <option value="18:00">18:00</option>
                            </select>
                            -
                            <select name="endTime" id="endTime" disabled required>
                              <option>- 종료시간 -</option>
                                <option value="10:00">10:00</option>
                                <option value="11:00">11:00</option>
                                <option value="12:00">12:00</option>
                                <option value="13:00">13:00</option>
                                <option value="14:00">14:00</option>
                                <option value="15:00">15:00</option>
                                <option value="16:00">16:00</option>
                                <option value="17:00">17:00</option>
                                <option value="18:00">18:00</option>
                                <option value="19:00">19:00</option>
                            </select>
	                        </div>
	                        </td>
	                    </tr>
	                    <tr>
	                        <th>부서</th>
	                        <td>${loginUser.deptName }</td>
	                        <th>신청사유</th>
	                        <td>
	                        	<textarea name="cause" class="form-control col-sm-7" rows="3" style="resize:none;" required>
	
	                            </textarea>       
	                        </td>
	                    </tr>
	                    <tr>
	                        <th>직급</th>
	                        <td>${loginUser.jobName}</td>
	                    </tr>
	                </table>
                </div>
                <br clear="both">
            	<div class="btn-area" align="center">
	                <button type="submit" class="btn btn-sm btn-success" onclick="return timeNeed();">제출하기</button>
	                <button type="button" class="btn btn-sm btn-outline-success" onclick="">이전으로</button>
           		 </div>
            </form>
         
            
            <br><br>
        </div>
        <br>
    </div>
     <script>
    $(function(){
		
		var now_utc = Date.now() // 지금 날짜를 밀리초로
		// getTimezoneOffset()은 현재 시간과의 차이를 분 단위로 반환
		var timeOff = new Date().getTimezoneOffset()*60000; // 분단위를 밀리초로 변환
		// new Date(today-timeOff).toISOString()은 '2022-05-11T18:09:38.134Z'를 반환
		var today = new Date(now_utc-timeOff).toISOString().substring(0, 10);
		 
		document.getElementById("resDate").setAttribute("min", today);
	})
    
    </script>
    <script>
    
    function selectDay(val){
    	let carName = $("#cName").text();
    	 $("#startTime").prop("disabled",false);
    	 console.log(val);
    	 $.ajax({
 			url:"carRes.select",
 			data:{carName:carName,resDate:val},
 			success:function(list){
 			    for(let i=0; i<list.length; i++){
 					
 					$("#startTime option").each(
 							function(){    
 								if($(this).val() >= list[i].startTime && $(this).val() < list[i].endTime) {
 									   $(this).prop("disabled",true);
 									}
 						    }
 						);

 					$("#endTime option").each(
 							function(){    
 								if($(this).val() > list[i].startTime && $(this).val() < list[i].endTime) {
 									   $(this).prop("disabled",true);
 									}
 						    }
 						);
 				}
 			},error: function( request, status, error ){
 			    alert("status : " + request.status + ", message : " + request.responseText + ", error : " + error);
 			   }
 			
 			})
 	    
	    	
    }
    
    
    </script>
    <script>

    function timeNeed(){
		if($("select[name=startTime]").val() == "- 시작시간 -" || $("select[name=endTime]").val() == "- 종료시간 -"){
			alert("시작/종료시간을 입력하세요.");
			return false;
	}
		 }
    
    function endTimeShow(val){
			
			 $("#endTime").prop("disabled",false);
			 
			$("#endTime option").each(
				function(){    
					if($(this).val() <= val) {
						   $(this).prop("disabled",true);
						}
			    }
			);
			let resDate= $("#resDate").val();
			$.ajax({
    			url:"carRes.select",
    			data:{carName:'${c.carName}',resDate:resDate},
    			success:function(list){
    				for(let i=0; i<list.length; i++){
    					$("#endTime option").each(
    							function(){    
    								if($(this).val() >= list[i].startTime && $(this).val() <= list[i].endTime) {
    									   $(this).prop("disabled",true);
    									   
    									}
    								
    								if(list[i].startTime >= val ){
    									
    									if($(this).val() >= list[i].startTime){
    										
    									  $(this).prop("disabled",true);
    									}
    								}
    						    }
    						);

    				}
    			},error:function(){
    				console.log('날짜 조회용 ajax 통신 실패');
    			}
    			
    		})

		 }	    	
    </script>
    
</body>
</html>