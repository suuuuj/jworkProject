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

    #cfRoom-updateForm td{
        height: 70px;
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
	                            <img src="${c.firstImg}" width="250px" height="150px"  onclick="detailCfr('${c.cfrName}');" data-toggle="modal" data-target="#cfrDetailView">
	                            <figcaption>${c.cfrName}</figcaption>
	                        </figure>
	                    </article>
	                    <div style="position: absolute;" class="subImg">
	                        <a class="btn" onclick="deleteCfr('${c.cfrName}');">
	                        	<img src="resources/images/reservation/trash.png" width="23px;" height="23px;">
	                        </a>
	                    </div>
	                </div>
	             </c:forEach>         
            </div>
            <script>
            	function deleteCfr(cfrName){
            		
            		if(confirm('정말 회의실을 삭제하시겠습니까?'))   
        			{
        			$.ajax({
        				url:"delete.cfr",
        				data:{cfrName:cfrName},
        				async: true,
        				success:function(result){
        					if(result>0){
        						alert("회의실 삭제 성공");
        						location.reload();
        					}
        				},error:function(){
        					console.log("ajax통신 실패");
        				}
        			});
        			
        			}
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
		         function detailCfr(cfrName){
		         	
		         	$.ajax({
		         		url:"adetail.cfr"
		         	   ,data:{cfrName:cfrName}
		         	   ,success:function(c){
		         			$("#inputCfrName").val(c.cfrName);
		         			$("#firstImg").attr("src",c.firstImg);
		         			$("#capacity").val(c.capacity);
		         			
		         			var equipmentArr = c.equipment.split(",");
		         			var cnt = equipmentArr.length;
							var value ="";
							for(var i=0; i<cnt; i++){
							value+= equipmentArr[i]
                			+"&nbsp;<input type='checkbox' name='equipment' value='"
                			+equipmentArr[i] +"'>&nbsp;&nbsp;";
	         				}
							$("#equipment-area1").html(value);
							
		         			for(var i=0; i<cnt; i++){
		         			  
		         			$('input:checkbox[name=equipment]').each(function(){
		         			    if(this.value == equipmentArr[i]){
		         			    this.checked = true;
		         			    }
		         			  });
		         			
		         			} 
		         			
		         	   },error:function(){
		         		   
		         		   console.log("ajax통신에러");
		         	   }
		         	});
		         	
		         }
		          
            </script>
        <!-- 회의실 상세보기 모달 -->
        <div class="modal" id="cfrDetailView">
            <div class="modal-dialog">
            <div class="modal-content">
        
                <!-- Modal Header -->
                <div class="modal-header">
                <h4 class="modal-title">회의실 조회 / 수정</h4>
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                </div>
        
                <!-- Modal body -->
                <div class="modal-body">
                    <form action="update.cfr" method="post" enctype="multipart/form-data" >
                        <table id="cfRoom-updateForm">
                            <tr >
                           	   <th>회의실명</th>
	                            <td >
	                            	<div class="col-7">
	                            		<input type="text" name="cfrName" id="inputCfrName" readonly class="form-control">
	                           		</div>
	                            </td>
		                        </tr>
		                        <tr>
	                            <th>회의실 이미지</th>
	                            <td >
	                                <div style="width: 320px;">
	                                    <img width="150px" height="100px" id="firstImg" onclick="$('#firstImgFile').click();">
	                                    <input type="file" id="firstImgFile" name="reupfile" style="display:none;">
	                                </div>
	                            </td>
		                        </tr>
		                        <tr>
		                            <th>수용인원</th>
		                            <td>
		                            	<div class="col-4">
		                            		<input type="number" id="capacity" name="capacity" class="form-control">
		                           		</div>
		                            </td>
		                        </tr>
		                        <tr>
		                            <th>회의장비</th>
		                            <td >
	                            		<div id="equipment-area1"></div>
		                            	<div id="equipment-area2"></div>
		                            </td>
		                        </tr>
	                            <tr>
	                                <td colspan="2"><button type="button" class="btn btn-sm btn-secondary" data-toggle="modal" data-target="#addObject">+장비추가</button></td>
	                            </tr>
	                            <tr>
	                            	<td colspan="2">
						                <div class="modal-footer">
						                    <button type="submit" class="btn btn-sm btn-primary" >수정하기</button>
						                    <button type="button" class="btn btn-sm btn-light" data-dismiss="modal" onclick="history.back();">이전으로</button>
						                </div>
					                </td>
	                            </tr>
                        </table>
                    </form>
                     <script>
						 $(function(){
							
							 $("#firstImgFile").on("change", function(event) {
		
								    var file = event.target.files[0];
		
								    var reader = new FileReader(); 
								    reader.onload = function(e) {
		
								        $("#firstImg").attr("src", e.target.result);
								    }
								    reader.readAsDataURL(file);
								});
							})
							
						</script>
                </div>
            </div>
            </div>
        </div>

    </div>
    
     <!-- 장비추가 모달 -->
            <div class="modal" id="addObject">
                <div class="modal-dialog">
                <div class="modal-content">
            
                    <!-- Modal Header -->
                    <div class="modal-header">
                    <h4 class="modal-title">장비추가</h4>
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    </div>
            
                    <!-- Modal body -->
                    <div class="modal-body">
                        <form action="add.eq" method="post">
                            장비명 : <input type="text" id="addEq">

                                <button type="button" class="btn btn-secondary btn-sm" onclick="addEmp();">추가하기</button>
                                <button type="button" class="btn btn-primary btn-sm" data-dismiss="modal">닫기</button>
                    
                        </form>
                    </div>
            
                </div>
            </div>
            </div>
             <script>
        		function addEmp(){
        			
        			$.ajax({
                		url:"add.eq",
                		data:{equipment:$("#addEq").val()},
                		success:function(result){
                			let value= result 
                			+"&nbsp;<input type='checkbox' name='equipment' value='"
                			+result+"'>&nbsp;&nbsp;";
                			
                			$("#equipment-area2").append(value);
                			$("#addEq").val("");
                		},error:function(){
                			console.log("장비 추가 ajax 통신 실패");
                		}
                				
                	});
            	
        			
        		}
        	
        </script>
</body>
</html>