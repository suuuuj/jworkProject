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
    /* 메뉴바영역 */
    .title{
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
    .overtimeList{
        margin-left:30px;
        margin-right: 30px;
        margin-top: 30px;
    }
    .selectBox{
        color:rgba(50, 50, 50);
        font-size: 15px;
        font-weight: 600;
    }
    .selectBox select{
        width:150px;
        height:30px;
        border:1px solid rgb(170, 170, 170);
        border-radius: 5px;
        color:rgb(50,50,50);
        font-weight: 500;
        font-size: 14px;
    }
    .overTable{
        width:100%;
        text-align: center;
        margin-top:30px;
        border-collapse: collapse;
        border-spacing: 0;
        font-size: 14px;
        color:rgb(51,51,51);
    }
    .overTable td{ 
        width:182px;
        height:30px;
        color:rgb(50,50,50);
        border-bottom: 1px solid rgb(234, 234, 234);
    }
    .overTable>tbody tr:hover{
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
            <h3 style="color:rgb(50,50,50); font-weight: 600;">신청<h3> 
        </div>
        <br>
        <div class="selectBar">
            <span>&nbsp;출장신청</span>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span>시간외 근무신청</span> 
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span>신청상세</span>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:rgb(0,172,0)">출장관리</span>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:rgb(0,172,0)">시간외 근무관리</span>
            <br>
            <div style="width:395px; background: rgb(234, 234, 234);">&nbsp;</div>
            <div style="width:115px; background: rgb(170, 170, 170);">&nbsp;</div>
            <div style="width:400px; background: rgb(234, 234, 234);">&nbsp;</div>
        </div>

        <div class="overtimeList">

            <div class="selectBox">
                <select name="" id="">
                    <option value="">&nbsp;- 진행상황 -</option>
                    <option value="">&nbsp;결재대기(1차)</option>
                    <option value="">&nbsp;결재대기(2차)</option>
                    <option value="">&nbsp;승인</option>
                    <option value="">&nbsp;반려</option>
                </select> 
            </div>

            <div class="overList">
                <table class="overTable">
                    <thead>
                        <tr style="font-weight: 600; background: rgb(234, 234, 234);">
                            <td width="40px">문서번호</td>
                            <td width="120px">사번</td>
                            <td width="120px">소속</td>
                            <td width="120px">직위</td>
                            <td width="120px">이름</td>
                            <td width="120px">조정일</td>
                            <td width="135px">제목</td>
                            <td width="135px">진행상황</td>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>46</td>
                            <td>4505301111</td>
                            <td>인사1팀</td>
                            <td>사원</td>
                            <td>김정만</td>
                            <td>2023.03.05</td>
                            <td>시간외 근무신청</td>
                            <td>결재대기(1차)</td>
                        </tr>
                        <tr>
                            <td>46</td>
                            <td>4505301111</td>
                            <td>인사1팀</td>
                            <td>사원</td>
                            <td>김정만</td>
                            <td>2023.03.05</td>
                            <td>시간외 근무신청</td>
                            <td>결재대기(1차)</td>
                        </tr>
                        <tr>
                            <td>46</td>
                            <td>4505301111</td>
                            <td>인사1팀</td>
                            <td>사원</td>
                            <td>김정만</td>
                            <td>2023.03.05</td>
                            <td>시간외 근무신청</td>
                            <td>결재대기(1차)</td>
                        </tr>
                        <tr>
                            <td>46</td>
                            <td>4505301111</td>
                            <td>인사1팀</td>
                            <td>사원</td>
                            <td>김정만</td>
                            <td>2023.03.05</td>
                            <td>시간외 근무신청</td>
                            <td>결재대기(1차)</td>
                        </tr>
                        <tr>
                            <td>46</td>
                            <td>4505301111</td>
                            <td>인사1팀</td>
                            <td>사원</td>
                            <td>김정만</td>
                            <td>2023.03.05</td>
                            <td>시간외 근무신청</td>
                            <td>결재대기(1차)</td>
                        </tr>
                        <tr>
                            <td>46</td>
                            <td>4505301111</td>
                            <td>인사1팀</td>
                            <td>사원</td>
                            <td>김정만</td>
                            <td>2023.03.05</td>
                            <td>시간외 근무신청</td>
                            <td>결재대기(1차)</td>
                        </tr>
                        <tr>
                            <td>46</td>
                            <td>4505301111</td>
                            <td>인사1팀</td>
                            <td>사원</td>
                            <td>김정만</td>
                            <td>2023.03.05</td>
                            <td>시간외 근무신청</td>
                            <td>결재대기(1차)</td>
                        </tr>
                        <tr>
                            <td>46</td>
                            <td>4505301111</td>
                            <td>인사1팀</td>
                            <td>사원</td>
                            <td>김정만</td>
                            <td>2023.03.05</td>
                            <td>시간외 근무신청</td>
                            <td>결재대기(1차)</td>
                        </tr>
                        <tr>
                            <td>46</td>
                            <td>4505301111</td>
                            <td>인사1팀</td>
                            <td>사원</td>
                            <td>김정만</td>
                            <td>2023.03.05</td>
                            <td>시간외 근무신청</td>
                            <td>결재대기(1차)</td>
                        </tr>
                        <tr>
                            <td>46</td>
                            <td>4505301111</td>
                            <td>인사1팀</td>
                            <td>사원</td>
                            <td>김정만</td>
                            <td>2023.03.05</td>
                            <td>시간외 근무신청</td>
                            <td>결재대기(1차)</td>
                        </tr>
                    </tbody>
                </table>
            </div>

            <script>
                $(function(){
                    $(".overTable>tbody tr").click(function(){
                        $("#myModal").modal('show')
                    })
                })
            </script>

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

    <!-- The Modal -->
    <div class="modal fade" id="myModal">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">
        
                <!-- Modal Header -->
                <div class="modal-header">
                <h4 class="modal-title">휴가신청</h4>
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