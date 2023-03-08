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
    .work-area>span{
        color:rgb(51,51,51);
        font-size: 17px;
        font-weight: 600;
    }
    .workTable{
        width:900px;
        text-align: center;
        margin-top:30px;
        border-collapse: collapse;
        border-spacing: 0;
        font-size: 14px;
        border:1px solid rgb(170, 170, 170);
    }
    .workTable td{
        width:182px;
        height:30px;
        color:rgb(50,50,50);
        border-bottom: 1px solid rgb(234, 234, 234);
    }
    .workSelect button{
        width:60px;
        height:30px;
        border-radius: 5px;
        line-height: 5px;
        font-size: 14px;
    }
    .workSelect input[type=text]{
        width:150px;
        height:28px;
        border-radius: 5px;
        border:1px solid rgb(170, 170, 170);
        font-size:14px;
    }
    .workSelect select{
        width:100px;
        height:30px;
        border-radius: 5px;
        border:1px solid rgb(170, 170, 170);
        font-size:14px;
    }
    .paging-area button{
        width:30px;
        height:30px;
        border:none;
        border-radius: 5px;
    }
    #deleteBtn button{
        width:60px;
        height:30px;
        border-radius: 5px;
        line-height: 5px;
        font-size: 14px;
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
            <div style="width:260px; background: rgb(234, 234, 234);">&nbsp;</div>
            <div style="width:67px; background: rgb(170, 170, 170);">&nbsp;</div>
            <div style="width:573px; background: rgb(234, 234, 234);">&nbsp;</div>
        </div>

        <div class="work-area">

            <span>출퇴근 시간 변경</span> <br>
            <div class="workSelect" style="float:right;">
                <select name="" id="">
                    <option value="">&nbsp;-선택안함-&nbsp;</option>
                    <option value="">결재대기(1차)</option>
                    <option value="">결재대기(2차)</option>
                    <option value="">승인</option>
                    <option value="">반려</option>
                </select>
                <input type="text" name="" value="" placeholder="&nbsp;사원명/사원번호">
                <button type="button" class="btn btn-success">검색</button>
            </div>

            <br>

            <table class="workTable" border="1">
                <thead>
                        <tr style="color:rgb(51,51,51); font-size: 14px; font-weight: 600; background: rgb(234, 234, 234);">
                            <td><input type="checkbox" name="" value="" id="cBox"></td>
                            <td>사번</td>
                            <td>소속</td>
                            <td>직위</td>
                            <td>이름</td>
                            <td>조정일</td>
                            <td>제목</td>
                            <td>진행상황</td>
                        </tr>
                    </thead>
                    
                    <tbody>
                        <tr>
                            <td><input type="checkbox" name="ck" value=""></td>
                            <td>4505301111</td>
                            <td>개발1팀</td>
                            <td>사원</td>
                            <td>김정만</td>
                            <td>2023.03.05</td>
                            <td>출근시간변경</td>
                            <td>결재대기(1차)</td>
                        </tr>
                        <tr>
                            <td><input type="checkbox"></td>
                            <td>4505301111</td>
                            <td>개발2팀</td>
                            <td>대리</td>
                            <td>김정만</td>
                            <td>2023.03.05</td>
                            <td>출근시간변경</td>
                            <td>결재대기(2차)</td>
                        </tr>
                        <tr>
                            <td><input type="checkbox"></td>
                            <td>4505301111</td>
                            <td>인사1팀</td>
                            <td>과장</td>
                            <td>김정만</td>
                            <td>2023.03.05</td>
                            <td>출근시간변경</td>
                            <td>승인</td>
                        </tr>
                        <tr>
                            <td><input type="checkbox"></td>
                            <td>4505301111</td>
                            <td>인사2팀</td>
                            <td>차장</td>
                            <td>김정만</td>
                            <td>2023.03.05</td>
                            <td>출근시간변경</td>
                            <td>반려</td>
                        </tr>
                        <tr>
                            <td><input type="checkbox"></td>
                            <td>4505301111</td>
                            <td>총무1팀</td>
                            <td>상무</td>
                            <td>김정만</td>
                            <td>2023.03.05</td>
                            <td>출근시간변경</td>
                            <td>결재대기(1차)</td>
                        </tr>
                        <tr>
                            <td><input type="checkbox"></td>
                            <td>4505301111</td>
                            <td>총무2팀</td>
                            <td>사원</td>
                            <td>김정만</td>
                            <td>2023.03.05</td>
                            <td>출근시간변경</td>
                            <td>결재대기(1차)</td>
                        </tr>
                        <tr>
                            <td><input type="checkbox"></td>
                            <td>4505301111</td>
                            <td>개발부</td>
                            <td>사원</td>
                            <td>김정만</td>
                            <td>2023.03.05</td>
                            <td>출근시간변경</td>
                            <td>결재대기(1차)</td>
                        </tr>
                        <tr>
                            <td><input type="checkbox"></td>
                            <td>4505301111</td>
                            <td>개발부</td>
                            <td>사원</td>
                            <td>김정만</td>
                            <td>2023.03.05</td>
                            <td>출근시간변경</td>
                            <td>결재대기(1차)</td>
                        </tr>
                        <tr>
                            <td><input type="checkbox"></td>
                            <td>4505301111</td>
                            <td>개발부</td>
                            <td>사원</td>
                            <td>김정만</td>
                            <td>2023.03.05</td>
                            <td>출근시간변경</td>
                            <td>결재대기(1차)</td>
                        </tr>
                        <tr>
                            <td><input type="checkbox"></td>
                            <td>4505301111</td>
                            <td>개발부</td>
                            <td>사원</td>
                            <td>김정만</td>
                            <td>2023.03.05</td>
                            <td>출근시간변경</td>
                            <td>결재대기(1차)</td>
                        </tr>
                    </tbody>
            </table>
            <br>
        <button class="btn btn-danger" style="float: right; width:60px; height:30px; line-height: 5px; font-size:14px;">삭제</button>
        </div>

        <script>
            $(function(){
                $("#checkB").click(function(){
                    if($("#checkB").is(":checked")){
                        $("input[name=ck]").attr("checked", true);
                    } else $("input[name=ck]").removeAttr("checked");
                    
                    
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
</body>
</html>