<%@ page language="java" contentType=`"text/html; charset=UTF-8"
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
    .workSelect select{
        width:80px;
        height:30px;
        border-radius: 5px;
        border:1px solid rgb(170, 170, 170);
    }
    .workSelect input[type=text]{
        width:150px;
        height:30px;
        border-radius: 5px;
        border:1px solid rgb(170, 170, 170);
    }
    .workSelect button{
        width:60px;
        height:30px;
        border-radius: 5px;
        line-height: 5px;
        font-size: 14px;
        margin-bottom: 3px;
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
    .workList>div{
        display: inline-block;
    }
    .workDay{
        box-sizing: border-box;
        width:100%;
        height:30px;
        margin-left:340px;
    }
    .workDay input{
        border:none;
        text-align: center;
        color:rgb(0, 172, 0);
        font-size: 18px;
        font-weight: 600;
        width:160px;
    }
    #daycheck{
        border:none;
        background-color: white;
        color:rgb(50,50,50);
        font-size: 20px;
        font-weight: 900;
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
            <div style="width:346px; background: rgb(234, 234, 234);">&nbsp;</div>
            <div style="width:67px; background: rgb(170, 170, 170);">&nbsp;</div>
            <div style="width:487px; background: rgb(234, 234, 234);">&nbsp;</div>
        </div>

        <div class="work-area">

            <div class="workSelect">
                <div style="margin-top: 5px;">
                    근무상태&nbsp;&nbsp;&nbsp;
                    <input type="checkbox" id="" name="" value=""> <label for="">정상</label>
                    <input type="checkbox" id="" name="" value=""> <label for="">지각</label>
                    <input type="checkbox" id="" name="" value=""> <label for="">조퇴</label>
                    <input type="checkbox" id="" name="" value=""> <label for="">결근</label>
                </div>
                <div style="float:right">
                        <select name="dept" id="">
                            <option value="">인사부</option>
                            <option value="">총무부</option>
                            <option value="">개발부</option>
                        </select>
                        <select name="" id="">
                            <option value="">사원</option>
                            <option value="">대리</option>
                            <option value="">과장</option>
                            <option value="">차장</option>
                            <option value="">부장</option>
                            <option value="">상무</option>
                        </select>
                        <input type="text" name="" value="" placeholder="&nbsp;사원명/사원번호">
                        <button type="button" class="btn btn-success">검색</button>
                </div>
                
            </div>

            <br><br>

            <div class="workList">
                <div class="workDay">
                    <form action="">
                        <button type="button" id="daycheck"><</button>
                        <input type="text" name="" value="2023.03.06">
                        <button type="button" id="daycheck">></button>&nbsp;&nbsp;

                        <button type="button" onclick="$('#dataBtn').click();">클릭</button>
                        <input type="date" id="dateBtn" name="" value="" style="display:none">
                    </form>
                </div>

                <br><br>
                
                <table class="workTable">
                    <thead>
                            <tr style="font-weight: 600; background: rgb(234, 234, 234);">
                                <td width="120px;">사번</td>
                                <td width="120px;">소속</td>
                                <td width="120px;">직위</td>
                                <td width="120px;">이름</td>
                                <td width="120px;">출근시간</td>
                                <td width="160px;">퇴근시간</td>
                                <td width="160px;">총근무시간</td>
                                <td width="90px;">근무상태</td>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>4505301111</td>
                                <td>인사1팀</td>
                                <td>사원</td>
                                <td>김정만</td>
                                <td>07:55:53</td>
                                <td>18:05:07</td>
                                <td>08:00:00</td>
                                <td>정상</td>
                            </tr>
                            <tr>
                                <td>4505301111</td>
                                <td>인사1팀</td>
                                <td>사원</td>
                                <td>김정만</td>
                                <td>07:55:53</td>
                                <td>18:05:07</td>
                                <td>08:00:00</td>
                                <td>정상</td>
                            </tr>
                            <tr>
                                <td>4505301111</td>
                                <td>인사1팀</td>
                                <td>사원</td>
                                <td>김정만</td>
                                <td>07:55:53</td>
                                <td>18:05:07</td>
                                <td>08:00:00</td>
                                <td>정상</td>
                            </tr>
                            <tr>
                                <td>4505301111</td>
                                <td>인사1팀</td>
                                <td>사원</td>
                                <td>김정만</td>
                                <td>07:55:53</td>
                                <td>18:05:07</td>
                                <td>08:00:00</td>
                                <td>정상</td>
                            </tr>
                            <tr>
                                <td>4505301111</td>
                                <td>인사1팀</td>
                                <td>사원</td>
                                <td>김정만</td>
                                <td>07:55:53</td>
                                <td>18:05:07</td>
                                <td>08:00:00</td>
                                <td>정상</td>
                            </tr>
                            <tr>
                                <td>4505301111</td>
                                <td>인사1팀</td>
                                <td>사원</td>
                                <td>김정만</td>
                                <td>07:55:53</td>
                                <td>18:05:07</td>
                                <td>08:00:00</td>
                                <td>정상</td>
                            </tr>
                            <tr>
                                <td>4505301111</td>
                                <td>인사1팀</td>
                                <td>사원</td>
                                <td>김정만</td>
                                <td>07:55:53</td>
                                <td>18:05:07</td>
                                <td>08:00:00</td>
                                <td>정상</td>
                            </tr>
                            <tr>
                                <td>4505301111</td>
                                <td>인사1팀</td>
                                <td>사원</td>
                                <td>김정만</td>
                                <td>07:55:53</td>
                                <td>18:05:07</td>
                                <td>08:00:00</td>
                                <td>정상</td>
                            </tr>
                            <tr>
                                <td>4505301111</td>
                                <td>인사1팀</td>
                                <td>사원</td>
                                <td>김정만</td>
                                <td>07:55:53</td>
                                <td>18:05:07</td>
                                <td>08:00:00</td>
                                <td>정상</td>
                            </tr>
                            <tr>
                                <td>4505301111</td>
                                <td>인사1팀</td>
                                <td>사원</td>
                                <td>김정만</td>
                                <td>07:55:53</td>
                                <td>18:05:07</td>
                                <td>08:00:00</td>
                                <td>정상</td>
                            </tr>
                        </tbody>
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