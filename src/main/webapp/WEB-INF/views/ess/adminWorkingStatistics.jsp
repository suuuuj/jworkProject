<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- 부트스트랩 -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<!-- jquery CDN -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<title>Insert title here</title>
<style>
    /* outer영역 */
    .workOuter{
        padding:50px;
        margin: auto;
    }
    /* content영역 */
    .work-area{
        margin-top: 30px;
    }
    .timeTable{
        margin:auto;
        text-align: center;
        width:850px;
        border-top:1px solid rgb(234, 234, 234);
        border-bottom:1px solid rgb(234, 234, 234);
        border-left:1px solid rgb(234, 234, 234);
    }
    .timeTable td{
        border-right: 1px solid rgb(234, 234, 234);
        height:30px;
    }
    .timeTable>thead td{
        width:225px;
        padding-top: 15px;
        color:rgba(50, 50, 50);
        font-size: 15px;
    }
    .timeTable>tbody td{
        padding-bottom: 15px;
        color:rgb(0, 172, 0);
        font-size: 25px;
        font-weight: 600;
    }
    .workSelect select{
        width:100px;
        height:30px;
        border-radius: 5px;
        border:1px solid rgb(170, 170, 170);
        font-size: 14px;
        color:rgb(50,50,50);
    }
    .workSelect input[type=text]{
        width:150px;
        height:28px;
        border-radius: 5px;
        border:1px solid rgb(170, 170, 170);
    }
    .workSelect button{
        width:100px;
        height:30px;
        font-size: 14px;
        line-height: 5px;
        margin-bottom:3px;
    }
    .workSelect>div{
        display: inline-block;
    }
    .workTable{
        width:100%;
        text-align: center;
        margin-top:30px;
        border-collapse: collapse;
        border-spacing: 0;
        font-size: 14px;
        color:rgb(51,51,51);
    }
    .workTable td{
        width:182px;
        height:30px;
        color:rgb(50,50,50);
        border-bottom: 1px solid rgb(234, 234, 234);
    }
    .paging-area button{
        width:30px;
        height:30px;
        border:none;
        border-radius: 5px;
    }
</style>
</head>
<body>
    <jsp:include page = "../common/menubar.jsp" />
    <div class="workOuter">

        <h4><b>근무</b></h4>
        <div class="work-area">

            <div class="workSelect">
                <select name="" id="deptBox" title="부서명">
                    <option value="">&nbsp;- 부서명 -</option>
                    <option value="">&nbsp;인사부</option>
                    <option value="">&nbsp;총무부</option>
                    <option value="">&nbsp;개발부</option>
                </select>
                <button type="button" class="btn btn-secondary">전사원통계</button>
                <!--
                <select name="" id="" title="직급명">
                    <option value="">사원</option>
                    <option value="">대리</option>
                    <option value="">과장</option>
                    <option value="">차장</option>
                    <option value="">부장</option>
                    <option value="">상무</option>
                </select>
                -->
            </div>

            <br>

            <div class="workingTime">
                <table class="timeTable">
                    <thead>
                        <tr>
                            <td>이번주 누적</td>
                            <td>이번주 초과</td>
                            <td>이번주 잔여</td>
                            <td>이번달 누적</td>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>32시간 00분</td>
                            <td>3시간 23분</td>
                            <td>20시간 00분</td>
                            <td>86시간 36분</td>
                        </tr>
                    </tbody>
                </table>
            </div>

            <div class="workList">
                





        </div>













    </div>
</body>
</html>