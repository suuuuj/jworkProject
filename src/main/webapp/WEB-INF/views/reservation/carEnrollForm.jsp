<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<style>
     #pagingArea{width:fit-content;margin:auto;}
     div{box-sizing: border-box;}
    #car-enrollForm th{
        height: 100px;
    }
    .outer{
        width: 960px;
        margin:20px;
    }
    #equipment-area{display:inline;}
</style>


<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
    <jsp:include page="../common/menubar.jsp"/>
    <div class="outer" >
        <h2>차량 등록</h2>
        <hr><br>
        <div >
            <form action="insert.car" method="post" enctype="multipart/form-data" >
                <table id="car-enrollForm">
                    <tr >
                        <th >차량명</th>
                        <td>
                            <div class="col-6">
                                 <input type="text" class="form-control" name="carName" required>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <th>차량 대표 이미지</th>
                        <td>
                        	 <img id="carImg" src="<c:out value='${car.carImg}' default='resources/uploadFiles/imgAdd.png'/>"  width="150px" height="100px" onclick="$('#carImgFile').click();">
                             <input type="file" id="carImgFile" style="display:none;" required>
                        </td>
                    </tr>
                    <tr>
                        <th >차량종류</th>
                        <td>
                            <div class="col-6">
                                 <input type="text" class="form-control" name="carType" required>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <th >기어형식</th>
                        <td>
                            <div class="col-6">
                                 <input type="text" class="form-control" name="gearType" required>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <th >차량색상</th>
                        <td>
                            <div class="col-6">
                                 <input type="text" class="form-control" name="color" required>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <th >제조사</th>
                        <td>
                            <div class="col-6">
                                 <input type="text" class="form-control" name="maker" required>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <th >연료형식</th>
                        <td>
                            <div class="col-6">
                                 <input type="text" class="form-control" name="fuelType" required>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <th >차량연식</th>
                        <td>
                            <div class="col-6">
                                 <input type="text" class="form-control" name="modelYear" required>
                            </div>
                        </td>                   
                    </tr>
                    <tr>
                        <th>설비상태</th>
                        <td>
                            <label for="ok">정상</label><br>
                            <input type="radio" name="status" id="ok">
                            <label for="broken">고장</label><br>
                            <input type="radio" name="status" id="broken">
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
            <br><br>
            </div>
    
        </div>
        <br>


    </div>
</body>
</html>