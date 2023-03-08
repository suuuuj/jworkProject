<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>

<style>
   
    .outer{
        width: 960px;
    }
    #pagingArea{width:fit-content;margin:auto; margin-right: 520px; }

</style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
    <jsp:include page="../common/menubar.jsp"/>
    <div class="outer">
        <h2>회의실 예약 이력 조회</h2>
        <hr>
        <div>
            <div style="float: left; ">
                <button type="button" class="btn btn-sm btn-secondary">회의실 정보</button>
                <button type="button" class="btn btn-sm btn-secondary">예약하기</button>&nbsp;
                <button type="button"><</button>
                <button type="button">></button>
            </div>
            <div style="float: left; font-weight: 800; font-size: 25px; margin-left: 200px;"" >
                2023년 02월 17일
            </div>
            <div style="float: left; margin-left: 200px;" >
                <button type="button">today</button>
                <button type="button">week</button>
            </div>
            <br claear="both">
            <br>
            <div align="center">
                <table border="1" style="width:900px; height:600px; text-align: center;" >
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
                <div>
                    <button>1회의실</button>
                    <button>2회의실</button>
                    <button>3회의실</button>
                    <button>4회의실</button>
                    <button>5회의실</button>
                    <button>6회의실</button>
                </div>
                <div style="width:600px">
                    <table>
                        <tr>
                            <th>회의실명</th>
                            <td>2회의실</td>
                        </tr>
                        <tr>
                            <th>회의실 이미지</th>
                            <td >
                                <div style="width: 320px;">
                                    <img src="" width="150px" height="100px">
                                    <img src="" width="150px" height="100px">
                                    <img src="" width="150px" height="100px">
                                    <img src="" width="150px" height="100px">
                                </div>
                            </td>
                            
                        </tr>
                        <tr>
                            <th>수용인원</th>
                            <td>10명</td>
                        </tr>
                        <tr>
                            <th>회의장비</th>
                            <td>pc, 빔프로젝터</td>
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
               <form action="">
                    <table>
                        <tr>
                            <th>회의실</th>
                            <td>
                                <select name="" id="">
                                    <option value="">1회의실</option>
                                    <option value="">2회의실</option>
                                    <option value="">3회의실</option>
                                    <option value="">4회의실</option>
                                    <option value="">5회의실</option>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <th>예약자</th>
                            <td>정여진 102312(총무부)</td>
                        </tr>
                        <tr>
                            <th>날짜</th>
                            <td><input type="date"></td>
                        </tr>
                        <tr>
                            <th>시간</th>
                            <td><input type="time">-<input type="time"></td>
                        </tr>
                        <tr>
                            <th>인원</th>
                            <td><input type="number"></td>
                        </tr>
                        <tr>
                            <th>회의제목</th>
                            <td><input type="text"></td>
                        </tr>
                    </table>
               </form>
            </div>
    
        </div>
        </div>
    </div>
  
</body>
</html>