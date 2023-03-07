<%@ page language="java" contentType=`"text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- 부트스트랩 -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">

<title>Insert title here</title>
<style>
    /* outer영역 */
    .outer{
        width:960px;
        height:1000px;
        border:1px solid black;
    }

    /* 메뉴바 */
    .title{
        color:rgb(50,50,50);
        margin-left: 30px;
        margin-top:30px;
    }
    .selectBar{
        margin-left: 30px;
    }
    .selectBar>span{
        color:rgba(50, 50, 50, 0.79);
        font-size:15px;
        font-weight: 600;
    }
    .selectBar>div{
        margin-top:10px;
        height:3px;
        float: left;
    }
    /* content영역 */
    .work-area{
        margin-left:30px;
        margin-right: 30px;
        margin-top: 30px;
    }
    .workSelect{
        color:rgba(50, 50, 50);
        font-size: 15px;
        font-weight: 600;
    }
    .workSelect button{
        width:50px;
        height:30px;
        font-size: 12px;
        line-height:normal;
    }
    .workSelect input[type=date]{
        width:100px;
        height:30px;
        border:1px solid rgb(170, 170, 170);
        color:rgb(50,50,50);
        border-radius: 3px;
    }
    .workTable{
        margin-top:30px;
    }
    .workTable>table{
        width:100%;
        border-top:1px solid rgb(234, 234, 234);
        text-align: center;
    }
    .workTable td{
        border-bottom: 1px solid rgb(234, 234, 234);
        color:rgb(50, 50, 50);
        height:30px;
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
    <div class="outer">

        <div class="title">
            <h3 style="color:rgb(50,50,50); font-weight: 600;">근무<h3> 
        </div>
        <br>
        <div class="selectBar">
            <span>&nbsp;근태현황</span>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span>근태이력</span> 
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span>근태수정</span> 
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:rgb(0, 172, 0)">근태조정</span>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:rgb(0, 172, 0)">근태관리</span>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:rgb(0, 172, 0)">근태통계</span>
            <br>
            <div style="width:83px; background: rgb(234, 234, 234);">&nbsp;</div>
            <div style="width:67px; background: rgb(170, 170, 170);">&nbsp;</div>
            <div style="width:741px; background: rgb(234, 234, 234);">&nbsp;</div>
        </div>

        <div class="work-area">

            <div class="workSelect">
                기간조회&nbsp;&nbsp;&nbsp;
                <input type="date" name="stDate" value="">
                <span style="font-size: 20px; color:rgb(170, 170, 170)">~</span>
                <input type="date" name="edDate">
                <button class="btn btn-success">검색</button>
                <br><br>
                근무상태&nbsp;&nbsp;&nbsp;
                    <input type="checkbox" id="" name="" value=""> <label for="">정상</label>
                    <input type="checkbox" id="" name="" value=""> <label for="">지각</label>
                    <input type="checkbox" id="" name="" value=""> <label for="">조퇴</label>
                    <input type="checkbox" id="" name="" value=""> <label for="">결근</label>
                
            </div>

            <div class="workTable">
                <table>
                    <tr style="font-size: 15px; font-weight: 600; height:30px; background-color: rgba(0, 172, 0, 0.219);">
                        <td width="182px;">날짜</td>
                        <td width="182px;">근무상태</td>
                        <td width="182px;">출근시간</td>
                        <td width="182px;">퇴근시간</td>
                        <td width="182px;">총근무시간</td>
                    </tr>
                    <tr>
                        <td>0223.02.20</td>
                        <td>정상</td>
                        <td>08:55:03</td>
                        <td>18:03:55</td>
                        <td>08:09:00</td>
                    </tr>
                    <tr>
                        <td>0223.02.20</td>
                        <td>정상</td>
                        <td>08:55:03</td>
                        <td>18:03:55</td>
                        <td>08:09:00</td>
                    </tr>
                    <tr>
                        <td>0223.02.20</td>
                        <td>정상</td>
                        <td>08:55:03</td>
                        <td>18:03:55</td>
                        <td>08:09:00</td>
                    </tr>
                    <tr>
                        <td>0223.02.20</td>
                        <td>정상</td>
                        <td>08:55:03</td>
                        <td>18:03:55</td>
                        <td>08:09:00</td>
                    </tr>
                    <tr>
                        <td>0223.02.20</td>
                        <td>정상</td>
                        <td>08:55:03</td>
                        <td>18:03:55</td>
                        <td>08:09:00</td>
                    </tr>
                    <tr>
                        <td>0223.02.20</td>
                        <td>정상</td>
                        <td>08:55:03</td>
                        <td>18:03:55</td>
                        <td>08:09:00</td>
                    </tr>
                    <tr>
                        <td>0223.02.20</td>
                        <td>정상</td>
                        <td>08:55:03</td>
                        <td>18:03:55</td>
                        <td>08:09:00</td>
                    </tr>
                    <tr>
                        <td>0223.02.20</td>
                        <td>정상</td>
                        <td>08:55:03</td>
                        <td>18:03:55</td>
                        <td>08:09:00</td>
                    </tr>
                    <tr>
                        <td>0223.02.20</td>
                        <td>정상</td>
                        <td>08:55:03</td>
                        <td>18:03:55</td>
                        <td>08:09:00</td>
                    </tr>
                    <tr>
                        <td>0223.02.20</td>
                        <td>정상</td>
                        <td>08:55:03</td>
                        <td>18:03:55</td>
                        <td>08:09:00</td>
                    </tr>
                </table>
            </div>
            <br><br>
            <div class="paging-area" style="text-align:center;">
                <button><</button>
                <button>1</button>
                <button>2</button>
                <button>3</button>
                <button>4</button>
                <button>5</button>
                <button>></button>
            </div>










        </div>



    </div>
</body>
</html>