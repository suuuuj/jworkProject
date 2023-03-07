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
    <div style="width: 960px;">
        <h2>차량 예약 승인 관리</h2>
        <hr><br>
        <div>
     
            <div id="day-select" align="center">
              
                <h4>
                    <a href=""><</a>
                    2022.02.01 
                    <img src="" width="30px" height="30px" onclick="$('#calender').click();">
                    <a href="">></a>
                 </h4>
               
                <input type="date" style="display: none;" id="calender">
            </div>
            <br><br>
            <div id="tabe-area">
                <table class="table table-bordered" id="reservation-table">
                    <thead>
                        <tr>
                            <td></td>
                            <th>레이 2012허02</th>
                            <th>소나타 1232다02</th>
                            <td></td>    
                        </tr>
                        <tr>
                            <td><a href="" style="font-size: 40px;"><</a></td>
                               <td>
                                 <img src="//bit.ly/2GrygUe" width="250px" height="140px">
                               </td>
                               <td>
                                 <img src="//bit.ly/2GrygUe" width="250px" height="140px">
                               </td>
                               <td><a href="" style="font-size: 40px;">></a></td>
                            </tr>
                           <tr>
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