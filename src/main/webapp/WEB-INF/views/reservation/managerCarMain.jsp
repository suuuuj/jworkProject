<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<style>
     #pagingArea{width:fit-content;margin:auto; }
     div{box-sizing: border-box;}
     figure {
  text-align: center;
    }
    #img-area{
        width: 800px;
        margin: 0 auto;
        overflow: hidden;
        padding-top:10px;
    }
    #img-area>article{
        float: left;
        margin-left: 10px;
        margin-bottom: 10px;

    }
    .detail-img{display: inline-block;}
   
     .subImg{
        top:5px;
        right: 5px;
      
    }
  #car-updateForm td{height:50px;}
</style>

<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
      <jsp:include page="../common/menubar.jsp"/>
       <div class="outer" style="width:940px;  margin:20px;">
        <h2>차량 관리</h2>
        <hr>
        <div>
            <div class="btn-area" >
                <a class="btn  btn-success" href="enrollForm.car">+차량 등록</a>
                <a class="btn  btn-outline-success" href="confirmList.car">승인 관리</a>
            </div>
            <br>
            <div id="img-area" style="width:940px;">
            	<c:forEach var="c" items="${list}">
                <div class="detail-img" style="position: relative; margin:10px;">
                    <article>
                        <figure>
                            <img src="${c.carImg}" width="260px" height="170px"  onclick="detailView('${c.carName}');" data-toggle="modal" data-target="#carDetailView">
                            <figcaption>${c.carName}</figcaption>
                        </figure>
                    </article>
                    <div style="position: absolute;" class="subImg" >
	                        <a class="btn" onclick="deleteCar('${c.carName}');">
	                        	<img src="resources/images/reservation/trash.png" width="23px;" height="23px;" >
	                        </a>
	                 </div>
                </div>
                </c:forEach>
            </div>
            <br>
            <script>
            	function detailView(carName){
            		
            		$.ajax({
            			url:"detail.car",
            			data:{carName:carName},
            			success:function(c){
            				$("#carName").val(c.carName);
            				$("#carImg").attr("src",c.carImg);
            				$("#carType").val(c.carType);
            				$("#gearType").val(c.gearType);
            				$("#color").val(c.color);
            				$("#maker").val(c.maker);
            				$("#fuelType").val(c.fuelType);
            				$("#modelYear").val(c.modelYear);
            				$("#carImg2").val(c.carImg);
            				
            				if(c.status == 'Y'){
            					$("#ok").attr("checked",true);
            				}else{
            					$("#broken").attr("checked",true);
            				}
            				$("textarea[name=etc]").text(c.etc);


            			},error:function(){
            				
            				console.log("ajax통신 실패");
            			}
            			
            			
            		});
            		
            		
            	}
            
            </script>
             <div id="pagingArea">
	             <ul class="pagination">
	             	<c:choose>
	              	<c:when test="${pi.currentPage eq 1}">
	                  	<li class="page-item disabled"><a class="page-link" href="#"><</a></li>
	                 </c:when>
	                 <c:otherwise>
	                   <li class="page-item"><a class="page-link" href="list.car?cpage=${pi.currentPage -1 }"><</a></li>
	               	</c:otherwise>
		           </c:choose>
		           <c:forEach var="p"  begin="${pi.startPage}" end="${pi.endPage}">
		              <li class="page-item"><a class="page-link" href="list.car?cpage=${p}">${p}</a></li>
		           </c:forEach>
	                <c:choose>
                		<c:when test="${pi.currentPage eq pi.maxPage}">
                 			<li class="page-item disabled"><a class="page-link" href="#">></a></li>
	           	 		</c:when>
		           	 	<c:otherwise>
		           	 		<li class="page-item"><a class="page-link" href="list.car?cpage=${pi.currentPage + 1}">></a></li>
		        		</c:otherwise>
	          		</c:choose>
	             </ul>
         </div>
        </div>
        <br>
          


    </div>
   
    <script>
    	function deleteCar(carName){
    		if(confirm('정말 차량을 삭제하시겠습니까?'))   
    			{
    			
    			$.ajax({
    				url:"delete.car",
    				data:{carName:carName},
    				async: true,
    				success:function(result){
    					if(result>0){
    						alert("차량 삭제 성공");
    						location.reload();
    					}
    				},error:function(){
    					console.log("ajax통신 실패");
    				}
    					
    			});
    			}
    	}
    	
    </script>
	 

    <!--차량 상세조회 모달 -->
    <div class="modal" id="carDetailView">
        <div class="modal-dialog">
        <div class="modal-content">
    
            <!-- Modal Header -->
            <div class="modal-header">
            <h4 class="modal-title">차량 조회</h4>
            <button type="button" class="close" data-dismiss="modal">&times;</button>
            </div>
    
            <!-- Modal body -->
            <div class="modal-body">
               <form action="update.car" method="post" enctype="multipart/form-data" >
                <table id="car-updateForm" >
                    <tr>
                        <th >차량명</th>
                        <td>
                            <div class="col-10">
                                 <input type="text" class="form-control" name="carName" placeholder="차량명을 입력하세요" id="carName" readonly>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <th>차량 대표 이미지</th>
                        <td>
                        &nbsp;&nbsp;
                        	  <input type="hidden" id="carImg2" name="carImg"  value="${car.carImg}">
                        	 <img id="carImg" src="<c:out value='${car.carImg}' default='resources/uploadFiles/addImg.png'/>"  width="180px" height="130px" onclick="$('#carImgFile').click();">
                             <input type="file" name="reupfile"  id="carImgFile" style="display:none;">
                        </td>
                    </tr>
                    <tr>
                        <th >차량종류</th>
                        <td>
                          <div class="col-10">
                                 <input type="text" class="form-control"  id="carType" name="carType" placeholder="차량종류를 입력하세요" required>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <th >기어형식</th>
                        <td>
                           <div class="col-10">
                                 <input type="text" class="form-control" id="gearType"  name="gearType" placeholder="기어형식을 입력하세요" value="${c.gearType}"required>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <th >차량색상</th>
                        <td>
                           <div class="col-10">
                                 <input type="text" class="form-control" id="color" name="color" placeholder="차량색상을 입력하세요" required>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <th >제조사</th>
                        <td>
                           <div class="col-10">
                                 <input type="text" class="form-control"  id="maker" name="maker" placeholder="제조사를 입력하세요" required>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <th >연료형식</th>
                        <td>
                           <div class="col-10">
                                 <input type="text" class="form-control" id="fuelType"name="fuelType" placeholder="연료형식을 입력하세요" required>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <th >차량연식</th>
                        <td>
                          <div class="col-10">
                                 <input type="text" class="form-control" id="modelYear" name="modelYear"  placeholder="차량연식을 입력하세요" required>
                            </div>
                        </td>                   
                    </tr>
                    <tr>
                        <th>설비상태</th>
                        <td>
                            <label for="ok" >정상</label>
                            <input type="radio" name="status" id="ok" value="Y">
                            <label for="broken">고장</label>
                            <input type="radio" name="status" id="broken" value="N">
                        </td>
                    </tr>
                    <tr>
                        <th >비고</th>
                        <td>
                            <textarea class="form-control" name="etc" id="" cols="26" rows="3" style="resize:none" name="etc" id="etc"></textarea>
                        </td>
                    </tr>

                </table>
                 <script>
						 $(function(){
							
							 $("#carImgFile").on("change", function(event) {
		
								    var file = event.target.files[0];
		
								    var reader = new FileReader(); 
								    reader.onload = function(e) {
		
								        $("#carImg").attr("src", e.target.result);
								    }
								    reader.readAsDataURL(file);
								});
							})
							
						</script>
						
                <br><br>
                 <div class="btn-area" align="center">
	                <button type="submit" class="btn btn-sm btn-success">수정하기</button>
            	</div>
            </form>
            </div>
    
        
        </div>
        </div>
    </div>
</body>
</html>