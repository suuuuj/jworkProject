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
        height: 50px;
    }
    .outer{
        width: 960px;
        margin:20px;
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
    <div class="outer">
        <h2>차량 예약</h2>
        <hr>
        <div style="width:900px;">
            <h4>차량정보</h4>
            <hr>
            <table id="car-information" style="width:900px;">
                <tr>
                    <th>차량명</th>
                    <td>소나타 0131허12</td>
                    <th>제조사</th>
                    <td>현대</td>
                </tr>
                <tr>
                    <th>차량 대표 이미지</th>&nbsp;
                    <td>
                        <img src="//bit.ly/2GrygUe" width="200px" height="140px"> 
                    </td>
                    <th>연료형식</th>
                    <td>LPG</td>
                </tr>
                <tr>
                    <th>차량종류</th>
                    <td>세단</td>
                    <th>차량연식</th>
                    <td>2011</td>
                </tr>
                <tr>
                    <th>기어형식</th>
                    <td>자동</td>
                    <th>비고</th>
                    <td>!~~!</td>
                </tr>
                <tr>
                    <th>차량색상</th>
                    <td>힁색</td>
                    <th>현재상태</th>
                    <td></td>
                </tr>

            </table>
            <hr>
            <h4>대여사원 정보</h4>
            <hr>
            <div style="float: left;">
                <img src="${loginUser.profileUrl}" width="200px" height="140px"> 
            </div>
            <form action="reserv.car" method="post">
                <table id="carReservForm" style="width:900px;">
                  
                    <tr>
                        <th>사원명</th>
                        <td>
                        ${loginUser.empName}
                        <input type="hidden" value="${loginUser.empNo}" name="reservation">
                        </td>
                        
                        <th>신청날짜</th>
                        <td>
                          <div class="col-8">
                        	<input type="date" class="form-control" name="resDate">
                    	  </div>
                    	 </td>
                    </tr>
                    <tr>
                        <th>사번</th>
                        <td>${loginUser.empNo }</td>
                        <th>신청시간</th>
                        <td>
                         <div class="col-6">
                        <input type="time" class="form-control"name="startTime">-<input type="time" class="form-control" name="endTime" >
                        </div>
                        </td>
                    </tr>
                    <tr>
                        <th>부서</th>
                        <td>${loginUser.deptName }</td>
                        <th>신청사유</th>
                        <td>
                        	<input type="text" class="form-control" name="cause">
                        </td>
                    </tr>
                    <tr>
                        <th>직급</th>
                        <td>${loginUser.jobName}</td>
                    </tr>
                </table>
            
            </form>
            <br><br>
            <div class="btn-area" align="center">
                <button type="submit" class="btn btn-sm btn-primary">제출하기</button>
                <button type="button" class="btn btn-sm btn-light">이전으로</button>
            </div>


        </div>
        <br>
        


    </div>
</body>
</html>