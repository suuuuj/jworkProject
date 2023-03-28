<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<style>
     #pagingArea{width:fit-content;margin:auto;}
     div{box-sizing: border-box;}

	#resDetailView td{
	 height:50px;
	
	}
	#resDetailView{
		width:600px;
	}
	#reject{padding:10px;}
</style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
     <jsp:include page="../common/menubar.jsp"/>
    <div class="outer"  style="width:900px; margin:20px;">
        <h3>차량 예약 승인 관리</h3>
        <hr>
        <div>
            <div class="select-area">
               <select name="optionSelect" id="option" onchange="selectResStatus($(this).val());">
                    <option value="1,2,3" >전체예약</option>
                    <option value="1">미승인예약</option>
               </select>
            </div>
            <br>
            <div id="">
                <table class="table table-hover text-center" id="carRes" style="width:900px;">
                    <thead>
                        <tr>
                        	<th>예약번호</th>
                            <th>차량명</th>
                            <th>신청사원</th>
                            <th>신청일시</th>
                            <th>신청사유</th>
                            <th>신청상태</th>
                        </tr>
                   </thead>
                   <tbody>
                        <c:forEach items="${list}" var="c">
                        <tr class="detailView" onclick="detailView(${c.resNo});" data-toggle="modal" data-target="#ResDetailView">
                        	<td class="resNo">${c.resNo }</td>
                            <td class="carName">${c.carName }</td>
                            <td class="reservation">${c.reservation}&nbsp;${c.empName }</td>
                            <td class="resDate">${c.resDate }&nbsp;${c.startTime}~${c.endTime}</td>
                            <td class="cause">${c.cause }</td>
                            <td>
                            	<c:choose>
	                            	<c:when test="${c.apStatus eq 1}">
	                               	 	<button type="button" class="btn btn-sm btn-secondary">승인대기</button>
	                                </c:when>
	                                <c:when test="${c.apStatus eq 2}">
	                               	 	<button type="button" class="btn btn-sm btn-primary" disabled>승인완료</button>
	                                </c:when>
	                                <c:otherwise>
	                                	<button type="button" class="btn btn-sm btn-danger">반려</button>
	                                </c:otherwise>
                                </c:choose>
                            </td>
                        </tr>
                        </c:forEach>
                   </tbody>

                </table>

            </div>
             <br>
             <div id="pagingArea">
	             <ul class="pagination">
	             	<c:choose>
	              	<c:when test="${pi.currentPage eq 1}">
	                  	<li class="page-item disabled"><a class="page-link" href="#"><</a></li>
	                 </c:when>
	                 <c:otherwise>
	                   <li class="page-item"><a class="page-link" href="confirmList.car?cpage=${pi.currentPage -1 }"><</a></li>
	               	</c:otherwise>
		           </c:choose>
		           <c:forEach var="p"  begin="${pi.startPage}" end="${pi.endPage}">
		              <li class="page-item"><a class="page-link" href="confirmList.car?cpage=${p}">${p}</a></li>
		           </c:forEach>
	                <c:choose>
                		<c:when test="${pi.currentPage eq pi.maxPage}">
                 			<li class="page-item disabled"><a class="page-link" href="#">></a></li>
	           	 		</c:when>
		           	 	<c:otherwise>
		           	 		<li class="page-item"><a class="page-link" href="confirmList.car?cpage=${pi.currentPage + 1}">></a></li>
		        		</c:otherwise>
	          		</c:choose>
	             </ul>
         </div>
            
        </div>
       
       
   
    </div>
    <!-- 상세보기 모달 -->
    <div class="modal" id="ResDetailView">
        <div class="modal-dialog">
        <div class="modal-content">
    
            <!-- Modal Header -->
            <div class="modal-header">
            <h4 class="modal-title">차량 예약 상세관리</h4>
            <button type="button" class="close" data-dismiss="modal">&times;</button>
            <input type="hidden" id="resNo">
            </div>
    
            <!-- Modal body -->
            <div class="modal-body">
                <table id="resDetailView">
                    <tr>
                        <th>차량명</th>
                        <td id=carName></td>
                    </tr>
                    <tr>
                        <th>신청사원</th>
                        <td id="reservation"></td>
                    </tr>
                    <tr>
                        <th>신청일시</th>
                        <td id="useDate"></td>
                    </tr>
                    <tr>
                        <th>신청사유</th>
                        <td id="cause"></td>
                    </tr>
                    <tr>
                        <th>반려사유</th>
                        <td>
                            <textarea name="reject" id="reject" cols="30" rows="5" style="resize:none;">
                              
                            </textarea>
                        </td>
                    </tr>
                </table>
            </div>
    
            <!-- Modal footer -->
            <div class="modal-footer" id="btn-area">
	            <button type="button" class="btn btn-secondary btn-sm" data-dismiss="modal">닫기</button>
	           
            </div>
    
        </div>
        </div>
    </div>
    <script>
    
    	function detailView(resNo){
    		
    		$.ajax({
    			url:"ajaxdetail.carRes",
    			data:{resNo:resNo},
    			success:function(c){
    				console.log(c);
    				$("#carName").text(c.carName);
    				$("#reservation").text(c.empName + c.reservation);
					$("#useDate").html(c.resDate+"&nbsp;"+ c.startTime +"~" +c.endTime);
					$("#cause").text(c.cause);
    				$("#reject").val(c.reject);
    				$("#resNo").val(c.resNo);
    				
    				if(c.apStatus == 1){
    					let value="";
    					
        				value="<button type='button' class='btn btn-secondary btn-sm' data-dismiss='modal'>닫기</button>"
        				+ "<button type='button' class='btn btn-primary btn-sm' onclick='changeStatus(2);'>승인"
        				+"</button> <button type='button' class='btn btn-danger btn-sm' onclick='changeStatus(3)'>반려</button>";
    					
        				$("#btn-area").html(value);
    					
    				}else{
						let value="";
    				
        				value="<button type='button' class='btn btn-secondary btn-sm' data-dismiss='modal'>닫기</button>";
        				$("#btn-area").html(value);
    				}
    				
    			},error:function(){
    				
    				console.log("예약 상세조회용 ajax 통신 실패");
    			}
    		});
    	}
    	
    	function changeStatus(num){
    		console.log($("#reject").val());
    		$.ajax({
				url:"approve.res",
				data:{apStatus:num,resNo:$("#resNo").val(),reject:$("#reject").val()},
				success:function(num){
					if(num==2){
						alert("예약 승인 처리 완료되었습니다.");
					}else{
						alert("예약 반려 처리 완료되었습니다.");
					}
					location.reload();
					
				},error:function(){
					console.log("옵션 조회용 ajax 통신 실패");
				}
			
			});
    	}
    </script>
    
    <script type="text/javascript">
    
 
    	function selectResStatus(val,cpage){
    			$.ajax({
    				url:"select.resStatus",
  					data:{option:val,cpage:cpage},
  					success:function(map){
  				      let value="";
				      let value2=""; 
				      let btn="";
				      let resNo;
				     for(var i=0;i<map.list.length;i++){
				    		
							
	    				if(map.list[i].apStatus == 1){
	    					
	    					btn="<button type='button' class='btn btn-secondary btn-sm' >승인대기</button>";
	    					
	    					
	    				}else if(map.list[i].apStatus == 2){
	    				
	    					btn="<button type='button' class='btn btn-primary btn-sm'>승인완료</button>";
	    				}else if(map.list[i].apStatus == 3){
	    				
							btn="<button type='button' class='btn btn-warning btn-sm'>반려</button>";
	    				}
			    	 	
	    				let no= map.list[i].resNo;
						value2 += "<tr class='text-center' onclick='detailView(" + no + ");' data-toggle='modal' data-target='#ResDetailView'><td>" + map.list[i].resNo + "</td>" 
						+"<td>" + map.list[i].carName + "</td>" 
						+"<td>" + map.list[i].reservation +"&nbsp;"+ map.list[i].empName + "</td>" 
						+"<td>" + map.list[i].resDate +"&nbsp;"+map.list[i].startTime +"~"+map.list[i].endTime +"</td>" 
						+"<td>" + map.list[i].cause + "</td>"
						+"<td>" + btn +"</td></tr>";
					
				     }
				     console.log(value2);
					  $('#carRes tbody').html(value2);
				 //페이징바
 	            let page="";
 	            if(map.pi.currentPage ==1){
 	               page += "<li class='page-item disabled' ><a class='page-link' href='#' style='color:rgb(196, 197, 197)'><</a></li>"
 	            }else{
 	               page += "<li class='page-item'><a class='page-link' onclick='selectResStatus(" + (map.pi.currentPage-1) + ");'><</a></li>"
 	            }
 	            
 	            for(var p=map.pi.startPage; p<=map.pi.endPage; p++){
 	               page += "<li class='page-item'><a class='page-link' onclick='selectResStatus(" + p + ");'>" + p + "</a></li>"
 	            }
 	            
 	            if(map.pi.currentPage == map.pi.maxPage){
 	               page += "<li class='page-item disabled'><a class='page-link ' href='#' style='color:rgb(196, 197, 197)'>></a></li>"
 	            }else{
 	               page += "<li class='page-item'><a class='page-link' onclick='selectResStatus(" +  (map.pi.currentPage+1) + ");'>></a></li>"
 	            }
 	            
 	            $(".pagination").html(page);
  					},error:function(){
  						console.log("옵션별 차량 예약 조회 ajax 통신 실패");
  						
  					}
  				})
    	}
    </script>

  
</body>
</html>