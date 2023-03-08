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
    .enrollForm{
        margin-left:30px;
        margin-right: 30px;
        margin-top: 30px;
    }
    .header{
        display: flex;
    }
    input[type=text], input[type=date]{
        width:100px;
        height:25px;
        border: 1px solid rgb(170, 170, 170);
        border-radius: 5px;
    }
    .enrollForm select{
        width:120px;
        border:1px solid rgb(170, 170, 170);
        border-radius: 5px;
        height:25px;
    }
    textarea{
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
        font-size: 12px;
        line-height: 5px;
    }
    .textWrap{
        margin-left: 630px;
        margin-bottom: 5px;
        font-size: 13px;
        font-weight: 600;
        color:rgb(50,50,50)
    }
    label{
        font-size: 13px; 
        font-weight: 600; 
        color:rgb(50,50,50); 
        margin-left: 3px;
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
            <div style="width:88px; background: rgb(234, 234, 234);">&nbsp;</div>
            <div style="width:115px; background: rgb(170, 170, 170);">&nbsp;</div>
            <div style="width:697px; background: rgb(234, 234, 234);">&nbsp;</div>
        </div>

        <form action="insert.ot" class="enrollForm" name="otEnroll">

            
            <div class="body">
                <div style="display: flex;">
                    <img src="" alt="" style="width:30px; height:30px">
                    <div style="font-size: 13px; font-weight: 600; color:rgb(50,50,50); margin-top:4px; margin-left: 3px;">&nbsp;시간외 근무일정, 필요정보 입력</div>
                    <div style="background:rgb(234, 234, 234); width:658px; height:1px; margin-top:13px; margin-left: 20px;">&nbsp;</div>
                </div>

                <br>

                <div style="display: flex;">
                    <img src="" alt="" style="width:30px; height:30px">
                    <div style="font-size: 13px; font-weight: 600; color:rgb(50,50,50); margin-top:4px; margin-left: 3px;">
                        &nbsp;신청자&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input type="text" name="" value="로그인사원이름"> 
                        &nbsp;소속&nbsp; <input type="text" name="" value="로그인사원소속"> 
                    </div>
                    <div style="background:rgb(234, 234, 234); width:535px; height:1px; margin-top:13px; margin-left: 20px;">&nbsp;</div>
                </div>

                <br>

                <div style="display: flex;">
                    <img src="" alt="" style="width:30px; height:30px">
                    <div style="font-size: 13px; font-weight: 600; color:rgb(50,50,50); margin-top:4px; margin-left: 3px;">
                        &nbsp;구분&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
                        &nbsp;<select name="" id="">
                            <option value="">시간외 근무</option>
                            <option value="">야간</option>
                            <option value="">주말</option>
                        </select> 
                    </div>
                    <div style="background:rgb(234, 234, 234); width:659px; height:1px; margin-top:13px; margin-left: 20px;">&nbsp;</div>
                </div>

                <br>

                <div style="display: flex;">
                    <div style="font-size: 13px; font-weight: 600; color:rgb(50,50,50); margin-top:4px;">
                        근무날짜 / 시간&nbsp; <input type="date" name="" value="" style="width:150px;"> 
                        <select name="stTimeBox" style="border:1px solid rgb(170, 170, 170); border-radius: 5px; width:80px; margin-left: 20px;">
                            <script>
                                for(var i=0; i<49; i++){
                            var hour = "";
                            var min = ":00";
                            if((Math.ceil(i/2))<13){
                                hour = (Math.floor(i/2));
                            }else{
                                hour = (Math.floor(i/2));
                                if(hour<10){
                                    hour = "0"+hour;
                                }
                                if(i % 2 != 0){
                                    min = ":30";
                                }
                                document
                                .write('<option value=' + hour + min + '>' + hour + min + '</option>');
                            }
                        }
                            </script>
                        </select>
                        <span style="font-size: 20px;">~</span>
                        <select name="edTimeBox" id="" style="border:1px solid rgb(170, 170, 170); border-radius: 5px; width:80px; text-align: center; height:23px">
                            <script>
                                for(var i=0; i<49; i++){
                            var hour = "";
                            var min = ":00";
                            if((Math.ceil(i/2))<13){
                                hour = (Math.floor(i/2));
                            }else{
                                hour = (Math.floor(i/2));
                                if(hour<10){
                                    hour = "0"+hour;
                                }
                                if(i % 2 != 0){
                                    min = ":30";
                                }
                                document
                                .write('<option value=' + hour + min + '>' + hour + min + '</option>');
                            }
                        }
                            </script>
                        </select>&nbsp;
                    </div>
                    <div style="background:rgb(234, 234, 234); width:443px; height:1px; margin-top:20px; margin-left: 5px;">&nbsp;</div>
                </div>

                

                <br><br>
                <div class="textWrap">
                    <span class="textCount">0자</span><span class="textTotal">/200자</span>
                </div>
                <textarea name="" id="" cols="30" rows="10" placeholder="시간외 근무신청 내용을 입력해주세요."></textarea>
                <div style="float: right; margin-top:160px;">
                    <button type="button" class="btn btn-secondary">취소</button>
                    <button type="button" class="btn btn-success" style="width:120px;">시간외근무신청</button>
                </div>

            </div>

        </form>

        <script>
            function enrollMethod(){
                if(confirm("시간외 근무신청을 하시겠습니까?")){
                    document.otEnroll.submit();
                }
                
            }
        </script>


    </div>
</body>
</html>