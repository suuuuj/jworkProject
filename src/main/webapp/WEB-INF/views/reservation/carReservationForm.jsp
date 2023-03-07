<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<style>
     #pagingArea{width:fit-content;margin:auto;}
     div{box-sizing: border-box;}
    #cfRoom-enrollForm th{
        height: 50px;
    }
    .outer{
        width: 960px;
    }
    #cfRoom-enrollForm th, td ,#car-information tr, td{
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
        <div>
            <h4>차량정보</h4>
            <hr>
            <table id="car-information">
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
                <img src="//bit.ly/2GrygUe" width="200px" height="140px"> 
            </div>
            <form action="">
                <table id="cfRoom-enrollForm" >
                  
                    <tr>
                        <th>사원명</th>
                        <td>정여진</td>
                        <th>신청날짜</th>
                        <td><input type="date"></td>
                    </tr>
                    <tr>
                        <th>사번</th>
                        <td>123123</td>
                        <th>신청시간</th>
                        <td><input type="time" name="" >-<input type="time" name="" ></td>
                    </tr>
                    <tr>
                        <th>부서</th>
                        <td>총무부</td>
                        <th>신청사유</th>
                        <td><input type="text" name=""></td>
                    </tr>
                    <tr>
                        <th>직급</th>
                        <td>대리</td>
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