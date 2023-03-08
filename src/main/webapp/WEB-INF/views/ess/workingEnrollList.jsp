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
    /* 메뉴바영역 */
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
    .enrollList{
        margin-left:30px;
        margin-right: 30px;
        margin-top: 30px;
        font-size: 14px;
        color:rgb(50,50,50);
    }
    .select-area input[type=date]{
        width:110px;
        height:30px;
        border:1px solid rgb(170, 170, 170);
        border-radius: 5px;
        font-size: 14px;
        color:rgb(50, 50, 50);
    }
    .select-area button{
        width:60px;
        height:30px;
        font-size: 12px;
        line-height:5px;
        margin-bottom: 3px;
    }
    .businessTable, .overTable{
        width:100%;
        border-top:1px solid rgb(234, 234, 234);
        text-align: center;
        font-size: 14px;
        border-top:1px solid rgb(234, 234, 234);
    }
    .businessTable td, .overTable td{
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
    .enrollList input[type=text]{
        width:100px;
        height:20px;
        text-align: center;
        border:none;
    }
    .businessList, .overList{
        height:350px;
    }
    .businessTable button, .overTable button{
        width:60px;
        height:30px;
        font-size: 12px;
        line-height:5px;
        color:white;
    }
</style>
</head>
<body>
    <div class="outer">

        <div class="title">
            <h3 style="color:rgb(50,50,50); font-weight: 600;">신청<h3> 
        </div>
        <br>
        <div class="selectBar">
            <span>&nbsp;출장신청</span>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span>시간외 근무신청</span> 
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span>신청상세</span>
            <br>
            <div style="width:223px; background: rgb(234, 234, 234);">&nbsp;</div>
            <div style="width:67px; background: rgb(170, 170, 170);">&nbsp;</div>
            <div style="width:610px; background: rgb(234, 234, 234);">&nbsp;</div>
        </div>

        <div class="enrollList">
            <div class="select-area" style="float:right">
                <input type="date" name="startDate" value="">
                <span style="font-size: 20px; color:rgb(170, 170, 170)">~</span>
                <input type="date" name="endDate" value="">
                <button type="button" class="btn btn-success" onclick="">검색</button>
            </div>
            <br><br>
            <div class="businessList">
                <span style="font-size: 15px;font-weight: 600;">출장신청</span>
                <input type="text" name="" value="3" style="font-size:15px; color:rgb(0,172,0);font-weight: 600;border:none; text-align: left;">
                <br><br>
                <table class="businessTable">
                    <tr style="font-weight: 600; height:30px; background-color: rgba(0, 172, 0, 0.219);">
                        <td width="120px">이름</td>
                        <td width="120px;">부서명</td>
                        <td width="120px;">신청종류</td>
                        <td width="300px;">일자</td>
                        <td width="180px;">결재현황</td>
                        <td width="70"></td>
                    </tr>
                    <tr>
                        <td>김정만</td>
                        <td>인사1팀</td>
                        <td>출장</td>
                        <td>
                            <input type="text" name="" value="2023.03.04">
                            <span style="font-size: 15px;font-weight: 600;">~</span>
                            <input type="text" name="" value="2023.03.05">
                        </td>
                        <td>결재대기(1차)</td>
                        <td><button class="btn btn-warning">취소</button></td>
                    </tr>
                    <tr>
                        <td>김정만</td>
                        <td>인사1팀</td>
                        <td>출장</td>
                        <td>
                            <input type="text" name="" value="2023.03.04">
                            <span style="font-size: 15px;font-weight: 600;">~</span>
                            <input type="text" name="" value="2023.03.05">
                        </td>
                        <td>결재대기(1차)</td>
                        <td><button class="btn btn-warning">취소</button></td>
                    </tr>
                    <tr>
                        <td>김정만</td>
                        <td>인사1팀</td>
                        <td>출장</td>
                        <td>
                            <input type="text" name="" value="2023.03.04">
                            <span style="font-size: 15px;font-weight: 600;">~</span>
                            <input type="text" name="" value="2023.03.05">
                        </td>
                        <td>결재대기(1차)</td>
                        <td><button class="btn btn-warning">취소</button></td>
                    </tr>
                    <tr>
                        <td>김정만</td>
                        <td>인사1팀</td>
                        <td>출장</td>
                        <td>
                            <input type="text" name="" value="2023.03.04">
                            <span style="font-size: 15px;font-weight: 600;">~</span>
                            <input type="text" name="" value="2023.03.05">
                        </td>
                        <td>결재대기(1차)</td>
                        <td><button class="btn btn-warning">취소</button></td>
                    </tr>
                    <tr>
                        <td>김정만</td>
                        <td>인사1팀</td>
                        <td>출장</td>
                        <td>
                            <input type="text" name="" value="2023.03.04">
                            <span style="font-size: 15px;font-weight: 600;">~</span>
                            <input type="text" name="" value="2023.03.05">
                        </td>
                        <td>결재대기(1차)</td>
                        <td><button class="btn btn-warning">취소</button></td>
                    </tr>
                </table>

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

            <br><br>

            <div class="overList">
                <span style="font-size: 15px;font-weight: 600;">시간외 근무신청</span>
                <input type="text" name="" value="3" style="font-size:15px; color:rgb(0,172,0);font-weight: 600;border:none; text-align: left;">
                <br><br>
                <table class="overTable">
                    <tr style="font-weight: 600; height:30px; background-color: rgba(0, 172, 0, 0.219);">
                        <td width="120px">이름</td>
                        <td width="120px;">부서명</td>
                        <td width="120px;">신청종류</td>
                        <td width="300px;">일자</td>
                        <td width="180px;">결재현황</td>
                        <td width="70"></td>
                    </tr>
                    <tr>
                        <td>김정만</td>
                        <td>인사1팀</td>
                        <td>시간외근무</td>
                        <td><input type="text" name="" value="2023.03.05"></td>
                        <td>결재대기(1차)</td>
                        <td><button class="btn btn-warning">취소</button></td>
                    </tr>
                    <tr>
                        <td>김정만</td>
                        <td>인사1팀</td>
                        <td>시간외근무</td>
                        <td><input type="text" name="" value="2023.03.05"></td>
                        <td>결재대기(1차)</td>
                        <td><button class="btn btn-warning">취소</button></td>
                    </tr>
                    <tr>
                        <td>김정만</td>
                        <td>인사1팀</td>
                        <td>시간외근무</td>
                        <td><input type="text" name="" value="2023.03.05"></td>
                        <td>결재대기(1차)</td>
                        <td><button class="btn btn-warning">취소</button></td>
                    </tr>
                    <tr>
                        <td>김정만</td>
                        <td>인사1팀</td>
                        <td>시간외근무</td>
                        <td><input type="text" name="" value="2023.03.05"></td>
                        <td>결재대기(1차)</td>
                        <td><button class="btn btn-warning">취소</button></td>
                    </tr>
                    <tr>
                        <td>김정만</td>
                        <td>인사1팀</td>
                        <td>시간외근무</td>
                        <td><input type="text" name="" value="2023.03.05"></td>
                        <td>결재대기(1차)</td>
                        <td><button class="btn btn-warning">취소</button></td>
                    </tr>
                </table>

                <script>
                    $(function(){
                        $(".businessTable>tbody button").click(function(){
                            if(confirm("신청을 취소하시겠습니까?")){
                                location.href = 'delete.bt?no=' + ''
                            }
                        });

                        $(".overTable>tbody button").click(function(){
                            if(confirm("신청을 취소하시겠습니까?")){
                                location.href = 'delete.ot?no=' + ''
                            }
                        })

                        
                    })
                </script>

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

    </div>
</body>
</html>