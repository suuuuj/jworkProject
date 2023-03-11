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
    .leaveOuter{
        padding:4px;
        margin: auto;
    }
    /* 메뉴바영역 
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
    */
    /* content영역 */
    .enrollForm{
        margin-left:30px;
        margin-right: 30px;
        margin-top: 30px;
    }
    .header{
        display: flex;
    }
    input{
        width:100px;
        border: 1px solid rgb(170, 170, 170);
        border-radius: 5px;
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
        border:none;
        height:30px;
        width:50px;
        border-radius: 5px;
        color: rgba(50, 50, 50);
        font-weight: 600;
    }
    button[type=submit]{
        border:none;
        width:100px;
        height:30px;
        color:white;
        background-color: rgb(0, 174, 0);
        font-weight: 600;
        border-radius: 5px;
    }
    .textWrap{
        width:690px;
        text-align: right;
        margin-bottom: 5px;
        font-size: 13px;
        font-weight: 600;
        color:rgb(50,50,50)
    }
    .textWrap div{
        display: inline-block; 
    }
</style>
</head>
<body>
    <div class="leaveOuter">
        <h4><b>휴가</b></h4>
        <!--
        <div class="title">
            <h1 style="color:rgb(50,50,50)">휴가<h1> 
        </div>
        <br>
        <div class="selectBar">
            <span>&nbsp;휴가등록</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span>휴가상세</span> <br>
            <div style="width:67px; background: rgb(170, 170, 170);">&nbsp;</div>
            <div style="width:67px; background: rgb(234, 234, 234);">&nbsp;</div>
            <div style="width:766px; background: rgb(234, 234, 234);">&nbsp;</div>
        </div>
        -->

        <form action="enroll.le" method="" class="enrollForm" name="leEnroll">

            <div class="header">
                <img src="" alt="" style="width:50px; height:50px;">
                <div style="margin-left: 10px; margin-top:15px; color:rgba(50, 50, 50); font-size: 15px; font-weight: 600;">연차</div>
            </div>
            <br>
            <div class="body">
                <div style="display: flex;">
                    <img src="" alt="" style="width:30px; height:30px">
                    <div style="font-size: 13px; font-weight: 600; color:rgb(50,50,50); margin-top:4px; margin-left: 3px;">&nbsp;휴가일정, 필요정보 입력</div>
                    <div style="background:rgb(234, 234, 234); width:700px; height:1px; margin-top:13px; margin-left: 20px;">&nbsp;</div>
                </div>

                <br>

                <div style="display: flex;">
                    <img src="" alt="" style="width:30px; height:30px">
                    <div style="font-size: 13px; font-weight: 600; color:rgb(50,50,50); margin-top:4px; margin-left: 3px;">
                        &nbsp;신청자&nbsp; <input type="text" name="" value="로그인사원이름"> 
                        &nbsp;소속&nbsp; <input type="text" name="" value="로그인사원소속"> 
                    </div>
                    <div style="background:rgb(234, 234, 234); width:554px; height:1px; margin-top:13px; margin-left: 20px;">&nbsp;</div>
                </div>

                <br>

                <div style="display: flex;">
                    <img src="" alt="" style="width:30px; height:30px">
                    <div style="font-size: 13px; font-weight: 600; color:rgb(50,50,50); margin-top:4px; margin-left: 3px;">
                        시작일&nbsp;&nbsp; <input type="date" name="" value="" style="width:150px; text-align: center; height:20px;"> 
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;종료일&nbsp; <input type="date" name="" value="" style="width:150px; text-align: center; height:20px;"> 
                    </div>
                    <div style="background:rgb(234, 234, 234); width:427px; height:1px; margin-top:13px; margin-left: 20px;">&nbsp;</div>
                </div>

                <br><br>
                <div class="textWrap">
                    <div class="textCount">&nbsp;&nbsp;0자</div><div class="textTotal">/200자</div>
                </div>
                <textarea name="" id="textBox" cols="30" rows="10" maxlength="199" placeholder="휴가신청 내용을 입력해주세요."></textarea>
                <div style="float: right; margin-top:178px;">
                    <button type="button">취소</button>
                    <button type="submit" onclick="enrollMethod();">휴가등록하기</button>
                </div>

            </div>


        </form>

        <script>
            function enrollMethod(){
                if(confirm("휴가신청을 하시겠습니까?")){
                    document.leEnroll.submit();
                }
                
            };

        </script>

        <script>
            $(function(){
                $("#textBox").keyup(function(e){
                    let content = $(this).val();

                    if(content == 0 || content == ""){
                        $(".textCount").text('0자');
                    }else{
                        $('.textCount').text(content.length + '자');
                    }

                    if(content.length > 200){
                        $(this).val($(this).val().substring(0, 200));

                        alert("글자수는 200자까지 입력 가능합니다.");
                    };
                });
            })
        </script>











    </div>
</body>
</html>