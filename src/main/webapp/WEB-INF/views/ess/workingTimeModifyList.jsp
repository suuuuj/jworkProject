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
    .workSelect select{
        width:100px;
        height:30px;
        border-radius: 5px;
        border:1px solid rgb(170, 170, 170);
        font-size:14px;
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
    .workTable button{
        width:60px;
        height: 30px;
        font-size: 12px;
        line-height: 5px;
        color:white;
    }
    .workTable>tbody>tr:hover{
        opacity: 0.7;
        cursor: pointer;
    }
    .paging-area button{
        width:30px;
        height:30px;
        border:none;
        border-radius: 5px;
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
        float:right;
    }
    .modalS{
        display: inline-block;
        margin-bottom: 10px;
    }
    .modal-body textarea{
        resize: none;
        width:330px;
        height:130px;
        margin:auto;
        border:1px solid rgb(170, 170, 170);
        border-radius: 5px;
        padding:10px;
    }
    .textWrap{
        margin-left: 265px;
        margin-bottom: 5px;
        font-size: 13px;
        font-weight: 600px;
        color:rgb(50,50,50)
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
            <div style="width:173px; background: rgb(234, 234, 234);">&nbsp;</div>
            <div style="width:67px; background: rgb(170, 170, 170);">&nbsp;</div>
            <div style="width:660px; background: rgb(234, 234, 234);">&nbsp;</div>
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
            </div>

            <br>
            
            <table class="workTable">
                <thead>
                    <tr style="font-weight: 600; background-color: rgba(0, 172, 0, 0.075);">
                        <td>문서번호</td>
                        <td>조정일</td>
                        <td>제목</td>
                        <td>진행상황</td>
                        <td></td>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>46</td>
                        <td>2023.02.20</td>
                        <td>출퇴근시간변경</td>
                        <td>결재대기(1차)</td>
                        <td onclick="event.cancelBubble=true"><button class="btn btn-warning">취소</button></td>
                    </tr>
                    <tr>
                        <td>46</td>
                        <td>2023.02.20</td>
                        <td>출퇴근시간변경</td>
                        <td>승인</td>
                        <td><button class="btn btn-warning" disabled>취소</button></td>
                    </tr>
                    <tr>
                        <td>46</td>
                        <td>2023.02.20</td>
                        <td>출퇴근시간변경</td>
                        <td>반려</td>
                        <td><button class="btn btn-warning" disabled>취소</button></td>
                    </tr>
                    <tr>
                        <td>46</td>
                        <td>2023.02.20</td>
                        <td>출퇴근시간변경</td>
                        <td>결재대기(1차)</td>
                        <td><button class="btn btn-warning">취소</button></td>
                    </tr>
                    <tr>
                        <td>46</td>
                        <td>2023.02.20</td>
                        <td>출퇴근시간변경</td>
                        <td>결재대기(2차)</td>
                        <td><button class="btn btn-warning">취소</button></td>
                    </tr>
                    <tr>
                        <td>46</td>
                        <td>2023.02.20</td>
                        <td>출퇴근시간변경</td>
                        <td>결재대기(1차)</td>
                        <td><button class="btn btn-warning">취소</button></td>
                    </tr>
                    <tr>
                        <td>46</td>
                        <td>2023.02.20</td>
                        <td>출퇴근시간변경</td>
                        <td>결재대기(1차)</td>
                        <td><button class="btn btn-warning">취소</button></td>
                    </tr>

                    <tr>
                        <td>46</td>
                        <td>2023.02.20</td>
                        <td>출퇴근시간변경</td>
                        <td>결재대기(1차)</td>
                        <td><button class="btn btn-warning">취소</button></td>
                    </tr>
                    <tr>
                        <td>46</td>
                        <td>2023.02.20</td>
                        <td>출퇴근시간변경</td>
                        <td>결재대기(1차)</td>
                        <td><button class="btn btn-warning">취소</button></td>
                    </tr>
                    <tr>
                        <td>46</td>
                        <td>2023.02.20</td>
                        <td>출퇴근시간변경</td>
                        <td>결재대기(1차)</td>
                        <td><button class="btn btn-warning">취소</button></td>
                    </tr>
                </tbody>
            </table>
        </div>

        <script>
            $(function(){
                $(".workTable>tbody>tr").click(function(){
                    $("#workModal").modal('show');
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

    <!-- The Modal -->
    <div class="modal fade" id="workModal">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">
        
                <!-- Modal Header -->
                <div class="modal-header">
                <h4 class="modal-title" style="color:rgb(0,172,0)">출퇴근 시간변경</h4>
                <button type="button" class="close" data-dismiss="modal">&times;</button><br>
                </div>
                
                <!-- Modal body -->
                <div class="modal-body" style="width:360px; margin:auto;">
                    <span class="modalS">수정할 날짜</span> 
                    &nbsp;&nbsp;&nbsp;&nbsp;<input type="text" name="" value="&nbsp;&nbsp;2023.03.20" style="float:right;" readonly><br>
                    <span class="modalS">지정 출근시간</span> 
                    &nbsp;&nbsp;&nbsp;&nbsp;<input type="text" name="" value="&nbsp;&nbsp;09:20:53" readonly><br>
                    <span class="modalS">지정 퇴근시간</span>
                    &nbsp;&nbsp;&nbsp;&nbsp;<input type="text" name="" value="&nbsp;&nbsp;19:20:53" readonly><br>
                    <hr>
                    <span class="modalS">수정할 출근시간</span> 
                    &nbsp;&nbsp;&nbsp;&nbsp;<input type="text" name="" value="&nbsp;&nbsp;09:20:53" readonly><br>
                    <span class="modalS">수정할 퇴근시간</span>
                    &nbsp;&nbsp;&nbsp;&nbsp;<input type="text" name="" value="&nbsp;&nbsp;19:20:53" readonly><br>
                    <hr>
                    <span>신청사유</span>
                    <br>
                    <div class="textWrap">
                        <span class="textCount">0자</span><span class="textTotal">/100자</span>
                    </div>
                    <textarea name="" id="" readonly>100글자가얼마나되는지볼께요100글자가얼마나되는지볼께요100글자가얼마나되는지볼께요100글자가얼마나되는지볼께요100글자가얼마나되는지볼께요100글자가얼마나되는지볼께요100글자가얼마나되</textarea>
                    
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