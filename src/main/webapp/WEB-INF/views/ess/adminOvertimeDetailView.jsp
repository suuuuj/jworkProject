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
    .overtimeOuter{
        padding:50px;
        margin:auto;
    }
    /* content영역 */
    .enrollForm{
        margin-top: 30px;
    }
    .header{
        display: flex;
    }
    input[type=text]{
        width:100px;
        border: 1px solid rgb(170, 170, 170);
        border-radius: 5px;
        text-align: center; 
    }
    #textBox{
        resize: none;
        width:690px;
        height:190px;
        border:1px solid rgb(170, 170, 170);
        border-radius: 5px;
        padding:10px;
    }
    button[type=button]{
        height:30px;
        width:60px;
        border-radius: 5px;
        font-size: 14px;
        line-height: 5px;
    }
    button[type=submit]{
        width:125px;
        height:30px;
        border-radius: 5px;
        font-size: 14px;
        line-height: 5px;
    }
    .textWrap{
        margin-left: 610px;
        margin-bottom: 5px;
        font-size: 13px;
        font-weight: 600;
        color:rgb(50,50,50)
    }
    .btnWrap button{
        width:50px;
        height:30px;
        font-size: 12px;
        line-height: 5px;
    }
</style>
</head>
<body>
    <jsp:include page="../common/menubar.jsp"/>
    <div class="overtimeOuter">

        <h4><b>신청</b></h4>

        
        <form action="" class="enrollForm" name="otEnroll">

            
            <div class="body">
                <div style="display: flex;">
                    <img src="resources/images/ess/pencil.png" alt="" style="width:30px; height:30px">
                    <div style="font-size: 13px; font-weight: 600; color:rgb(50,50,50); margin-top:4px; margin-left: 3px;">&nbsp;시간외 근무일정, 필요정보 입력</div>
                    <div style="background:rgb(234, 234, 234); width:629px; height:1px; margin-top:13px; margin-left: 20px;">&nbsp;</div>
                </div>

                <br>

                <div style="display: flex;">
                    <img src="resources/images/ess/mark.png" alt="" style="width:30px; height:30px">
                    <div style="font-size: 13px; font-weight: 600; color:rgb(50,50,50); margin-top:4px; margin-left: 3px;">
                        &nbsp;&nbsp;신청자&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input type="text" name="" value="${ ot.empName }"> 
                        &nbsp;소속&nbsp; <input type="text" name="" value="${ ot.deptName }"> 
                        <input type="hidden" name="empNo" value="${ ot.empNo }">
                    </div>
                    <div style="background:rgb(234, 234, 234); width:500px; height:1px; margin-top:13px; margin-left: 20px;">&nbsp;</div>
                </div>

                <br>

                <div style="display: flex;">
                    <img src="resources/images/ess/clock.png" alt="" style="width:30px; height:30px">
                    <div style="font-size: 13px; font-weight: 600; color:rgb(50,50,50); margin-top:4px; margin-left: 3px;">
                        &nbsp;구분&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
                        &nbsp;<input type="text" name="otCategory" value="${ot.otCategory}" id="">
                    </div>
                    <div style="background:rgb(234, 234, 234); width:639px; height:1px; margin-top:13px; margin-left: 20px;">&nbsp;</div>
                </div>

                <br>

                <div style="display: flex;">
                    <div style="font-size: 13px; font-weight: 600; color:rgb(50,50,50); margin-top:4px;">
                        &nbsp;근무날짜 / 시간&nbsp; <input type="text" name="enrollDate" value="${ot.enrollDate}"> 

                        <input type="text" name="otStart" value="${ot.otStart}" style="border:1px solid rgb(170, 170, 170); border-radius: 5px; width:80px; margin-left: 20px;">
                         <span style="font-size: 20px;">~</span>
                        <input type="text" name="otEnd" value="${ot.otEnd}" id="" style="border:1px solid rgb(170, 170, 170); border-radius: 5px; width:80px; height:23px">
                     </div>
                    <div style="background:rgb(234, 234, 234); width:450px; height:1px; margin-top:20px; margin-left: 5px;">&nbsp;</div>
                </div>

                <br><br>
                <div class="textWrap">
                    <span class="textCount">&nbsp;&nbsp;${ot.otContent.length()}자</span><span class="textTotal">/200자</span>
                </div>
                <textarea name="otContent" id="textBox" cols="30" rows="10" maxlength="199" placeholder="시간외 근무신청 내용을 입력해주세요.">${ot.otContent}</textarea>
                <div class="btnWrap" style="float: right; margin-top:160px;">
                    <button type="button" class="btn btn-success" id="otSubmit">승인</button>
                    <button type="button" class="btn btn-warning" id="otReturn">반려</button>
                    <button type="button" onclick="location.href='admin.ot'" class="btn btn-secondary">목록</button>
                </div>

            </div>

        </form>

        <script>

            $(function(){
                if(${not empty ot.secondDate}){
                    $("#otSubmit").attr("disabled", true);
                }
            })

            $(function(){
                $("#otSubmit").click(function(){
                    if(${empty ot.firstDate}){
                        if(confirm("시간외근무등록 1차승인을 진행하시겠습니까?")){
                            location.href = 'adminFirst.ot?otNo=${ot.otNo}';
                        }
                    }else{
                        if(confirm("시간외근무등록 2차승인을 진행하시겠습니까?")){
                            location.href = 'adminSecond.ot?otNo=${ot.otNo}';
                        }
                    }
                })
            })
        </script>

        <script>

            $(function(){
                if(${not empty ot.failDate} || ${not empty ot.secondDate}){
                    $("#otReturn").attr("disabled", true);
                }
            })

            $(function(){
                $("#otReturn").click(function(){
                    if(confirm("시간외근무등록을 반려하시겠습니까?")){
                        location.href='adminReturn.ot?otNo=${ot.otNo}';
                    }
                })
            })
        </script>


    </div>

</body>
</html>