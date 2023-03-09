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
    .outer{
        width: 960px;
        margin:20px;
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
    <div class="outer" >
        <h2>차량 관리</h2>
        <hr><br>
        <div>
            <div class="btn-area" >
                <a class="btn  btn-secondary" href="enrollForm.car">+차량 등록</a>
                <button type="button" class="btn  btn-light">예약 조회</button>
            </div>
            <br><br>
            <div id="img-area">
            	<c:forEach var="c" items="${list}">
                <div class="detail-img" style="position: relative;" data-toggle="modal" data-target="#carDetailView">
                    <article>
                        <figure>
                            <img src="${c.carImg}" width="200px" height="140px">
                            <figcaption>${c.carName}</figcaption>
                        </figure>
                    </article>
                    <div style="position: absolute;" class="subImg">
	                        <a class="btn" onclick="deleteCar();">
	                        	<img src="resources/images/reservation/trash.png" width="23px;" height="23px;">
	                        </a>
	                        <form action="delete.car" method="post" id="deleteForm">
	                        	<input type="hidden" name="carName" value="${c.carName}">
	                        </form>
	                 </div>
                </div>
                </c:forEach>
            </div>
             <div id="pagingArea">
             <ul class="pagination">
             	<c:choose>
              	<c:when test="${pi.currentPage eq  1}">
                  	<li class="page-item disabled"><a class="page-link" href="#"><</a></li>
                  </c:when>
                  <c:otherwise>
                   <li class="page-item"><a class="page-link" href="list.car?cpage=${pi.currentPage -1 }"><</a></li>
               </c:otherwise>
           </c:choose>
           <c:forEach var="p"  begin="${pi.startPage }" end="${pi.endPage }">
                  <li class="page-item"><a class="page-link" href="list.car?cpage=${p }">${p }</a></li>

                	</c:forEach>
                	<c:choose>
                		<c:when test="${pi.currentPage eq pi.maxPage}">
                 		<li class="page-item disabled"><a class="page-link" href="#">></a></li>
           	 	</c:when>
           	 	<c:otherwise>
           	 		<li class="page-item"><a class="page-link" href="list.car?cpage=${pi.currentPage + 1 }">></a></li>
        				</c:otherwise>
          		</c:choose>
             </ul>
         </div>
        </div>
        <br>
          


    </div>
   
    <script>
        //이미지 클릭시 차량 조회 / 수정 모달
       // <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#carDetailView">
            
        //</button>

    	function deleteCar(){
    		
    		$("#deleteForm").submit();
    	}

    </script>
	 

    <!-- The Modal -->
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
                <table id="car-enrollForm">
                    <tr >
                        <th >차량명</th>
                        <td>
                            <div class="col-10">
                                 <input type="text" class="form-control" name="carName" placeholder="차량명을 입력하세요" required>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <th>차량 대표 이미지</th>
                        <td>
                        	 <img id="carImg" src="<c:out value='${car.carImg}' default='resources/uploadFiles/imgAdd.png'/>"  width="100px" height="70px" onclick="$('#carImgFile').click();">
                             <input type="file" name="upfile" id="carImgFile" style="display:none;" required>
                        </td>
                    </tr>
                    <tr>
                        <th >차량종류</th>
                        <td>
                          <div class="col-10">
                                 <input type="text" class="form-control" name="carType" placeholder="차량종류를 입력하세요" required>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <th >기어형식</th>
                        <td>
                           <div class="col-10">
                                 <input type="text" class="form-control" name="gearType" placeholder="기어형식을 입력하세요" required>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <th >차량색상</th>
                        <td>
                           <div class="col-10">
                                 <input type="text" class="form-control" name="color" placeholder="차량색상을 입력하세요" required>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <th >제조사</th>
                        <td>
                           <div class="col-10">
                                 <input type="text" class="form-control" name="maker" placeholder="제조사를 입력하세요" required>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <th >연료형식</th>
                        <td>
                           <div class="col-10">
                                 <input type="text" class="form-control" name="fuelType" placeholder="연료형식을 입력하세요" required>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <th >차량연식</th>
                        <td>
                          <div class="col-10">
                                 <input type="text" class="form-control" name="modelYear"  placeholder="차량연식을 입력하세요" required>
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
                            <textarea class="form-control" name="etc" id="" cols="30" rows="10" style="resize:none" name="etc"></textarea>
                        </td>
                    </tr>

                </table>
                <br><br>
                 <div class="btn-area">
	                <button type="submit" class="btn btn-sm btn-secondary">등록하기</button>
	                <button type="button" class="btn btn-sm btn-light" onclick="history.back();">이전으로</button>
            	</div>
            </form>
            </div>
    
        
        </div>
        </div>
    </div>
</body>
</html>