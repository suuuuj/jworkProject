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
    .vacation{
        margin-left:30px;
        margin-right: 30px;
        margin-top: 30px;
    }
    .select-area{
        margin-top: 30px;
    }
    .select-area input{
        width:150px;
        height:30px;
        border-radius: 5px;
        border:1px solid rgb(170, 170, 170);
        font-size: 14px;
    }
    .select-area button{
        width:60px;
        height:30px;
        border:none;
        border-radius: 5px;
        line-height: 5px;
        font-size: 14px;
    }
    .select-area select{
        width:150px;
        height:30px;
        border:1px solid rgb(170, 170, 170);
        border-radius: 5px;
        color:rgb(50,50,50);
        font-weight: 500;
        font-size: 14px;
    }
    .select-area>div{
        display: inline-block;
    }
    .vacationTable{
        width:100%;
        text-align: center;
        border-collapse: collapse;
        border-spacing: 0;
        margin-top:30px;
        font-size: 14px;
        color:rgb(50,50,50);
    }
    .vacationTable>tbody td:hover{
        opacity: 0.7;
        cursor: pointer;
    }
    .vacationTable td{
        border-bottom: 1px solid rgb(234, 234, 234);
        height:30px;
    }
    .list-area input{
        border:none;
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
            <h3 style="color:rgb(50,50,50); font-weight: 600;">휴가<h3> 
        </div>
        <br>
        <div class="selectBar">
            <span>&nbsp;휴가등록</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span>휴가상세</span> 
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:rgb(0, 172, 0)">휴가관리</span>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:rgb(0, 172, 0)">휴가내역</span>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:rgb(0, 172, 0)">전체휴가일정</span>
            <br>
            <div style="width:170px; background: rgb(234, 234, 234);">&nbsp;</div>
            <div style="width:67px; background: rgb(170, 170, 170);">&nbsp;</div>
            <div style="width:663px; background: rgb(234, 234, 234);">&nbsp;</div>
        </div>

        <div class="vacation">

            <div class="select-area">
                <select name="" id="">
                    <option value="">&nbsp;- 휴가선택 -</option>
                    <option value="">&nbsp;연차</option>
                    <option value="">&nbsp;보건</option>
                    <option value="">&nbsp;조의</option>
                    <option value="">&nbsp;결혼</option>
                    <option value="">&nbsp;산전후</option>
                    <option value="">&nbsp;리프레쉬휴가</option>
                </select>
                <select name="" id="">
                    <option value="">&nbsp;결재대기(1차)</option>
                    <option value="">&nbsp;결재대기(2차)</option>
                    <option value="">&nbsp;승인</option>
                    <option value="">&nbsp;반려</option>
                </select>
                <div style="float:right;">
                    <input type="text" name="" value="" placeholder="&nbsp;사원명/사원번호">
                    <button type="button" class="btn btn-success">검색</button>
                </div>
            </div>
            <br>
            <div class="list-area">
                <table class="vacationTable">
                    <thead>
                        <tr style="font-weight: 600; background: rgb(234, 234, 234);">
                            <td width="90px;">문서번호</td>
                            <td width="120px;">사번</td>
                            <td width="120px;">소속</td>
                            <td width="120px;">직위</td>
                            <td width="120px;">이름</td>
                            <td width="120px;">조정일</td>
                            <td width="130px;">제목</td>
                            <td width="190px;">진행상황</td>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>56</td>
                            <td>4505301111</td>
                            <td>개발부</td>
                            <td>사원</td>
                            <td>김정만</td>
                            <td>조정시작일</td>
                            <td>휴가카테고리</td>
                            <td>결재대기(1차)</td>
                        </tr>
                        <tr>
                            <td>56</td>
                            <td>4505301111</td>
                            <td>개발부</td>
                            <td>사원</td>
                            <td>김정만</td>
                            <td>조정시작일</td>
                            <td>휴가카테고리</td>
                            <td>결재대기(2차)</td>
                        </tr>
                        <tr>
                            <td>56</td>
                            <td>4505301111</td>
                            <td>개발부</td>
                            <td>사원</td>
                            <td>김정만</td>
                            <td>조정시작일</td>
                            <td>휴가카테고리</td>
                            <td>승인</td>
                        </tr>
                        <tr>
                            <td>56</td>
                            <td>4505301111</td>
                            <td>개발부</td>
                            <td>사원</td>
                            <td>김정만</td>
                            <td>조정시작일</td>
                            <td>휴가카테고리</td>
                            <td>반려</td>
                        </tr>
                        <tr>
                            <td>56</td>
                            <td>4505301111</td>
                            <td>개발부</td>
                            <td>사원</td>
                            <td>김정만</td>
                            <td>조정시작일</td>
                            <td>휴가카테고리</td>
                            <td>결재대기(1차)</td>
                        </tr>
                        <tr>
                            <td>56</td>
                            <td>4505301111</td>
                            <td>개발부</td>
                            <td>사원</td>
                            <td>김정만</td>
                            <td>조정시작일</td>
                            <td>휴가카테고리</td>
                            <td>결재대기(2차)</td>
                        </tr>
                        <tr>
                            <td>56</td>
                            <td>4505301111</td>
                            <td>개발부</td>
                            <td>사원</td>
                            <td>김정만</td>
                            <td>조정시작일</td>
                            <td>휴가카테고리</td>
                            <td>승인</td>
                        </tr>
                        <tr>
                            <td>56</td>
                            <td>4505301111</td>
                            <td>개발부</td>
                            <td>사원</td>
                            <td>김정만</td>
                            <td>조정시작일</td>
                            <td>휴가카테고리</td>
                            <td>반려</td>
                        </tr>
                        <tr>
                            <td>56</td>
                            <td>4505301111</td>
                            <td>개발부</td>
                            <td>사원</td>
                            <td>김정만</td>
                            <td>조정시작일</td>
                            <td>휴가카테고리</td>
                            <td>결재대기(1차)</td>
                        </tr>
                        <tr>
                            <td>56</td>
                            <td>4505301111</td>
                            <td>개발부</td>
                            <td>사원</td>
                            <td>김정만</td>
                            <td>조정시작일</td>
                            <td>휴가카테고리</td>
                            <td>결재대기(2차)</td>
                        </tr>
                        <tr>
                            <td>56</td>
                            <td>4505301111</td>
                            <td>개발부</td>
                            <td>사원</td>
                            <td>김정만</td>
                            <td>조정시작일</td>
                            <td>휴가카테고리</td>
                            <td>승인</td>
                        </tr>
                        <tr>
                            <td>56</td>
                            <td>4505301111</td>
                            <td>개발부</td>
                            <td>사원</td>
                            <td>김정만</td>
                            <td>조정시작일</td>
                            <td>휴가카테고리</td>
                            <td>반려</td>
                        </tr>
                        <tr>
                            <td>56</td>
                            <td>4505301111</td>
                            <td>개발부</td>
                            <td>사원</td>
                            <td>김정만</td>
                            <td>조정시작일</td>
                            <td>휴가카테고리</td>
                            <td>결재대기(1차)</td>
                        </tr>
                        <tr>
                            <td>56</td>
                            <td>4505301111</td>
                            <td>개발부</td>
                            <td>사원</td>
                            <td>김정만</td>
                            <td>조정시작일</td>
                            <td>휴가카테고리</td>
                            <td>결재대기(2차)</td>
                        </tr>
                        <tr>
                            <td>56</td>
                            <td>4505301111</td>
                            <td>개발부</td>
                            <td>사원</td>
                            <td>김정만</td>
                            <td>조정시작일</td>
                            <td>휴가카테고리</td>
                            <td>승인</td>
                        </tr>
                    </tbody>
                </table>
            </div>

            <script>
                $(function(){
                    $("list-area table>tr").click = location.href="detail.le?no=" + $(this).children().eq(0).text();
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
</body>
</html>