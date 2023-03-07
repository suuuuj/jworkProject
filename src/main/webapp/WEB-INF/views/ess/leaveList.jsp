<%@ page language="java" contentType=`"text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- 부트스트랩 -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<!-- Modal -->
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.3/dist/jquery.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>

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
    .vacation{
        margin-left:30px;
        margin-right: 30px;
        margin-top: 30px;
    }
    select{
        width:150px;
        height:30px;
        border:1px solid rgb(170, 170, 170);
        border-radius: 5px;
        color:rgb(50,50,50);
        font-size: 14px;
    }
    .select-area input{
        width:100px;
        height:30px;
        border:1px solid rgb(170, 170, 170);
        border-radius: 5px;
        color:rgb(50,50,50);
        font-size: 14px;
    }
    .select-area button{
        width:50px;
        height:30px;
        font-size: 12px;
        line-height:normal;
    }
    .leaveTable{
        border-top: 1px solid rgb(234, 234, 234);
        width:100%;
        text-align: center;
    }
    .leaveTable td{
        border-bottom:1px solid rgb(234, 234, 234);
        height:30px;
        font-size: 14px;
        color:rgb(50,50,50);
    }
    .leaveTable input{
        border:none;
        height:30px;
        width:80px;
    }
    .paging-area button{
        width:30px;
        height:30px;
        border:none;
        border-radius: 5px;
        line-height:normal;
    }
    .leaveTable>tbody button{
        width:60px;
        height:30px;
        text-align: center;
        font-size: 12px;
        color:rgb(50,50,50);
        line-height:normal;
    }
    /* modal영역 */
    .modal-content{
        height:600px;
        width:400px;
        font-size: 14px;
    }
    .modal-body input{
        border:1px solid rgb(170, 170, 170);
        border-radius: 5px;
    }
    .modalS{
        display: inline-block;
        margin-bottom: 10px;
    }
    .modal-body textarea{
        resize: none;
        width:90%;
        height:260px;
        border:1px solid rgb(170, 170, 170);
        border-radius: 5px;
        padding:10px;
    }
    .textWrap{
        margin-left: 230px;
        margin-bottom: 5px;
        font-size: 13px;
        font-weight: 600;
        color:rgb(50,50,50)
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
            <span>&nbsp;휴가등록</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span>휴가상세</span> <br>
            <div style="width:78px; background: rgb(234, 234, 234);">&nbsp;</div>
            <div style="width:67px; background: rgb(170, 170, 170);">&nbsp;</div>
            <div style="width:766px; background: rgb(234, 234, 234);">&nbsp;</div>
        </div>

        <div class="vacation">

            <div class="select-area">
                <div style="float:left">
                    <select name="" id="">
                        <option value="">&nbsp;- 휴가선택-</option>
                        <option value="">&nbsp;연차</option>
                        <option value="">&nbsp;보건</option>
                        <option value="">&nbsp;조의</option>
                        <option value="">&nbsp;결혼</option>
                        <option value="">&nbsp;산전후</option>
                        <option value="">&nbsp;리프레쉬휴가</option>
                    </select>
                </div>

                <div style="float:right">
                    <input type="date" name="startDate" value="&nbsp;2023.03.05">
                    <span style="font-size: 20px; color:rgb(170, 170, 170)">~</span>
                    <input type="date" name="endDate" value="&nbsp;2023.03~12">
                    <button class="btn btn-success">검색</button>
                </div>
            </div>
            <br>

            <div class="vacationDetail">
                <br><br><br>
                <table class="leaveTable">
                    <thead>
                        <tr style="color:rgb(51,51,51); font-size: 14px; font-weight: 600; height:50px;">
                            <td width="100px;">이름</td>
                            <td width="100px;">부서명</td>
                            <td width="150px;">휴가종류</td>
                            <td width="300px;">사용기간</td>
                            <td width="150px;">결재현황</td>
                            <td width="110"></td>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>김정만</td>
                            <td>인사부</td>
                            <td>리프레쉬휴가</td>
                            <td>
                                <input type="text" name="stDate" value="2023.03.02">
                                <span>~&nbsp;&nbsp;&nbsp;</span>
                                <input type="text" name="edDate" value="2023.03.04">
                            </td>
                            <td>결재대기(1차)</td>
                            <td><button class="btn btn-warning">취소</button></td>
                        </tr>
                        <tr>
                            <td>김정만</td>
                            <td>인사부</td>
                            <td>리프레쉬휴가</td>
                            <td>
                                <input type="text" name="stDate" value="2023.03.02">
                                <span>~&nbsp;&nbsp;&nbsp;</span>
                                <input type="text" name="edDate" value="2023.03.04">
                            </td>
                            <td>결재대기(2차)</td>
                            <td><button class="btn btn-warning" disabled>취소</button></td>
                        </tr>
                        <tr>
                            <td>김정만</td>
                            <td>인사부</td>
                            <td>리프레쉬휴가</td>
                            <td>
                                <input type="text" name="stDate" value="2023.03.02">
                                <span>~&nbsp;&nbsp;&nbsp;</span>
                                <input type="text" name="edDate" value="2023.03.04">
                            </td>
                            <td>승인</td>
                            <td><button class="btn btn-warning" disabled>취소</button></td>
                        </tr>
                        <tr>
                            <td>김정만</td>
                            <td>인사부</td>
                            <td>리프레쉬휴가</td>
                            <td>
                                <input type="text" name="stDate" value="2023.03.02">
                                <span>~&nbsp;&nbsp;&nbsp;</span>
                                <input type="text" name="edDate" value="2023.03.04">
                            </td>
                            <td>반려</td>
                            <td><button class="btn btn-warning" disabled>취소</button></td>
                        </tr>
                        <tr>
                            <td>김정만</td>
                            <td>인사부</td>
                            <td>리프레쉬휴가</td>
                            <td>
                                <input type="text" name="stDate" value="2023.03.02">
                                <span>~&nbsp;&nbsp;&nbsp;</span>
                                <input type="text" name="edDate" value="2023.03.04">
                            </td>
                            <td>결재대기(1차)</td>
                            <td></td>
                        </tr>
                        <tr>
                            <td>김정만</td>
                            <td>인사부</td>
                            <td>리프레쉬휴가</td>
                            <td>
                                <input type="text" name="stDate" value="2023.03.02">
                                <span>~&nbsp;&nbsp;&nbsp;</span>
                                <input type="text" name="edDate" value="2023.03.04">
                            </td>
                            <td>결재대기(1차)</td>
                            <td></td>
                        </tr>
                        <tr>
                            <td>김정만</td>
                            <td>인사부</td>
                            <td>리프레쉬휴가</td>
                            <td>
                                <input type="text" name="stDate" value="2023.03.02">
                                <span>~&nbsp;&nbsp;&nbsp;</span>
                                <input type="text" name="edDate" value="2023.03.04">
                            </td>
                            <td>결재대기(1차)</td>
                            <td></td>
                        </tr>
                        <tr>
                            <td>김정만</td>
                            <td>인사부</td>
                            <td>리프레쉬휴가</td>
                            <td>
                                <input type="text" name="stDate" value="2023.03.02">
                                <span>~&nbsp;&nbsp;&nbsp;</span>
                                <input type="text" name="edDate" value="2023.03.04">
                            </td>
                            <td>결재대기(1차)</td>
                            <td></td>
                        </tr>
                        <tr
                        >
                            <td>김정만</td>
                            <td>인사부</td>
                            <td>리프레쉬휴가</td>
                            <td>
                                <input type="text" name="stDate" value="2023.03.02">
                                <span>~&nbsp;&nbsp;&nbsp;</span>
                                <input type="text" name="edDate" value="2023.03.04">
                            </td>
                            <td>결재대기(1차)</td>
                            <td></td>
                        </tr>
                        <tr
                        >
                            <td>김정만</td>
                            <td>인사부</td>
                            <td>리프레쉬휴가</td>
                            <td>
                                <input type="text" name="stDate" value="2023.03.02">
                                <span>~&nbsp;&nbsp;&nbsp;</span>
                                <input type="text" name="edDate" value="2023.03.04">
                            </td>
                            <td>결재대기(1차)</td>
                            <td></td>
                        </tr>
                    </tbody>
                </table>

                <script>
                    $(function(){
                        $(".leaveTable>tbody tr").click(function(){
                            $("#leaveModal").modal('show');
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

    <!-- The Modal -->
    <div class="modal fade" id="leaveModal">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">
        
                <!-- Modal Header -->
                <div class="modal-header">
                <h4 class="modal-title" style="color:rgb(0,172,0)">휴가신청</h4>
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                </div>
                
                <!-- Modal body -->
                <div class="modal-body" style="width:90%; margin:auto;">
                    <span class="modalS">휴가등록</span> 
                    &nbsp;&nbsp;&nbsp;&nbsp;<input type="text" name="" value="&nbsp;&nbsp;리프레쉬휴가" style="width:200px;" readonly><br>
                    <span class="modalS">신청날짜</span> <br>
                    <input type="text" name="stDate" value="&nbsp;&nbsp;2023.03.20" style="width:133px;" readonly>
                    <span>~</span>
                    <input type="text" name="edDate" value="&nbsp;&nbsp;2023.03.21" style="width:133px;" readonly>
                    <br><br>
                    <span>신청사유</span>
                    <br>
                    <div class="textWrap">
                        <span class="textCount">0자</span><span class="textTotal">/200자</span>
                    </div>
                    <textarea name="" id="" readonly>글자수세볼꺼예요몇글자가200자인지궁금해서한번써봅니다얼마나들어가나보자글자수세볼꺼예요몇글자가200자인지궁금해서한번써봅니다얼마나들어가나보자글자수세볼꺼예요몇글자가200자인지궁금해서한번써봅니다얼마나들어가나보자글자수세볼꺼예요몇글자가200자인지궁금해서한번써봅니다얼마나들어가나보자글자수세볼꺼예요몇글자가200자인지궁금해서한번써봅니다얼마나들어가나보자글자수세볼꺼예요몇글자가200</textarea>
                    
                </div>
                
                <!-- Modal footer -->
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                </div>
            
            </div>
        </div>
    </div>
</body>
</html>