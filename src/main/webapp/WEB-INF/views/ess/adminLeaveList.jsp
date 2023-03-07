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
    /* 메뉴영역 */
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
    .select-area select{
        width:150px;
        height:30px;
        border:1px solid rgb(170, 170, 170);
        border-radius: 5px;
        color:rgb(50,50,50);
        font-weight: 500;
        font-size: 14px;
    }
    .annualTable{
        width:100%;
        text-align: center;
        margin-top:30px;
        border-collapse: collapse;
        border-spacing: 0;
        font-size: 14px;
        color:rgb(51,51,51);
    }
    .annualTable td{
        width:182px;
        height:30px;
        color:rgb(50,50,50);
        border-bottom: 1px solid rgb(234, 234, 234);
    }
    .list-area input{
        border:none;
        height:30px;
        border-radius: 5px;
        width: 80px;
        height:20px;
        text-align: center;

    }
    .annualTable button{
        width:60px;
        height:30px;
        line-height: 5px;
        font-size: 12px;
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
            <span>&nbsp;휴가등록</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span>휴가상세</span> 
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:rgb(0, 172, 0)">휴가관리</span>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:rgb(0, 172, 0)">연차관리</span>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:rgb(0, 172, 0)">전체휴가일정</span>
            <br>
            <div style="width:255px; background: rgb(234, 234, 234);">&nbsp;</div>
            <div style="width:67px; background: rgb(170, 170, 170);">&nbsp;</div>
            <div style="width:578px; background: rgb(234, 234, 234);">&nbsp;</div>
        </div>

        <div class="vacation">

            <div class="select-area">
                <select name="" id="">
                    <option value="">&nbsp;- 연차부여현황 -</option>
                    <option value="">&nbsp;미부여</option>
                    <option value="">&nbsp;부여</option>
                </select> 
            </div>
            <br>
            <div class="list-area">
                <table class="annualTable">
                    <thead>
                        <tr style="font-weight: 600; background: rgb(234, 234, 234);">
                            <td width="100px;">사번</td>
                            <td width="120px;">소속</td>
                            <td width="120px;">직위</td>
                            <td width="120px;">이름</td>
                            <td width="100px;">발생</td>
                            <td width="100px;">사용</td>
                            <td width="100px;">잔여</td>
                            <td width="160px;">입사일</td>
                            <td width="90px;"></td>
                        </tr>
                    </thead>
                    
                    <tbody>
                        <tr >
                            <td>4505301111</td>
                            <td>개발1팀</td>
                            <td>사원</td>
                            <td>김정만</td>
                            <td><input type="text" name="create" value="0" max="15" readonly></td>
                            <td><input type="text" name="create" value="0" readonly></td>
                            <td><input type="text" name="use" value="0" readonly></td>
                            <td>2020.02.05</td>
                            <td><button class="btn btn-success" id="">연차</button></td>
                        </tr>
                    </tbody>
                </table>
            </div>

            <script>
                $(function(){
                    $(".annualTable tbody button").click(function(){
                        $("#annualModal").modal('show');
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
    <div class="modal fade" id="annualModal">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">
        
                <!-- Modal Header -->
                <div class="modal-header">
                <h4 class="modal-title">연차등록</h4>
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